function [diff, minIndex] = findChar(f, feature)
    diff = zeros(70, 1);
    for i = 1: 70
        diff(i) = sum(abs(feature(i, :) - f));
    end
    minCount = 255;
    minIndex = 0;
    for i = 1: 70
        if diff(i) < minCount
            minCount = diff(i);
            minIndex = i;
        end
    end
end