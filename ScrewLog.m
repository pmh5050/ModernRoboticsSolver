function [Tx] = ScrewLog(ScrewAxis, Seta)
% Convert Screw value to Homogenius transform
% Screw Axis is unitless value, Seta is rad value
    SkewSym = Skew(ScrewAxis(1), ScrewAxis(2), ScrewAxis(3));
    SkewSym2 = SkewSym * SkewSym; % Skew sym matrix^2
    Rot = eye(3) + sin(Seta) * SkewSym + (1- cos(Seta)) * SkewSym2;
    G = Seta * eye(3) + (1 - cos(Seta)) * SkewSym + (Seta - sin(Seta)) * SkewSym2;
    Vel = [ScrewAxis(4); ScrewAxis(5); ScrewAxis(6)];
    Trs = G * Vel;
    Tx = [Rot Trs; 0 0 0 1];
end