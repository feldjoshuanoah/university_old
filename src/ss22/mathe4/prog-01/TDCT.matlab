function [A] = TDCT(F, D, x, y)
    N = size(F, 1);
    M = size(F, 2);

    A = zeros(N, M);

    for jx = 1 : N
        for ky = 1 : M
            for j = 0 : N - 1
                for k = 0 : M - 1
                    cj = 1;
                    ck = 1;
                    if (j == 0) cj = 0.5; end
                    if (k == 0) ck = 0.5; end
                    A(jx, ky) = A(jx, ky) + D(j + 1, k + 1) * cj * ck * cos(j * x(jx)) * cos(k * y(ky));
                end
            end
        end
    end
end
