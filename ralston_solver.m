## Copyright (C) 2021 Leon Debnath
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} ralston_solver (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Leon Debnath
## Created: 2021-04-14

function y = ralston_solver (f,t0,tn,y,h)

    w0 = y;
    while t0 < tn
       k1 = h * f(t0,w0)
       %fprintf("k1 = " k1);       
       k2 = h * f((t0 + (2*h/3)) , (w0 + (2*k1/3)))
       %fprintf("k2 = " k2);    
       w1 = w0 + (1/4 * k1) + (3/4 *k2)
       %fprintf("y = " w1);        
     
       w0 = w1;
       t0 = t0+h;
    endwhile
    y = w1;

endfunction
