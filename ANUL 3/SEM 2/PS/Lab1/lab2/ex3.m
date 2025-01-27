t = 0:0.001:2;
d = mod(t, 0.5) <= 0.25; 
y = 4*d - 2; 
plot(t, y), grid 