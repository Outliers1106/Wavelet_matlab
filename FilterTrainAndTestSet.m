clear;
clc;
load('./TrainAndTestSet/trainset.mat');
load('./TrainAndTestSet/testset.mat');

Hd=EllipticFilter;  %�õ��˲�������
fprintf('�������й���...\n')
%----------------------��ѵ��������֤�����ݽ��й���--------------------------
for i = 1:length(trainset)
    trainset{i} = filter(Hd,trainset{i});
end
for i = 1:length(testset)
    testset{i} = filter(Hd,testset{i});
end
fprintf('�������й������\n')
fprintf('���з�ת...\n')
%--------�����˺�����ݽ�ǰ��˳��ķ�תȻ���ڹ������������λʧ��--------------
%flipdim(X,dim)������matlab����Ծ���ת�任�ĺ���������X��ʾһ������dimָ����ת��ʽ��dimΪ1����ʾÿһ�н����������У�2��ʾÿһ�н����������С�
for i = 1:length(trainset)
    trainset{i} = flipdim(trainset{i},2);
end
for i = 1:length(testset)
    testset{i} = flipdim(testset{i},2);
end
fprintf('���з�ת���\n')
fprintf('�������й���...\n')
for i = 1:length(trainset)
    trainset{i} = filter(Hd,trainset{i});
end
for i = 1:length(testset)
    testset{i} = filter(Hd,testset{i});
end
%--------------------------------------------------------------------------
fprintf('�������й������\n')
fprintf('���з�ת...\n')
%----------------�ѻ������λʧ���������ٷ�ת�õ���ȷ˳�������--------------
for i = 1:length(trainset)
    trainset{i} = flipdim(trainset{i},2);
end
for i = 1:length(testset)
    testset{i} = flipdim(testset{i},2);
end
fprintf('���з�ת���\n')

fprintf('��ʼ����...\n')
save('./FilterForTrainAndTest/trainset.mat','trainset');
save('./FilterForTrainAndTest/testset.mat','testset');
fprintf('�������\n')