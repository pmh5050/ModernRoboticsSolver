l0 = 1;
l1 = 1;
l2 = 1;

% Transform Space to Body
M = [1 0 0 0;
     0 1 0 l1+l2;
     0 0 1 l0;
     0 0 0 1];
 
% Screw, Seta
S1 = [0 0 1 0 0 0]';
S2 = [0 0 1 l1 0 0]';
S3 = [0 0 1 l1+l2 0 0]';
S4 = [0 0 0 0 0 1]';

B1 = [0 0 1 -l1-l2 0 0]';
B2 = [0 0 1 -l2 0 0]';
B3 = [0 0 1 0 0 0]';
B4 = [0 0 0 0 0 1]';

Seta1 = 0;
Seta2 = pi/2;
Seta3 = -pi/2;
Seta4 = 1;

% Convert
Tx1 = ScrewLog(S1, Seta1);
Tx2 = ScrewLog(S2, Seta2);
Tx3 = ScrewLog(S3, Seta3);
Tx4 = ScrewLog(S4, Seta4);

SpaceFK = Tx1 * Tx2 * Tx3 * Tx4 * M;

Tx1 = ScrewLog(B1, Seta1);
Tx2 = ScrewLog(B2, Seta2);
Tx3 = ScrewLog(B3, Seta3);
Tx4 = ScrewLog(B4, Seta4);

BodyFK = M * Tx1 * Tx2 * Tx3 * Tx4;



