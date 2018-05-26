function [I1, I2, TS, Labeled, numObjects, char, feature, n1, n2, Labeled_I1, Labeled_I2] = prob1()
    I1 = readraw('./raw/sample1.raw', 390, 125);
    I2 = readraw('./raw/sample2.raw', 390, 125);
    TS = readraw('./raw/TrainingSet.raw', 450, 248);
    
    I1 = uint8(binary(I1));
    I2 = uint8(binary(I2));
    TS = uint8(binary(TS));
    
    [Labeled, numObjects] = countObjects(TS);
%     figure; imshow(uint8(255 / numObjects * Labeled)), title('Labeled by different intensities');
    TS = uint8(256 * TS(3: 247, 2: 449));
    
    NUM_CHAR = 70;
    lc = 0; uc = 0; nums = 0;
    
    % Get characters of training set
    for i = 1: 5
        for j = 1: 14
            lc = lc + 1;
            char(:, :, lc) = getChar(TS((i - 1) * 49 + 1: i * 49, (j - 1) * 32 + 1: j * 32), 255);
        end
    end
    
    % Plot extracted characters
    figure('Name', "Characters", 'NumberTitle', 'off');
    for i = 1: NUM_CHAR
        subplot(5, 14, i), imshow(char(:, :, i)), title(strcat(num2str(i)));
    end
    
    % Generate features of TraingSet
    feature = genFeature(NUM_CHAR, char);
    
    [Labeled_I1, n1] = countObjects(I1);
    [Labeled_I2, n2] = countObjects(I2);
%     figure; imshow(uint8(255 / n1 * Labeled_I1)), title('I1 Labeled by different intensities');
%     figure; imshow(uint8(255 / n2 * Labeled_I2)), title('I2 Labeled by different intensities');
    
    % Get characters of I1
    H_img = getChar(Labeled_I1, 1);
    H_feature = genFeature(1, 255 * H_img);
    [H_diff, H] = findChar(H_feature, feature);
        
    eight_img = getChar(Labeled_I1, 2);
    eight_feature = genFeature(1, 255 * eight_img / 2);
    [eight_diff, eight] = findChar(eight_feature, feature);
    
    g_img = getChar(Labeled_I1, 3);
    g_feature = genFeature(1, 255 * g_img / 3);
    [g_diff, g] = findChar(g_feature, feature);
    
    x_img = getChar(Labeled_I1, 6);
    x_feature = genFeature(1, 255 * x_img / 6);
    [x_diff, x] = findChar(x_feature, feature);
    
    % Preprocessing of 'i'
    for i = 1: 125
        for j = 1: 390
            if uint8(Labeled_I1(i, j)) == uint8(5)
                Labeled_I1(i, j) = 4;
            end
        end
    end
    
    i_img = getChar(Labeled_I1, 4);
    i_feature = genFeature(1, 255 * i_img / 4);
    [i_diff, i] = findChar(i_feature, feature);
end