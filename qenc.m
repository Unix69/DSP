function idx = qenc(in, nbits, xol)
  % function idx = qenc(in, nbits, xol)
  % Uniform quantizer with nbits bits and range [-xol, xol]
  %  idx: quantization indexes
  %  in:  input vector (bounded to [-1,1]
  %  nbits: number of quantization bits
  %  xol: quantizer range [-xol, xol]

  N = nbits;
  idx = [];
  L = 2^N-1;               % number of levels
  delta = (2*xol)/L;     % quantization step
 
  % -xol
 
  idx = floor( (in + xol) / delta );

  idx(idx<0) = 0;
  idx(idx>L) = L;
end