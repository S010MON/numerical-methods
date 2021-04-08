classdef Rounded
    % Rounded class implementing rounded arithmetic to a fixed number of decimal places
    % by Pieter Collins 09/04/2019
    properties
        value     %rounded value
        precision %number of decimal places
    end 
    methods
        function r = Rounded(v,pr)
            %AutoDiff1 class constructor; only the bottom case is needed.
            assert (nargin ~= 1)
            if nargin == 1,
                pr=3;
            end
            assert(numel(v)==1);
            assert(numel(pr)==1);
            r.value = rnd(v,pr); %given value
            r.precision = pr; %given precision
        end
        function r = plus(x,y)
            assert(numel(x)==1); assert(numel(y)==1);
            if ~isa(x,'Rounded'), x=Rounded(x,y.precision); end; %x is a value
            if ~isa(y,'Rounded'), y=Rounded(y,x.precision); end; %y is a value
            r = Rounded(x.value+y.value, min(x.precision,y.precision));
        end
        function r = minus(x,y)
            assert(numel(x)==1); assert(numel(y)==1);
            if ~isa(x,'Rounded'), x=Rounded(x,y.precision); end; %x is a value
            if ~isa(y,'Rounded'), y=Rounded(y,x.precision); end; %y is a value
            r = Rounded(x.value-y.value, min(x.precision,y.precision));
        end   
        function r = times(x,y)
            %Rounded/TIMES overloads multiplication .* with at least one Rounded object argument
            assert(numel(x)==1); assert(numel(y)==1);
            if ~isa(x,'Rounded'), x=Rounded(x,y.precision); end; %x is a value
            if ~isa(y,'Rounded'), y=Rounded(y,x.precision); end; %y is a value
            r = Rounded(x.value*y.value, min(x.precision,y.precision));
        end
        function r = mtimes(x,y)
            %Rounded/MTIMES overloads multiplication * with at least one Rounded object argument
            r = times(x,y);
        end
        function r = rdivide(x,y)
            %Rounded/DIVIDE overloads division ./ with at least one Rounded object argument
            assert(numel(x)==1); assert(numel(y)==1);
            if ~isa(x,'Rounded'), x=Rounded(x,y.precision); end; %x is a value
            if ~isa(y,'Rounded'), y=Rounded(y,x.precision); end; %y is a value
            r = Rounded(x.value/y.value, min(x.precision,y.precision));
        end
        function r = mrdivide(x,y)
            %Rounded/MRDIVIDE overloads division / with at least one Rounded object argument
            r = rdivide(x,y);
        end
        function r = power(x,y)
            %Rounded/POWER  power for at least one Rounded object argument
            assert(numel(x)==1); assert(numel(y)==1);
            if ~isa(x,'Rounded'), x=Rounded(x,y.precision); end; %x is a value
            if ~isa(y,'Rounded'), y=Rounded(y,x.precision); end; %y is a value
            r = Rounded(x.value^y.value, min(x.precision,y.precision));
        end
        function r = mpower(x,y)
            %Rounded/MPOWER overloads power ^ with at least one Rounded object argument
            r = power(x,y);
        end
        function r = uminus(x)
            %Rounded/UMINUS overloads negation - with a Rounded object argument
            assert(numel(x)==1); r = Rounded(-x.value, x.precision);
        end
        function r = rec(x)
            assert(numel(x)==1); r = Rounded(1/x.value, x.precision);
        end
        function r = sqrt(x)
            assert(numel(x)==1); r = Rounded(sqrt(x.value), x.precision);
        end
        function r = exp(x)
            assert(numel(x)==1); r = Rounded(exp(x.value), x.precision);
        end
        function r = log(x)
            assert(numel(x)==1); r = Rounded(log(x.value), x.precision);
        end
        function r = sin(x)
            assert(numel(x)==1); r = Rounded(sin(x.value), x.precision);
        end
        function r = cos(x),
            assert(numel(x)==1); r = Rounded(cos(x.value), x.precision);
        end
        function r = tan(x),
            assert(numel(x)==1); r = Rounded(tan(x.value), x.precision);
        end
        function r = ssin(x)
            assert(numel(x)==1); r = Rounded(ssin(x.value), x.precision);
        end
        function r = scos(x),
            assert(numel(x)==1); r = Rounded(scos(x.value), x.precision);
        end
        function r = stan(x),
            assert(numel(x)==1); r = Rounded(stan(x.value), x.precision);
        end
    end
end

