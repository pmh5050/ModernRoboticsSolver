clear all;

M = [-1 0 0 0;
    0 0 1 3;
    0 1 0 2;
    0 0 0 1];

% S1 = [0 0 1 0 0 0];
% S2 = [1 0 0 0 2 0];
% S3 = [0 0 0 0 1 0];
% 
% Tx1 = ScrewLog(S1, pi/2);
% Tx2 = ScrewLog(S2, pi/2);
% Tx3 = ScrewLog(S3, 1);

% Tx1 * Tx2 * Tx3 * M;

B1 = [0 1 0 3 0 0];
B2 = [-1 0 0 0 3 0];
B3 = [0 0 0 0 0 1];

Seta1 = sym('S1');
Seta2 = sym('S2');
Seta3 = sym('S3');
Seta1D = sym('S1`');
Seta2D = sym('S2`');
Seta3D = sym('S3`');

Tx1 = ScrewLog(B1, Seta1);
Tx2 = ScrewLog(B2, Seta2);
Tx3 = ScrewLog(B3, Seta3);

TxB2S = M * Tx1 * Tx2 * Tx3;
TxS2B = inv(TxB2S);

DxB2S = diff(TxB2S, Seta1) + diff(TxB2S, Seta2) + diff(TxB2S, Seta3);

simplify(TxS2B)
simplify(DxB2S)

