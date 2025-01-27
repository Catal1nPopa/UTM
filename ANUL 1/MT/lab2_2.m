%metoda mesh(x,y,z)
figure (8)
[x,y]=meshgrid(0:0.1:1,-2:0.1:2);
z=exp(x).*[cos(x.*y)+x.*y];
mesh(x,y,z)
colormap(gray)
title('Grafic')

%metoda surf(x,y,z)
figure(9)
surf(x,y,z)
title('Grafic - surf')

%metoda meshc(x,y,z)
figure(10)
meshc(x,y,z);
title('Grafic - meshc')
xlabel('axa OX');
ylabel('axa OY');
zlabel('axa OZ');

%metoda surfc(x,y,z)
figure(11)
surfc(x,y,z)
title('Grafic - surfc')

%metoda contour(x,y,z)
contour(x,y,z,30);
title('Grafic - contour')

%metoda contourf(x,y,z)
contourf(x,y,z,70);
title('Grafic - contour')

%metoda contour3(x,y,z)
contour3(x,y,z,100);
title('Grafic - contour')
