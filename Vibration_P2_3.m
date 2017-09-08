m=0.5;k=80;
dt=0.001;tmax=2;Fmax=100;Ft0=0.2;
t=0:dt:tmax;F=[0:100*dt/Ft0:Fmax zeros(1,numel(t)-Ft0/dt-1)];
x0=[0 0];
x=zeros(2,numel(t));
x(:,1)=x0;
%
for i=1:numel(t)-1
    dx2=(F(i)-k*x(1,i))/m;
    dx1=x(2,i)+dx2*dt;
    x(2,i+1)=dx1;
    x(1,i+1)=x(1,i)+dx1*dt;
end
plot(t,x(1,:))

x=zeros(2,numel(t));
for i=1:numel(t)-1
    if i == 1
        xDotMHalf = (x(1,i)-0)/dt;
    else
        xDotMHalf = (x(1,i)-x(1,i-1))/dt;
    end
    ddx=(F(i)-k*x(1,i))/m;
    xDotPHalf = xDotMHalf+ddx*dt;
    x(1,i+1)=x(1,i)+ xDotPHalf*dt;
end
hold on,plot(t,x(1,:),'--')
