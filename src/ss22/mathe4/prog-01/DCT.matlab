function [D] = DCT(F)
    N = size(F, 1);
    M = size(F, 2);

    x = 1 / (2 * N) * pi : 2 / (2 * N) * pi : (1 - 1 / (2 * N)) * pi;
    y = 1 / (2 * M) * pi : 2 / (2 * M) * pi : (1 - 1 / (2 * M)) * pi;

    D = zeros(N, M);

    for j = 0 : N - 1
        for k = 0 : M - 1
            for j2 = 0 : N - 1
                for k2 = 0 : M - 1
                    D(j + 1, k + 1) = D(j + 1, k + 1) + F(j2 + 1, k2 + 1) * cos(j * x(j2 + 1)) * cos(k * y(k2 + 1));
                end
            end
            D(j + 1, k + 1) = D(j + 1, k + 1) * 4 / (N * M);
        end
    end
end
