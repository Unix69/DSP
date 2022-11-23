function value = stFeature_Energy(signal)
energy = 0;
l = length(signal) - 1;
for j=1:l
   energy = energy + (signal(j)^2);
end
    value = energy / l;
end