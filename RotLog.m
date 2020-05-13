function Rot = RotLog(RotAxis, Seta)
% Convert RotAxis, Seta to Rotation matrix (3x3)
% Rotation Axis must be normalized
    S = Skew(RotAxis(1), RotAxis(2), RotAxis(3));
    Rot = eye(3) + sin(Seta) * S + (1 - cos(Seta)) * S * S;
    
end

