function SkewMat = Skew(x, y, z)
% Convert (x, y, z) to Skew Symmetry matrix
% (X, y, z) must be normalized
SkewMat = [0, -z, y;
           z, 0, -x;
           -y, x, 0];
end

