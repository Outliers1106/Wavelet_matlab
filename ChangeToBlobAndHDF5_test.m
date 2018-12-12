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

% permute(��ά����,[ά�������])
% ����:
% a=rand(2,3,4); %����һ����ά���飬��ά�ĳ��ȷֱ�Ϊ��2��3��4
% %���ڽ�����һά�͵ڶ�ά��
% permute(A,[2,1,3]) %���3*2*4�ľ���
% h5disp('ecg_traindata.h5');  % display structure of the stored HDF5 file  
% h5disp('ecg_testdata.h5');



