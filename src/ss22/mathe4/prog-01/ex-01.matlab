N = 28;
M = 29;

x = 1 / (2 * N) * pi : 2 / (2 * N) * pi : (1 - 1 / (2 * N)) * pi;
y = 1 / (2 * M) * pi : 2 / (2 * M) * pi : (1 - 1 / (2 * M)) * pi;

F = zeros(N, M);
for j = 1 : N
   for k = 1 : M
       F(j, k) = cos(2 * x(j)) + cos(3 * y(k));
   end
end

A = TDCT(F, DCT(F), x, y);
fprintf('||F - A|| = %d\n', norm(F - A));

maxN = 20;
maxAbsError = zeros(maxN, 1);
for P = 2 : maxN + 1
   h = pi / P;
   x = h : h : (P - 1) * h;
   y = x;

   F = zeros(P - 1, P - 1);
   for j = 1 : P - 1
      for k = 1 : P - 1
         F(j, k) = (x(j) - pi / 2)^2 + (y(k) - pi / 2)^2;
      end
   end
   A = TDCT(F, DCT(F), x, y);
   E = F - A;
   maxAbsError(P - 1) = max(abs(E(:)));
end

plot1 = subplot(2, 2, 1);
surf(pi / (maxN + 1) : pi / (maxN + 1) : maxN * pi / (maxN + 1),pi / (maxN + 1) : pi / (maxN + 1) : maxN * pi / (maxN + 1), F);
title(strcat('F bei N = ', int2str(maxN)));

plot2 = subplot(2,2,2);
surf(pi / (maxN + 1) : pi / (maxN + 1) : maxN * pi / (maxN + 1), pi / (maxN + 1) : pi / (maxN + 1) : maxN * pi / (maxN + 1), A);
title(strcat('A bei N = ', int2str(maxN)));

plot3 = subplot(2,2,3);
surf(pi/(maxN+1):pi/(maxN+1):(maxN)*pi/(maxN+1),pi/(maxN+1):pi/(maxN+1):(maxN)*pi/(maxN+1),E);
title(strcat('Fehler abs(E) mit E = F - A bei N = ',int2str(maxN)));

plot4 = subplot(2,2,4);
scatter(1 : maxN, maxAbsError);
title('maximaler Fehler in Abh. von N');

axis(plot3, [0 pi 0 pi 0 0.7]);
axis([plot1 plot2], [0 pi 0 pi 0 6]);
