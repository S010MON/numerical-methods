function [ s ] = flt2bin( x )
%UNTITLED Convert a floating-point number to a binary string

    if x==0
        s='0.0';
        return
    end
    
    n=0;
    s='';
    if x<0
        s='-';
        x=-x;
    end
    
    while x>=1.0
        n=n+1;
        x=x/2;
    end

    if n<0
    	s=strcat(s,'.');
    end
    
    while (x~=0 | n>=0)
        if n==0
            s=strcat(s,'.');
        end
        
        if x>=0.5
            s=strcat(s,'1');
            x=2*x-1;
        else
            s=strcat(s,'0');
            x=2*x;
        end
        n=n-1;
    end

end

