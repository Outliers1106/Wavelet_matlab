%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
clear all;
close all;
load('./ZeroPadding/train_three_d11.mat');
load('./TrainAndTestSet/trainlabel.mat');

for i =1 :length(trainlabel)
    if(trainlabel(i)==0)
        trainlabel_vector(:,i) = [1 0 0 0]';
    elseif(trainlabel(i)==1)
        trainlabel_vector(:,i) = [0 1 0 0]';
    elseif(trainlabel(i)==2)
        trainlabel_vector(:,i) = [0 0 1 0]';
    else
        trainlabel_vector(:,i) = [0 0 0 1]';
    end
end

height1=size(train_three_d11,3);
height2=size(trainlabel_vector,2);

%----------------change to blob-------------------
trainingset_blob = zeros(18286,12,1,6821);
train_three_d11 = single(train_three_d11);
trainingset_blob(:,:,1,1:height1)=train_three_d11(:,:,1:height1);          %这里是1024*12*1*600000因为在permute时会转成600000*1*12*1024，这是因为matlab的矩阵是按列来存的，而hdf5是按行来存的      
clear train_three_d11

load('./ZeroPadding/train_three_d12.mat');
train_three_d12 = single(train_three_d12);
length1 =size(train_three_d12,3);
height1 =height1 + length1;
trainingset_blob(:,:,1,height1- length1 + 1:height1)=train_three_d12(:,:,1:length1);
clear train_three_d12

load('./ZeroPadding/train_three_d13.mat');
train_three_d13 = single(train_three_d13);
length1 =size(train_three_d13,3);
height1 =height1 + length1;
trainingset_blob(:,:,1,height1- length1 + 1:height1)=train_three_d13(:,:,1:length1);
clear train_three_d13

load('./ZeroPadding/train_three_d21.mat');
train_three_d21 = single(train_three_d21);
length1 =size(train_three_d21,3);
height1 =height1 + length1;
trainingset_blob(:,:,1,height1- length1 + 1:height1)=train_three_d21(:,:,1:length1);
clear train_three_d21

load('./ZeroPadding/train_three_d22.mat');
train_three_d22 = single(train_three_d22);
length1 =size(train_three_d22,3);
height1 =height1 + length1;
trainingset_blob(:,:,1,height1- length1 + 1:height1)=train_three_d22(:,:,1:length1);
clear train_three_d22

load('./ZeroPadding/train_three_d23.mat');
train_three_d23 = single(train_three_d23);
length1 =size(train_three_d23,3);
height1 =height1 + length1;
trainingset_blob(:,:,1,height1- length1 + 1:height1)=train_three_d23(:,:,1:length1);
clear train_three_d23

load('./ZeroPadding/train_three_d3.mat');
train_three_d3 = single(train_three_d3);
length1 =size(train_three_d3,3);
height1 =height1 + length1;
trainingset_blob(:,:,1,height1- length1 + 1:height1)=train_three_d3(:,:,1:length1);
clear train_three_d3

traininglabel_blob(1,1,1:4,1:height2)=trainlabel_vector(1:4,1:height2);


%----------------change to hdf5--------------------
[dim1,dim2,dim3,dim4]=size(trainingset_blob);

h5create('./hdf5file/ecg_traindata.h5', '/data', [dim1 dim2 dim3 dim4],'Datatype','single');           
h5create('./hdf5file/ecg_traindata.h5', '/label', [1 1 4 dim4],'Datatype','single');
 
h5write('./hdf5file/ecg_traindata.h5', '/data',  trainingset_blob);           %查permute的用法，[4:-1:1]为什么这么写:从4开始递减，每次递减步长为1，直到减到为止1,即4,3,2,1，按照这样和原来相反的维度转换?
h5write('./hdf5file/ecg_traindata.h5', '/label', single( traininglabel_blob));


% permute(多维数组,[维数的组合])
% 比如:
% a=rand(2,3,4); %这是一个三维数组，各维的长度分别为：2，3，4
% %现在交换第一维和第二维：
% permute(A,[2,1,3]) %变成3*2*4的矩阵
% h5disp('ecg_traindata.h5');  % display structure of the stored HDF5 file  
% h5disp('ecg_testdata.h5');



