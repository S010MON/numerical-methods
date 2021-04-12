function [r] = rnd(x,d)
% This function rounds x to d decimal digits.
if x == 0
  r = 0;
else
  ee = fix(log10(abs(x)));
  if abs(x) > 1
     ee = ee + 1;
  end;   
  r = round(x*10^(d-ee))*10^(ee-d);
end;
