
function mu = estimate_eigenvalue (A, x)

    mu = (x' * A * x) / ( x' * x);

endfunction
