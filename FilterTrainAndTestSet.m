clear;
clc;
load('./TrainAndTestSet/trainset.mat');
load('./TrainAndTestSet/testset.mat');

Hd=EllipticFilter;  %得到滤波器参数
fprintf('正向序列过滤...\n')
%----------------------对训练集和验证集数据进行过滤--------------------------
for i = 1:length(trainset)
    trainset{i} = filter(Hd,trainset{i});
end
for i = 1:length(testset)
    testset{i} = filter(Hd,testset{i});
end
fprintf('正向序列过滤完毕\n')
fprintf('序列反转...\n')
%--------将过滤后的数据进前后顺序的反转然后在过滤来获得零相位失真--------------
%flipdim(X,dim)函数是matlab中针对矩阵翻转变换的函数，其中X表示一个矩阵，dim指定翻转方式，dim为1，表示每一列进行逆序排列，2表示每一行进行逆序排列。
for i = 1:length(trainset)
    trainset{i} = flipdim(trainset{i},2);
end
for i = 1:length(testset)
    testset{i} = flipdim(testset{i},2);
end
fprintf('序列反转完毕\n')
fprintf('反向序列过滤...\n')
for i = 1:length(trainset)
    trainset{i} = filter(Hd,trainset{i});
end
for i = 1:length(testset)
    testset{i} = filter(Hd,testset{i});
end
%--------------------------------------------------------------------------
fprintf('反向序列过滤完毕\n')
fprintf('序列反转...\n')
%----------------把获得零相位失真后的数据再反转得到正确顺序的数据--------------
for i = 1:length(trainset)
    trainset{i} = flipdim(trainset{i},2);
end
for i = 1:length(testset)
    testset{i} = flipdim(testset{i},2);
end
fprintf('序列反转完毕\n')

fprintf('开始保存...\n')
save('./FilterForTrainAndTest/trainset.mat','trainset');
save('./FilterForTrainAndTest/testset.mat','testset');
fprintf('保存完毕\n')