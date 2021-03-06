function [daylit]=calcDaylight(j_date,latdec);
phi = 0;
xfact = 0;
decl = 0;
tla = 0;
f=find(j_date>365);
j_date(f)=365;
phi=latdec*.01745;
decl=.41008*sin((j_date-82)*.01745);
daylit=24*(1-acos(tan(phi)*tan(decl))/3.14159);daylit=real(daylit);