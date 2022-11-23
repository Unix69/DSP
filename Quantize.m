function index = Quantize(in, nbits, xol)
%returns the index of quantization of the given inputs
L = (2 ^ nbits) - 1; %number of levels
D = 2*xol / L; %quantization delta
index = floor((in - (-xol)) / D);
index(index < 0) = 0;  %Lowerbound saturation
index(index > (L - 1)) = (L - 1); %Upperbound saturation
end