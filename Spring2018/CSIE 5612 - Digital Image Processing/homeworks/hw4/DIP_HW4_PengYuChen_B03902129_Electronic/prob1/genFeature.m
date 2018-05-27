function feature = genFeature(NUM_CHAR, char)
    feature = zeros(NUM_CHAR, 40);
    for c = 1: NUM_CHAR
        for i = 1: 15
            for j = 1: 15
                dist = sqrt((i - 7)^2 + (j - 7)^2);             
                x = j - 8; y = 8 - i;
                if char(i, j, c) == 255
                    if dist >= 6.7882
                        if x >= 0 && y > 0       % (I)
                            if y > x            % sector 1
                                feature(c, 1) = feature(c, 1) + 1;
                            else                % sector 2
                                feature(c, 2) = feature(c, 2) + 1;
                            end
                        elseif x > 0 && y <= 0   % (VI)
                            if x > abs(y)       % sector 3
                                feature(c, 3) = feature(c, 3) + 1;
                            else                % sector 4
                                feature(c, 4) = feature(c, 4) + 1;
                            end
                        elseif x <= 0 && y < 0   % (III)
                            if x > y            % sector 5
                                feature(c, 5) = feature(c, 5) + 1;
                            else                % sector 6
                                feature(c, 6) = feature(c, 6) + 1;
                            end
                        else                    % (II)
                            if abs(x) > y       % sector 7
                                feature(c, 7) = feature(c, 7) + 1;
                            else                % sector 8
                                feature(c, 8) = feature(c, 8) + 1;
                            end
                        end
                    elseif dist >= 5.0912
                        if x >= 0 && y > 0       % (I)
                            if y > x            % sector 1
                                feature(c, 9) = feature(c, 9) + 1;
                            else                % sector 2
                                feature(c, 10) = feature(c, 10) + 1;
                            end
                        elseif x > 0 && y <= 0   % (VI)
                            if x > abs(y)       % sector 3
                                feature(c, 11) = feature(c, 11) + 1;
                            else                % sector 4
                                feature(c, 12) = feature(c, 12) + 1;
                            end
                        elseif x <= 0 && y < 0   % (III)
                            if x > y            % sector 5
                                feature(c, 13) = feature(c, 13) + 1;
                            else                % sector 6
                                feature(c, 14) = feature(c, 14) + 1;
                            end
                        else                    % (II)
                            if abs(x) > y       % sector 7
                                feature(c, 15) = feature(c, 15) + 1;
                            else                % sector 8
                                feature(c, 16) = feature(c, 16) + 1;
                            end
                        end
                    elseif dist >= 3.3941
                        if x >= 0 && y > 0       % (I)
                            if y > x            % sector 1
                                feature(c, 17) = feature(c, 17) + 1;
                            else                % sector 2
                                feature(c, 18) = feature(c, 18) + 1;
                            end
                        elseif x > 0 && y <= 0   % (VI)
                            if x > abs(y)       % sector 3
                                feature(c, 19) = feature(c, 19) + 1;
                            else                % sector 4
                                feature(c, 20) = feature(c, 20) + 1;
                            end
                        elseif x <= 0 && y < 0   % (III)
                            if x > y            % sector 5
                                feature(c, 21) = feature(c, 21) + 1;
                            else                % sector 6
                                feature(c, 22) = feature(c, 22) + 1;
                            end
                        else                    % (II)
                            if abs(x) > y       % sector 7
                                feature(c, 23) = feature(c, 23) + 1;
                            else                % sector 8
                                feature(c, 24) = feature(c, 24) + 1;
                            end
                        end
                    elseif dist >= 1.6971
                        if x >= 0 && y > 0       % (I)
                            if y > x            % sector 1
                                feature(c, 25) = feature(c, 25) + 1;
                            else                % sector 2
                                feature(c, 26) = feature(c, 26) + 1;
                            end
                        elseif x > 0 && y <= 0   % (VI)
                            if x > abs(y)       % sector 3
                                feature(c, 27) = feature(c, 27) + 1;
                            else                % sector 4
                                feature(c, 28) = feature(c, 28) + 1;
                            end
                        elseif x <= 0 && y < 0   % (III)
                            if x > y            % sector 5
                                feature(c, 29) = feature(c, 29) + 1;
                            else                % sector 6
                                feature(c, 30) = feature(c, 30) + 1;
                            end
                        else                    % (II)
                            if abs(x) > y       % sector 7
                                feature(c, 31) = feature(c, 31) + 1;
                            else                % sector 8
                                feature(c, 32) = feature(c, 32) + 1;
                            end
                        end
                    else
                        if x >= 0 && y > 0       % (I)
                            if y > x            % sector 1
                                feature(c, 33) = feature(c, 33) + 1;
                            else                % sector 2
                                feature(c, 34) = feature(c, 34) + 1;
                            end
                        elseif x > 0 && y <= 0   % (VI)
                            if x > abs(y)       % sector 3
                                feature(c, 35) = feature(c, 35) + 1;
                            else                % sector 4
                                feature(c, 36) = feature(c, 36) + 1;
                            end
                        elseif x <= 0 && y < 0   % (III)
                            if x > y            % sector 5
                                feature(c, 37) = feature(c, 37) + 1;
                            else                % sector 6
                                feature(c, 38) = feature(c, 38) + 1;
                            end
                        else                    % (II)
                            if abs(x) > y       % sector 7
                                feature(c, 39) = feature(c, 39) + 1;
                            else                % sector 8
                                feature(c, 40) = feature(c, 40) + 1;
                            end
                        end
                    end
                end
            end
        end
    end   
end