
function sNorm = sup_norm (vector)
    
     [v, p] = max(abs(vector));
    sNorm = v * sign(vector(p));

endfunction
