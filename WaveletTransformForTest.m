clear;
clc;
load('./FilterForTrainAndTest/testset.mat');
row = length(testset);
%-----------------------------swt小波变换----------------------------------
%to meet SWT ,the length of signal should be a multiple of 2^L
wavename = 'db5';
L=6;                        %这个层数一定要换
for i =1:length(testset)
    zero_pad_number(i) = ceil(length(testset{i}) / 2^L) * 2^L - length(testset{i});
end

for i =1:length(testset)
    pad_matrix = zeros(1,zero_pad_number(i));
    zero_pad_signal{i} = [testset{i} pad_matrix];
end
for i = 1:length(testset)
    [swa{i},swd{i}] = swt(zero_pad_signal{i},L,wavename);
end

%元胞 每个元素里面是一个2维矩阵
for i = 1:length(testset)
    three_dimension_test1{i} = [swa{i} ; swd{i}];
end

%--------------------------截去补零的那部分---------------------------------
for i = 1:length(testset)
    three_dimension_test{i} = three_dimension_test1{i}( : , 1:length(testset{i}) );
end

save('./WaveTransforTestset/Test_three_dimension.mat' ,'three_dimension_test');