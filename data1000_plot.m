%%% Plotting of Data  %%%
load data1000.dat Anew
load data1000new.dat B
load cover_types.dat C

n=size(Anew,1)

cover1 = find(Anew(:,55)==1);
cover2 = find(Anew(:,55)==2);
cover3 = find(Anew(:,55)==3);
cover4 = find(Anew(:,55)==4);
cover5 = find(Anew(:,55)==5);
cover6 = find(Anew(:,55)==6);
cover7 = find(Anew(:,55)==7);

x1=Anew(cover1,1); #elevation
y1=Anew(cover1,3); #slope
z1=Anew(cover1,4); #hydrology horizontal
x2=Anew(cover2,1);
y2=Anew(cover2,3);
z2=Anew(cover2,4);
x3=Anew(cover3,1);
y3=Anew(cover3,3);
z3=Anew(cover3,4);
x4=Anew(cover4,1);
y4=Anew(cover4,3);
z4=Anew(cover4,4);
x5=Anew(cover5,1);
y5=Anew(cover5,3);
z5=Anew(cover5,4);
x6=Anew(cover6,1);
y6=Anew(cover6,3);
z6=Anew(cover6,4);
x7=Anew(cover7,1);
y7=Anew(cover7,3);
z7=Anew(cover7,4);

figure(1);
plot(x1,y1,"bx",x2,y2,"rx",x3,y3,"gx")
axis([1500 4000 0 50]);
xlabel('elevation');
ylabel('slope');
title('Elevation vs Slope (1-3)');
print -dpng 'elevation_vs_slopel.png';

figure(2);
x4=Anew(cover4,1);
y4=Anew(cover4,3);
x5=Anew(cover5,1);
y5=Anew(cover5,3);
x6=Anew(cover6,1);
y6=Anew(cover6,3);
x7=Anew(cover7,1);
y7=Anew(cover7,3);
plot(x4,y4,"yx",x5,y5,"mx",x6,y6,"cx",x7,y7,"kx")
axis([1500 4000 0 50]);
xlabel('elevation');
ylabel('slope');
title('Elevation vs Slope (4-7)');
print -dpng 'elevation_vs_slope2.png';

figure(3);
plot(x1,z1,"bx",x2,z2,"rx",x3,z3,"gx")
axis([1500 4000 0 600]);
xlabel('elevation');
ylabel('hydrology distance');
title('Elevation vs Hydrology distance');
print -dpng 'elevation_vs_hydrologyl.png';

figure(4);
area11 = find(Anew(:,11)==1 & Anew(:,55)==1);
area12 = find(Anew(:,11)==1 & Anew(:,55)==2);
%area13 = find(Anew(:,11)==1 & Anew(:,55)==3);
%area14 = find(Anew(:,11)==1 & Anew(:,55)==4);
area15 = find(Anew(:,11)==1 & Anew(:,55)==5);
%area16 = find(Anew(:,11)==1 & Anew(:,55)==6);
area17 = find(Anew(:,11)==1 & Anew(:,55)==7);
hist(Anew(area11,55),20, "facecolor", "b")
hold on;
hist(Anew(area12,55),20, "facecolor", "r")
%hold on;
%hist(Anew(area13,55),20, "facecolor", "g")
%hold on;
%hist(Anew(area14,55),20, "facecolor", "y")
hold on;
hist(Anew(area15,55),20, "facecolor", "m")
%hold on;
%hist(Anew(area16,55),20, "facecolor", "c")
hold on;
hist(Anew(area17,55),20, "facecolor", "k")
hold off;
legend('1','2','5','7');
title('Wilderness Area 1');
print -dpng 'wilderness_area1.png';

figure(5);
area21 = find(Anew(:,12)==1 & Anew(:,55)==1);
area22 = find(Anew(:,12)==1 & Anew(:,55)==2);
%area23 = find(Anew(:,12)==1 & Anew(:,55)==3);
%area24 = find(Anew(:,12)==1 & Anew(:,55)==4);
%area25 = find(Anew(:,12)==1 & Anew(:,55)==5);
%area26 = find(Anew(:,12)==1 & Anew(:,55)==6);
area27 = find(Anew(:,12)==1 & Anew(:,55)==7);
hist(Anew(area21,55),20, "facecolor", "b")
hold on;
hist(Anew(area22,55),20, "facecolor", "r")
%hold on;
%hist(Anew(area23,55),20, "facecolor", "g")
%hold on;
%hist(Anew(area24,55),20, "facecolor", "y")
%hold on;
%hist(Anew(area25,55),20, "facecolor", "m")
%hold on;
%hist(Anew(area26,55),20, "facecolor", "c")
hold on;
hist(Anew(area27,55),20, "facecolor", "k")
hold off;
legend('1','2','7');
title('Wilderness Area 2');
print -dpng 'wilderness_area2.png';

