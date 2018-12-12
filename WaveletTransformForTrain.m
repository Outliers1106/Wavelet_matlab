clear;
clc;
load('./FilterForTrainAndTest/trainset.mat');
row = length(trainset);
%-----------------------------swt小波变换----------------------------------
%to meet SWT ,the length of signal should be a multiple of 2^L
wavename = 'db5';
L=6;                        %这个层数一定要换
for i =1:length(trainset)
    zero_pad_number(i) = ceil(length(trainset{i}) / 2^L) * 2^L - length(trainset{i});
end

for i =1:length(trainset)
    pad_matrix = zeros(1,zero_pad_number(i));
    zero_pad_signal{i} = [trainset{i} pad_matrix];
end
for i = 1:length(trainset)
    [swa{i},swd{i}] = swt(zero_pad_signal{i},L,wavename);
end

%元胞 每个元素里面是一个2维矩阵
for i = 1:length(trainset)
    three_dimension_train{i} = [swa{i} ; swd{i}];
    swa{i}=0;
    swd{i}=0;%减少空间占用
end

%--------------------------截去补零的那部分---------------------------------
for i = 1:length(trainset)
    three_dimension_train{i} = three_dimension_train{i}( : , 1:length(trainset{i}) );
end

save('./WaveTransforTrainset/Train_three_dimension.mat' ,'three_dimension_train');
