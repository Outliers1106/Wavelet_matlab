clear;
clc;
load('./WaveTransforTrainset/Train_three_dimension.mat');
load('./WaveTransforTestset/Test_three_dimension.mat');          
%----------------------normalization---------------------------------------
for i = 1:length(three_dimension_test)
    [y1,ps1] = mapminmax(three_dimension_test{i},0,1);
    three_dimension_test{i} =y1;
    fprintf('round 10 %d\n',i);
end
for i = 1:length(three_dimension_train)
    [y2,ps2] = mapminmax(three_dimension_train{i},0,1);
    three_dimension_train{i} =y2; %转置有什么意义..后面又换回来了
    fprintf('round 11 %d\n',i);
end
%---------------------------------------------------------------------------
%-----------------------transposition-------------------------------------
for i = 1:length(three_dimension_test) %为什么又换回来....
    three_dimension_test{i} = permute(three_dimension_test{i},[2,1]); 
    fprintf('round 20 %d\n',i);
end
for i = 1:length(three_dimension_train)
    three_dimension_train{i} = permute(three_dimension_train{i},[2,1]); 
    fprintf('round 21 %d\n',i);
end
%---------------------------------------------------------------------------
%--------------------mean substraction---------------------------------
for i = 1:length(three_dimension_test)
    three_dimension_test{i} = bsxfun(@minus, three_dimension_test{i}, mean(three_dimension_test{i}, 1)); 
    fprintf('round 30 %d\n',i);
end
for i = 1:length(three_dimension_train)
    three_dimension_train{i} = bsxfun(@minus, three_dimension_train{i}, mean(three_dimension_train{i}, 1));
    fprintf('round 31 %d\n',i);
end
%---------------------------------------------------------------------------
save('./Normalization/Train_three_dimension_nor.mat','three_dimension_train');
save('./Normalization/Test_three_dimension_nor.mat','three_dimension_test');