figure(6);
area31 = find(Anew(:,13)==1 & Anew(:,55)==1);
area32 = find(Anew(:,13)==1 & Anew(:,55)==2);
area33 = find(Anew(:,13)==1 & Anew(:,55)==3);
%area34 = find(Anew(:,13)==1 & Anew(:,55)==4);
area35 = find(Anew(:,13)==1 & Anew(:,55)==5);
area36 = find(Anew(:,13)==1 & Anew(:,55)==6);
area37 = find(Anew(:,13)==1 & Anew(:,55)==7);
hist(Anew(area31,55),20, "facecolor", "b")
hold on;
hist(Anew(area32,55),20, "facecolor", "r")
hold on;
hist(Anew(area33,55),20, "facecolor", "g")
%hold on;
%hist(Anew(area34,55),20, "facecolor", "y")
hold on;
hist(Anew(area35,55),20, "facecolor", "m")
hold on;
hist(Anew(area36,55),20, "facecolor", "c")
hold on;
hist(Anew(area37,55),20, "facecolor", "k")
hold off;
legend('1','2','3','5','6','7');
title('Wilderness Area 3');
print -dpng 'wilderness_area3.png';

figure(7);
%area41 = find(Anew(:,14)==1 & Anew(:,55)==1);
area42 = find(Anew(:,14)==1 & Anew(:,55)==2);
area43 = find(Anew(:,14)==1 & Anew(:,55)==3);
area44 = find(Anew(:,14)==1 & Anew(:,55)==4);
%area45 = find(Anew(:,14)==1 & Anew(:,55)==5);
area46 = find(Anew(:,14)==1 & Anew(:,55)==6);
%area47 = find(Anew(:,14)==1 & Anew(:,55)==7);
%hist(Anew(area41,55),20, "facecolor", "b")
%hold on;
hist(Anew(area42,55),20, "facecolor", "r")
hold on;
hist(Anew(area43,55),20, "facecolor", "g")
hold on;
hist(Anew(area44,55),20, "facecolor", "y")
%hold on;
%hist(Anew(area45,55),20, "facecolor", "m")
hold on;
hist(Anew(area46,55),20, "facecolor", "c")
%hold on;
%hist(Anew(area47,55),20, "facecolor", "k")
hold off;
legend('2','3','4','6');
title('Wilderness Area 4');
print -dpng 'wilderness_area4.png';

% Histogram elevation
figure(8);  % ends up GAUSSIAN
hist(Anew(cover1,1),20, "facecolor", "b")
hold on;
hist(Anew(cover2,1),20, "facecolor", "r")
hold off;
legend('1','2');
title('Elevation and Cover Type');
xlabel('Elevation');
print -dpng 'elevation_distributions 1 2.png';

figure(9);  % ends up GAUSSIAN
hist(Anew(cover3,1),50, "facecolor", "g")
hold on;
hist(Anew(cover4,1),50, "facecolor", "y")
hold on;
hist(Anew(cover5,1),50, "facecolor", "m")
hold on;
hist(Anew(cover6,1),50, "facecolor", "c")
hold on;
hist(Anew(cover7,1),50, "facecolor", "k")
hold off;
legend('3','4','5','6','7');
title('Elevation and Cover Type');
xlabel('Elevation');
print -dpng 'elevation_distributions 3-7.png';

% Histogram elevation
figure(10);  % ends up GAUSSIAN
hist(Anew(cover1,1),20, "facecolor", "b")
hold on;
hist(Anew(cover2,1),20, "facecolor", "r")
hold on;
hist(Anew(cover3,1),20, "facecolor", "g")
hold on;
hist(Anew(cover4,1),20, "facecolor", "y")
hold on;
hist(Anew(cover5,1),20, "facecolor", "m")
hold on;
hist(Anew(cover6,1),20, "facecolor", "c")
hold on;
hist(Anew(cover7,1),20, "facecolor", "k")
hold off;
legend('1','2','3','4','5','6','7');
title('Elevation and Cover Type');
xlabel('Elevation');
print -dpng 'elevation_distributions.png';

% new cover type feature

cover1c = find(C(:,3)==1);
cover2c = find(C(:,3)==2);
cover3c = find(C(:,3)==3);
cover4c = find(C(:,3)==4);
cover5c = find(C(:,3)==5);
cover6c = find(C(:,3)==6);
cover7c = find(C(:,3)==7);

x1c=C(cover1c,1); #elevation
y1c=C(cover1c,2); #soil type new feature
x2c=C(cover2c,1);
y2c=C(cover2c,2);
x3c=C(cover3c,1);
y3c=C(cover3c,2);
x4c=C(cover4c,1);
y4c=C(cover4c,2);
x5c=C(cover5c,1);
y5c=C(cover5c,2);
x6c=C(cover6c,1);
y6c=C(cover6c,2);
x7c=C(cover7c,1);
y7c=C(cover7c,2);


figure(11);
plot(y1c,x1c,"bx",y2c,x2c,"rx",y3c,x3c,"gx")
axis([8 50 1500 4000]);
xlabel('soil type');
ylabel('elevation');
title('Elevation vs soil (1-3)');
print -dpng 'elevation_vs_soill.png';

figure(12);
plot(y3c,x3c,"gx",y4c,x4c,"yx",y5c,x5c,"mx",y6c,x6c,"cx",y7c,x7c,"kx")
axis([8 50 1500 4000]);
xlabel('soil type');
ylabel('elevation');
title('Elevation vs soil (4-7)');
print -dpng 'elevation_vs_soil2.png';



