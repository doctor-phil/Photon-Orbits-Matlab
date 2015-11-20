figure
hold on
grid on

xycrossy = [];
xyprevy = [];
xycrossx = [];
xyprevx = [];
xycrossr = [];
xycrossphi = [];
xyprevr = [];
distx  = [];
disty = [];
distrat = [];
alpha = [];

for dr = -.000022:0.0000001:.0000079
    phi0 = 0;
    r0 = 3;
    rs = 1;
    h = 0.00001;

    u0 = rs/r0;
    phi = phi0 + h;
    u1 = rs/(r0+dr);
    u = [u0, u1];
    r = [r0, r0+dr];
    phir = [phi0, phi];
    x = [r0*cos(phi0), r(1)*cos(phi)];
    y = [r0*sin(phi0), r(1)*sin(phi)];
    yn = 1;
    while yn == 1
        u2 = (2+((h^2)*(((3/2)*u1)-1)))*u1-u0;
        u(end+1)=u2;
        u0 = u1;
        u1 = u2;
        phi = phi + h;    
        if rs/u2 > 1
            phir(end+1)=phi;
            r(end+1)=rs/u2;
            x(end+1)=(rs/u2)*cos(phi);
            y(end+1)=(rs/u2)*sin(phi);
        elseif rs/u2 == 1
            phir(end+1)=phi;
            r(end+1)=rs/u2;
            x(end+1)=(rs/u2)*cos(phi);
            y(end+1)=(rs/u2)*sin(phi);
            yn = 0;
        else
            yn = 0;
        end;
    
        if x(end)<=-2 && x(end-1)>-2
            xycrossr(end+1)=r(end);
            xyprevr(end+1)=r(end-1);
            xycrossphi(end+1)=phi;
            xycrossy(end+1) = y(end);
            xyprevy(end+1) = y(end-1);
            xycrossx(end+1) = x(end);
            xyprevx(end+1) = x(end-1);
        end;
    end;
    grid on
    plot(x,y,'blue')
end;

plot(cos(0:0.01:2*pi),sin(0:0.01:2*pi),'r')
plot(-2,-100:0.01:100)
xlim([-r0-1,r0+1])
ylim([-r0-1,r0+1])

figure
grid on

distx = xycrossx-xyprevx;
disty = xycrossy-xyprevy;
for i=1:300
    distrat(i) = disty(i)/distx(i);
    alpha(i) = atan(distrat(i));
end;
    
plot(xycrossy,alpha);
xlabel('Starting Y on the line X=2');
ylabel('Alpha, the initial angle of the ray from horizontal')

deltar = xyprevr-xycrossr;

figure
hold on
grid on
for i=1:300
    phi0 = pi-xycrossphi(i);
    r0=xycrossr(i);
    rs = 1;
    h = 0.00001;
    dr = deltar(i);

    u0 = rs/r0;
    phi = phi0 + h;
    u1 = rs/(r0+dr);
    u = [u0, u1];
    r = [r0, r0+dr];
    phir = [phi0, phi];
    x = [r0*cos(phi0), r(1)*cos(phi)];
    y = [r0*sin(phi0), r(1)*sin(phi)];
    yn = 1;
    while yn == 1
        u2 = (2+((h^2)*(((3/2)*u1)-1)))*u1-u0;
        u(end+1)=u2;
        u0 = u1;
        u1 = u2;
        phi = phi + h;    
        if rs/u2 > 1
            phir(end+1)=phi;
            r(end+1)=rs/u2;
            x(end+1)=(rs/u2)*cos(phi);
            y(end+1)=(rs/u2)*sin(phi);
        elseif rs/u2 == 1
            phir(end+1)=phi;
            r(end+1)=rs/u2;
            x(end+1)=(rs/u2)*cos(phi);
            y(end+1)=(rs/u2)*sin(phi);
            yn = 0;
        else
            yn = 0;
        end;
    end;
    plot(x,y,'blue')
end;
plot(cos(0:0.01:2*pi),sin(0:0.01:2*pi),'r')
plot(2,-100:.01:100,'red')
xlim([-15,15])
ylim([-15,15])