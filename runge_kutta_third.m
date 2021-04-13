function y = runge_kutta_third(f,t0,tn,y,h)
   % Heun's third order method of solving differential equations
   
    w0 = y;
    while t0 < tn
       k1 = h * f(t0,w0);                                               % Calculate left endpoint
       k2 = h * f((t0 + (h/3)) , (w0 + (k1/3)));               % Calculate first third
       k3 = h * f((t0 + (2*h/3)) , (w0 + (2*k2/3)));        % Calculate second third
       w1 = w0 + 1/4 * ( k1 + (3*k3));                         % set the next state to the average of the two endpoints  
       
       w0 = w1;
       t0 = t0+h;
    endwhile
    y = w1;
endfunction
