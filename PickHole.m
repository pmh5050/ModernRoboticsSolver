clear all;

% L is unknown, Set to symbolic variable
L1 = sym('L1');
L2 = sym('L2');
L3 = sym('L3');
L4 = sym('L4');

% Zero Position Homogeneous Transform
Ma = [1 0 0 L2;
    0 1 0 0;
    0 0 1 L1;
    0 0 0 1];

% Homogeneous Trasnform between Frame to Frame
Txb2a = [-1 0 0 0;
         0 -1 0 0;
         0 0 1 0;
         0 0 0 1];     

Txa2b = inv(Txb2a);

TxA2B = [-1 0 0 L3;
         0 -1 0 L4;
         0 0 1 0;
         0 0 0 1];
     
TxB2A = inv(TxA2B);

% Space frame Screw Axes (Row Vec)
S1 = [0 0 0 0 0 1];
S2 = [0 0 1 0 0 0];
S3 = [0 -1 0 L1 0 0];
S4 = [0 0 0 1 0 0];
S5 = [1 0 0 0 L1 0];

% V Concat for Row Vecs then Transpose
ConcatS = transpose([S1; S2; S3; S4; S5]);

% Convert M to Adj Mat
Adj = GetAdjust(TxA2B);

% Inv Adj
InvAdj = inv(Adj);

% Convert B frame Screw Axes to A 
ConcatB = InvAdj * ConcatS;

% Convert to Simplified expression
simplify(ConcatB)

M = TxB2A * Ma * Txa2b * inv(Ma);

