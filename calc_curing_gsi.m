function [fmwood,fherbc,greenedup] =calc_curing(climcl,GSI,greenedup);
% experimental code that uses GSI to account for live fuel moisture
% GSIt is the GSI tendency, defined as GSI(today) minus GSI (yesterday)

%   # DECLARE CONSTANTS
%       # BOTH ANNUAL AND PERENNIALS WHEN GREEN (FHERBC ABOVE 120%)
herbga = [-70.0,-100.0,-137.5,-185.0];
herbgb = [12.8,14.0,15.5,17.4];

%       #ANNUALS DURING TRANSITION (FHERBC 30-120%)
hcurta = [-150.5,-187.7,-245.2,-305.2];
hcurtb = [18.4,19.6,22.0,24.3];

%       #PERENNIALS DURING TRANSITION
hlivta = [11.2,-10.3,-42.7,-93.5];
hlivtb = [7.4,8.3,9.8,12.2];

%       #SHRUBS OVER THE ENTIRE RANGE OF FMWOOD
wooda = [12.5,-5.0,-22.5,-45.0];
woodb = [7.5,8.2,8.9,9.8];

%       # PRE-SEASON AND POST-FREEZE VALUES FOR FMWOOD
pregrn = [50.0,60.0,70.0,80.0];


%woodaa=wooda(climcl);
%woodbb=woodb(climcl);
fmwodi=pregrn(climcl);

%fmwodf = woodaa + woodbb.* fm1000;

if GSI<0.5
    fmwood=pregrn(climcl);
    fherbc=30;
else
 if (GSI>0.5 & GSI<1) & ~greenedup
    fmwood=pregrn(climcl)+(200-pregrn(climcl))*(GSI-0.5);
    fherbc=30+(250-30)*(GSI-0.5);
 else
     if ~greenedup & GSI==1 greenedup=1;end
    fmwood=200*GSI;
    fherbc=250*GSI;
 end
end
