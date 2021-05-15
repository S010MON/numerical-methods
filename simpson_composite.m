
function retval = simpson_composite (f, a, b)

  h = (b - a) / 6;
  x = a : h : b;
  sum = 0;
  
  for i = 1:length(x)
    if i == 1 || i == length(x)
      sum = sum + f(x(i));
    elseif rem(i, 2) == 0
      sum = sum + (4 * f(x(i)));
    else
      sum = sum + (2 * f(x(i)));
    end%if
  end%for
  retval  = (h/3) * sum;
  
endfunction