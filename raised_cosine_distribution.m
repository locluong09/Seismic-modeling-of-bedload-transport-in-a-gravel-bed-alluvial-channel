function res = raised_cosine_distribution(D, mu, s)
    res = zeros(length(D),1);
    for i = 1:length(res)
        if (-s<D(i)-mu) && (D(i)-mu < s)
            res(i,1) = 1/2/s*(1+cos((D(i)-mu)/s*pi));
        end
    end
end



