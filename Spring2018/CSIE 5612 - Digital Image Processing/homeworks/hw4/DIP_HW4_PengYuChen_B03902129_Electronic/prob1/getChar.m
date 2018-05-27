function C = getChar(I, intensity, NORM)
    [h, w] = size(I);
    top = h; left = w; right = 1; bot = 1;

    for i = 1: h
        for j = 1: w
            if I(i, j) == intensity
                if j < left 
                    left = j; 
                end
                if j > right 
                    right = j; 
                end
                if i < top 
                    top = i; 
                end
                if i > bot 
                    bot = i; 
                end
            end
        end
    end
    
    % Crop the character
    C = I(top: bot, left: right);
    [h, w] = size(C);
    
    O = zeros(NORM, NORM);
    for i = 1: NORM
        for j = 1: NORM
            O(i, j) = C(uint8(round(i * h / NORM + 0.49)), uint8(round(j * w / NORM + 0.49)));
        end
    end
    C = O;
    
end