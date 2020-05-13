clear all;

% L is unknown, Set to symbolic variable
L = sym('L');
% To avoid complex expression(sqrt(2) = 1.4142...), I defined the symbolic variable Sqrt2
Sqrt2 = sym('sqrt2'); 

% Zero Position Homogeneous Transform
M = [1 0 0 L;
    0 1 0 (4+Sqrt2)*L;
    0 0 1 -Sqrt2*L;
    0 0 0 1];

% Space frame Screw Axes (Row Vec)
S1 = [0 1 0 0 0 0];
S2 = [0 0 1 L 0 0];
S3 = [0 0 0 0 1 0];
S4 = [0 1 0 -L 0 0];
S5 = [0 1/Sqrt2 -1/Sqrt2 -5*L/Sqrt2 0 0];
S6 = [1 0 0 0 -Sqrt2*L -(4 + Sqrt2) * L];

% V Concat for Row Vecs then Transpose
ConcatS = transpose([S1; S2; S3; S4; S5; S6]);

% Convert M to Adj Mat
Adj = GetAdjust(M);

% Inv Adj
InvAdj = inv(Adj);

% Convert Space frame Screw Axes to Body frame Screw Axes
ConcatB = InvAdj * ConcatS;

% Convert to Simplified expression
simplify(ConcatB)
