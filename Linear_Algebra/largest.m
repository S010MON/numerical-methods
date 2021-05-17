## Author: leon <leon@pop-os>
## Created: 2021-05-17

function xMax = largest (v)
%Returns the largest value in vector v
    
    xMax = -inf;
    for i = 1:length(v)
      if v(i) > xMax
        xMax = v(i);
      endif
    endfor
endfunction
