function [T,X]=odeSIE(fun,tspan,x0,y0)
%ODE simple integration using semi-implicit Euler
%fun-handle with interface fun (t,x)
%tspan-two element vector with dt and tend
%x0-initial conditions

%time step
dt=tspan(1);
T=0:dt:tspan(2);
n =length (T);

X=zeros (length(x0),n);
Y=zeros (length(y0),n);
%populate initial conditions
X(:,1)=x0(:);
Y(:,1)=y0(:);
%compute the solution
for i=2:n
    Y(:,i) = Y(:,i-1)+dt*fun(T(i-1), X(:, i-1));  
    X(:,i) = X(:,i-1)+dt*fun(T(i-1), Y(:, i));
     
end
end