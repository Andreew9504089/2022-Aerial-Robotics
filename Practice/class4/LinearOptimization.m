function [R_d] = LinearOptimization(P_after, Np, P_origin)

    
    % We have the relation P_after = R_d * P_origin, but we should
    % convert the equation into "P_after = P_origin * R_d" form, because we 
    % want to solve R_d, not P_origin

    % implement your code here
    sz = size(P_after);
    P_after3x1 = reshape(P_after, [3*sz(2), 1]);
    
    origin = [];
    for i = 1:sz(2)

        tmp = matrix_change(P_origin(:,i)');
        origin = cat(1, origin, tmp);

    end

    R_d = inv(origin' * origin) * origin' * P_after3x1;
    R_d = reshape(R_d, [3, 3])
    
end
