
function error = relError (pStar, pAct)
    error = abs(pStar - pAct) / abs(pAct);
endfunction
