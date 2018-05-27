function [feature, Labeled_I1, Labeled_I2, H, i, g, x, eight, I, B, T, S, four, seven] = prob1()
    % Read images and convert them to binary uint8
    I1 = uint8(binary(readraw('./raw/sample1.raw', 390, 125)));
    I2 = uint8(binary(readraw('./raw/sample2.raw', 390, 125)));
    TS = uint8(binary(readraw('./raw/TrainingSet.raw', 450, 248)));

    % Crop the TrainingSet to multiples of 5 and 14
    TS = uint8(256 * TS(3: 247, 2: 449));
        
    % Get characters of TrainingSet
    NUM_CHAR = 0;
    NORM = 15;
    for i = 1: 5
        for j = 1: 14
            NUM_CHAR = NUM_CHAR + 1;
            char(:, :, NUM_CHAR) = getChar(TS((i - 1) * 49 + 1: i * 49, (j - 1) * 32 + 1: j * 32), 255, NORM);
        end
    end

    % Generate features of TraingSet
    feature = genFeature(NUM_CHAR, NORM, char);
    
    % Plot extracted characters of TrainingSet
    figure('Name', "Characters", 'NumberTitle', 'off');
    for i = 1: NUM_CHAR
        subplot(5, 14, i), imshow(char(:, :, i)), title(strcat(num2str(i)));
    end
    
    % Perform Cross Median Filter on I2
    I2 = crossMedianFilter(crossMedianFilter(I2, 3), 3);
    
    % Count number of objects in I1 and I2
    [Labeled_I1, n1] = countObjects(I1);
    [Labeled_I2, n2] = countObjects(I2);
    
    % Preprocessing of 'i'
    for i = 1: 125
        for j = 1: 390
            if uint8(Labeled_I1(i, j)) == uint8(5)
                Labeled_I1(i, j) = 4;
            end
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%
    % Get characters of I1 %
    %%%%%%%%%%%%%%%%%%%%%%%%
    
    H_img = getChar(Labeled_I1, 1, NORM) * 255;
    eight_img = getChar(Labeled_I1, 2, NORM) * 255 / 2;
    eight_img = dilate(eight_img, 1);
    g_img = getChar(Labeled_I1, 3, NORM) * 255 / 3;
    i_img = getChar(Labeled_I1, 4, NORM) * 255 / 4;
    x_img = getChar(Labeled_I1, 6, NORM) * 255 / 5;
    
    H_feature = genFeature(1, NORM, H_img);
    [H_diff, H] = findChar(H_feature, feature);
    
    eight_feature = genFeature(1, NORM, eight_img);
    [eight_diff, eight] = findChar(eight_feature, feature);
    
    g_feature = genFeature(1, NORM, g_img);
    [g_diff, g] = findChar(g_feature, feature);
    
    x_feature = genFeature(1, NORM, x_img);
    [x_diff, x] = findChar(x_feature, feature);
    
    for i = 1: 15
        for j = 1: 9
            i_img(i, j) = 0;
        end
    end
    i_feature = genFeature(1, NORM, i_img);
    [i_diff, i] = findChar(i_feature, feature);
    
    %%%%%%%%%%%%%%%%%%%%%%%%
    % Get characters of I2 %
    %%%%%%%%%%%%%%%%%%%%%%%%
    
    I_img = getChar(Labeled_I2, 1, NORM) * 255;
    B_img = getChar(Labeled_I2, 2, NORM) * 255 / 2;
    T_img = getChar(Labeled_I2, 3, NORM) * 255 / 3;
    S_img = getChar(Labeled_I2, 4, NORM) * 255 / 4;
    four_img = getChar(Labeled_I2, 5, NORM) * 255 / 5;
    seven_img = getChar(Labeled_I2, 6, NORM) * 255 / 6;
    
    I_feature = genFeature(1, NORM, I_img);
    [I_diff, I] = findChar(I_feature, feature);
    
    B_feature = genFeature(1, NORM, B_img);
    [B_diff, B] = findChar(B_feature, feature);

    T_feature = genFeature(1, NORM, T_img);
    [T_diff, T] = findChar(T_feature, feature);

    S_feature = genFeature(1, NORM, S_img);
    [S_diff, S] = findChar(S_feature, feature);

    four_feature = genFeature(1, NORM, four_img);
    [four_diff, four] = findChar(four_feature, feature);

    seven_feature = genFeature(1, NORM, seven_img);
    [seven_diff, seven] = findChar(seven_feature, feature);
    
end