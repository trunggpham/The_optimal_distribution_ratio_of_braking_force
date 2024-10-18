function F = objective_function(X)
A = X(1);
B = X(2);
hg = 0.56;
a = 1.463;
b = 1.585;
l = a+b;
Rw = 0.283;
Kt = 3800;
Mm = 0.3;
Am = 0.00152;
Km = 1600000;
Cm = 1200;
k = 10; 
tp = 1.5;
Aw = 0.00785;
kt = 0.98;
ke = 0.18;
R = 24;
wm = 31.667; % 1900 r/min = 31.667r/s
F = 1600;
w0 = 40;
maxs1 = (l*B-b)/hg;
mins2 = (l*B-b)/hg;
X = @(x) abs((Kt.*Am.*(1+tp.*1i.*x))./((Aw.*(1+A).*(-Mm.*tp.*1i.*x.^3-(Mm+Cm.*tp).*x.^2+(Cm+Km.*tp).*1i.*x + (Km-k*Kt))))).^2;
%P = @(x) ((Rw.*F.*(R.*Rw.*F + ke.*kt.*wm.*(1+1./A)))./(kt.^2.*(1+1/A).^2));
s1 = @(x) (b./l)./(B - x.*hg/l);
s2 = @(x) (a./l)./(1 - B + x.*hg/l);
s3 = @(x) abs(((1-B)*l*x/(a-hg*x))-x);
s4 = @(x) abs((B*l*x/(b+hg*x))-x);
% f1, f2, f3, f4 funtions

%f1 = (1/2*pi*w0)*integral(X,0,w0);
f2 = ((Rw.*F.*(R.*Rw.*F + ke.*kt.*wm.*(1+1./A)))./(kt.^2.*(1+1/A).^2));
%f1 = integral(s1,0,maxs1) + integral(s2,mins2,1);
%f2 = integral(s1,0,maxs1) + integral(s2,mins2,1);
f3 = integral(s1,0,maxs1) + integral(s2,mins2,1);
f4 = -integral(s3,0,1)-integral(s4,0,1);
%f4 = integral(s1,0,maxs1) + integral(s2,mins2,1);

F = [f2 f3 f4];