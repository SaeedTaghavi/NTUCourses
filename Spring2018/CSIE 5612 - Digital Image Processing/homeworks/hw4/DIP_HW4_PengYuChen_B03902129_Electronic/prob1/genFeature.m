function feature = genFeature(NUM_CHAR, NORM, char)
    feature = zeros(NUM_CHAR, 40);      % Initialize feature
    center = (NORM + 1) / 2;            % Center coordinate of the char image
    radius = sqrt((1 - center)^2 + (1 - center)^2);
    for c = 1: NUM_CHAR
        for i = 1: NORM
            for j = 1: NORM
                if char(i, j, c) == 255                                 % char(i, j, c) is white
                    dist = sqrt((i - center)^2 + (j - center)^2);       % dist = d(point, center)
                    x = j - center; y = center - i;
                    if dist >= radius * 0.8
                        feature(c, 1: 8) = addFeature(x, y, feature(c, 1: 8));
                    elseif dist >= radius * 0.6
                        feature(c, 9: 16) = addFeature(x, y, feature(c, 9: 16));
                    elseif dist >= radius * 0.4
                        feature(c, 17: 24) = addFeature(x, y, feature(c, 17: 24));
                    elseif dist >= radius * 0.2
                        feature(c, 25: 32) = addFeature(x, y, feature(c, 25: 32));
                    else
                        feature(c, 33: 40) = addFeature(x, y, feature(c, 33: 40));
                    end
                end
            end
        end
    end   
end