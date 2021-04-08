function [PD] = render(D,P)
%RENDER 
% D: a matrix of 3D data points
% p: the center of projection as a coordinate [b, c, d]

b = P(1);
c = P(2);
d = P(3);

P = [[1,0,-(b/d),0]
    [0,1,-(c/d),0]
    [0,0,0,0]
    [0,0,-1/d,1]];
   
% Multiply the matrices
PD = P * D;

% Divide each element by the corresponding element in row 4
s = size(PD);
cols = s(2);
    for i = 1 : cols
        PD(1,i) = ((PD(1,i))/PD(4,i));
        PD(2,i) = ((PD(2,i))/PD(4,i));
        PD(3,i) = ((PD(3,i))/PD(4,i));
    end

PD = PD(1:2 , 1:end);
PD = PD';
end
  