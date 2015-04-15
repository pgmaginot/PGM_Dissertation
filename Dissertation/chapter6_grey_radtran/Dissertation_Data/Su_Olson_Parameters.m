% % % These are the parameters that we can choose
alpha = 4.0;
a = 1;
c_speed = 1;
kappa_t = 1;

% these are the parameters that Su-Olson derive
epsi = 4*a/alpha


% % % where we will look at the solution
tau_end = [1; 3.16228 ; 10];

non_dim_x_plot = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352  1.77828 3.16228 5.62341];  


n = length(non_dim_x_plot);
x_physical_end = zeros(1,n);

for i=1:1:n
    x_physical_end(i) = non_dim_x_plot(i)/kappa_t;
end

fprintf('Non-dimensional Plot Points\n')
for i=1:1:n
   fprintf('%8.6f\n',non_dim_x_plot(i)); 
end

fprintf('\n\nPhysical Plot Points\n')
for i=1:1:n
   fprintf('%8.6f\n',x_physical_end(i)); 
end

x0 = 0.5;
physical_x0 = x0/kappa_t;
fprintf('\nPhysical extent of source: %10.8f\n',physical_x0);

fprintf('\nSource turns off at t= %10.8f\n\n',10.0/(c_speed*kappa_t*epsi));

% % % % maximal dimensions needed for problem
for i=1:1:length(tau_end)
   fprintf('tau_end: %8.6f\n' , tau_end(i,1));
   t = tau_end(i,1)/(c_speed*kappa_t*epsi);
   fprintf('Physical time to end simulation: %10.8f\n' , t );
   fprintf('maximal slab size needed: %11.8f\n\n' , physical_x0 + t*c_speed);
end

% % % determine source strength needed

