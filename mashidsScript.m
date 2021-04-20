% mahshid ghaffari 6255201

% ------------ the answer for seccond part-------------------------------

% the abs error with h = 0.1 is  0.0010582
% the abs error with h = 0.05 is  0.00012483
% when we halve the stepsize (h = 0.05) we are gonna get more acurate answer and the abs error will be reduce as well.

% ----------------------------------------------------------------------

f = @(t,y) sin(t) + y - y^3;
finalT = 6;
w(1) = 2;
h = 0.1;
exactVal = -0.6599693029;
absError = @(exP , p) abs(exP - p);

AdamBashforth = @(w, t, h, i) w(i) + (1/12) * h * ( 23 * f(t(i), w(i)) - 16 *f(t(i-1), w(i-1)) + 5 * f(t(i-2), w(i-2)));
accurency = 0.001;
seccantMethode = @(n,p,fp) p(n)-((p(n)-p(n-1))/(fp(n)-fp(n-1)))*fp(n);

% make and array of t in respect to the h
  for i = 1: (finalT/h) +1

     t(i) = (i * h)-h; 

   end

  % Runge-Kutta method for calculating the intial value 
   k_11 = h * f(t(1),w(1)); 
   k_12 = h * f(t(1) + ((1/2) * h) , w(1)+((1/2)*k_11));
   k_13 = h * f(t(1) +h , w(1)-k_11 + (2*k_12) );
   w(2) = w(1) + ((1/6)*(k_11+ (4* k_12)+ k_13) );

   k_21 = h * f(t(2),w(2)); 
   k_22 = h * f(t(2) + ((1/2) * h) , w(2)+((1/2)*k_21));
   k_23 = h * f(t(2) +h , w(2)-k_21 + (2*k_22) );
   w(3) = w(2) + ((1/6)*(k_21+ (4* k_22)+ k_23) );

   for j= 3 : (finalT/h) 
     w(j+1) =  AdamBashforth(w , t , h , j);
   end

errorAbs =  absError(exactVal , w((finalT/h) +1));

change = find(diff(sign(w))); 

 % creating a p and fp array p is made of t and fp from w array  
  p(1) = t(change); 
  p(2) = t(change+1); 
  fp(1) = w(change);
  fp(2) = w(change+1); 

% in here we are going to calculate the fp(n+1) by Runge-Kutta method in order to use it in secant methods
% also for calculating the step size there is an if statment to check the lowest distance from p(n) and p(n+1) or p(n-1)

  n=2;
  while abs(p(n)-p(n-1)) > accurency
    p(n+1) = seccantMethode(n,p,fp);
   
    if abs(p(n+1)-p(n)) < abs(p(n+1)-p(n-1)) 
       ht = abs(p(n+1)-p(n));
    else
       ht = abs(p(n+1)-p(n-1));
    end

    kt_n1 = ht * f(p(n-1),fp(n-1)); 
    kt_n2 = ht * f(p(n-1) + ((1/2) * ht) , fp(n-1)+((1/2)*kt_n1));
    kt_n3 = ht * f(p(n-1) +ht , fp(n-1)-kt_n1 + (2*kt_n2) );
    fp(n+1) = fp(n-1) + ((1/6)*(kt_n1+ (4* kt_n2)+ kt_n3) );    
    n = n +1 ;
  end