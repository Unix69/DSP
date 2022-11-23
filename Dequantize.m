function value = Dequantize(in, nbits, xol)
%returns the dequantized value of the given numeric inputs
L = (2 ^ nbits) - 1; %number of levels
D = 2*xol / L; %quantization delta
value = ((in + 0.5) * D) + (-xol); 
end