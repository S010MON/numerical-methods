clc
clear
close all
    
m = ones(12,12);

for i = 1:size(m)
    for j = 1:size(m)
        if isEven(j) && isOdd(i)
            m(i,j) = 0;
        end
        if isEven(i) && isOdd(j)
            m(i,j) = 0;
        end
    end
end

m
