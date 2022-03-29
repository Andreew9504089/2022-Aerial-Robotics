function Q = getQ(n_seg, n_order, ts)
    Q = [];
    for k = 1:n_seg
        Q_k = [];
        T = ts(k);

        %############################################################
        %           Checkpoint1 : Finish the Q matrix
        % Reminder
        % parameters: Sigma7 Sigma6 Sigma5 Sigma4 Sigma3 Sigma2 Sigma1 Sigma0
        % You cannot directly copy the class slide!
        
        b = [840, 360, 120, 24];
        for col = 1:8
            for row = 1:8
                Q_k(col, row) = b(rem(row-1, 4) + 1) * b(rem(col-1, 4) + 1) / (9 - (col+row)) * T.^(9 - (col+row));
                if col > 4 || row > 4
                    Q_k(col, row) = 0;
                end
            end
        end




        %############################################################
        
        Q = blkdiag(Q, Q_k);
    end
end