function C = getChar(I, intensity)
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
    O = zeros(15, 15);
    
    for i = 1: 15
        for j = 1: 15
            O(i, j) = C(uint8(round(i * h / 15 + 0.49)), uint8(round(j * w / 15 + 0.49)));
        end
    end
    C = O;
    
end