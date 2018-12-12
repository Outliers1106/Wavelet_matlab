clear;
clc;
load('./FilterForTrainAndTest/testset.mat');
row = length(testset);
%-----------------------------swtС���任----------------------------------
%to meet SWT ,the length of signal should be a multiple of 2^L
wavename = 'db5';
L=6;                        %�������һ��Ҫ��
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

%Ԫ�� ÿ��Ԫ��������һ��2ά����
for i = 1:length(testset)
    three_dimension_test1{i} = [swa{i} ; swd{i}];
end

%--------------------------��ȥ������ǲ���---------------------------------
for i = 1:length(testset)
    three_dimension_test{i} = three_dimension_test1{i}( : , 1:length(testset{i}) );
end

save('./WaveTransforTestset/Test_three_dimension.mat' ,'three_dimension_test');