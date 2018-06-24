s1='3*x1-cos(x2*x3)-1/2';
s2='x1.^2-81*(x2+0.1)^2+sin(x3)+1.06';
s3='exp(-x1*x2)+20*x3+1/3*(10*pi-3)';
ss = {s1, s2, s3};
x = rand(3,1)-0.5;
J = ones(3,3);  h = 0.001;
for i =1:3
    f = inline(ss{i});
    x1_phy_h = (f(x(1)+h,x(2),x(3))-f(x(1)-h,x(2),x(3)))/(2*h);
    x1_phy_h2 = (f(x(1)+h/2,x(2),x(3))-f(x(1)-h/2,x(2),x(3)))/(2*h/2);
    f_x1_plum = x1_phy_h2+1/3*(x1_phy_h2-x1_phy_h);
    J(i,1) = f_x1_plum;
    x2_phy_h = (f(x(1),x(2)+h,x(3))-f(x(1),x(2)-h,x(3)))/(2*h);
    x2_phy_h2 = (f(x(1),x(2)+h/2,x(3))-f(x(1),x(2)-h/2,x(3)))/(2*h/2);
    f_x2_plum = x2_phy_h2+1/3*(x2_phy_h2-x2_phy_h);
    J(i,2) = f_x2_plum;
    x3_phy_h = (f(x(1),x(2),x(3)+h)-f(x(1),x(2),x(3)-h))/(2*h);
    x3_phy_h2 = (f(x(1),x(2),x(3)+h/2)-f(x(1),x(2),x(3)-h/2))/(2*h/2);
    f_x3_plum = x3_phy_h2+1/3*(x3_phy_h2-x3_phy_h);
    J(i,3) = f_x3_plum;
end
J
