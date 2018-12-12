%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
clear all;
close all;
load('./ZeroPadding/test_three_d.mat');
load('./TrainAndTestSet/testlabel.mat');
for i =1 :length(testlabel)
    if(testlabel(i)==0)
        testlabel_vector(:,i) = [1 0 0 0]';
    elseif(testlabel(i)==1)
        testlabel_vector(:,i) = [0 1 0 0]';
    elseif(testlabel(i)==2)
        testlabel_vector(:,i) = [0 0 1 0]';
    else
        testlabel_vector(:,i) = [0 0 0 1]';
    end
end

height2=size(test_three_d,3);
height4=size(testlabel,2);

%----------------change to blob-------------------
testingset_blob(:,:,1,1:height2)=test_three_d(:,:,1:height2);           
testinglabel_blob(1,1,1:4,1:height4)=testlabel_vector(1:4,1:height4);

%----------------change to hdf5--------------------
[dim11,dim22,dim33,dim44]=size(testingset_blob);

 
h5create('./hdf5file/ecg_testdata.h5', '/data', [dim11 dim22 dim33 dim44],'Datatype','single');           
h5create('./hdf5file/ecg_testdata.h5', '/label', [1 1 4 dim44],'Datatype','single');

h5write('./hdf5file/ecg_testdata.h5', '/data', single( testingset_blob));
h5write('./hdf5file/ecg_testdata.h5', '/label', single(testinglabel_blob));

% permute(多维数组,[维数的组合])
% 比如:
% a=rand(2,3,4); %这是一个三维数组，各维的长度分别为：2，3，4
% %现在交换第一维和第二维：
% permute(A,[2,1,3]) %变成3*2*4的矩阵
% h5disp('ecg_traindata.h5');  % display structure of the stored HDF5 file  
% h5disp('ecg_testdata.h5');



