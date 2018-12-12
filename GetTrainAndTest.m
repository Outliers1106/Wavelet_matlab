clear;
clc;
load('rawdata.mat');
load('label.mat');

sum = length(rawdata);
dataN = {};
dataA = {};
dataO = {};
dataNoisy = {};
labelN = [];
labelA = [];
labelO = [];
labelNoisy = [];
i1=1;i2=1;i3=1;i4=1;
for i =1:sum
    if(label_all(i)==0)
        dataN{i1} = rawdata{i};
        labelN(i1) = label_all(i);
        i1 = i1+1;
    elseif(label_all(i)==1)
        dataA{i2} = rawdata{i};
        labelA(i2) = label_all(i);
        i2 = i2+1;
    elseif(label_all(i)==2)
        dataO{i3} = rawdata{i};
        labelO(i3) = label_all(i);
        i3 = i3+1;
    else
        dataNoisy{i4} = rawdata{i};
        labelNoisy(i4) = label_all(i);
        i4 = i4+1;
    end
end
k=0.8%划分比例

mtrainN = floor(k* length(labelN));
mtrainA = floor(k*length(labelA));
mtrainO = floor(k*length(labelO));
mtrainNoisy = floor(k*length(labelNoisy));
mtestN = length(labelN) - mtrainN;
mtestA = length(labelA) - mtrainA;
mtestO = length(labelO) - mtrainO;
mtestNoisy = length(labelNoisy) - mtrainNoisy;

indexN = randperm(length(labelN),mtrainN)';%traindataN的下标
indexA = randperm(length(labelA),mtrainA)';
indexO = randperm(length(labelO),mtrainO)';
indexNoisy = randperm(length(labelNoisy),mtrainNoisy)';

indexN1 = setdiff(1:length(labelN),indexN)';%testdataN的下标
indexA1 = setdiff(1:length(labelA),indexA)';
indexO1 = setdiff(1:length(labelO),indexO)';
indexNoisy1 = setdiff(1:length(labelNoisy),indexNoisy)';

for i = 1:length(indexN)
    traindataN{i} = dataN{indexN(i)};
    trainlabelN(i) = labelN(indexN(i));
end
for i = 1:length(indexN1)
    testdataN{i} = dataN{indexN1(i)};
    testlabelN(i) = labelN(indexN1(i));
end

for i = 1:length(indexA)
    traindataA{i} = dataA{indexA(i)};
    trainlabelA(i) = labelA(indexA(i));
end
for i = 1:length(indexA1)
    testdataA{i} = dataA{indexA1(i)};
    testlabelA(i) = labelA(indexA1(i));
end

for i = 1:length(indexO)
    traindataO{i} = dataO{indexO(i)};
    trainlabelO(i) = labelO(indexO(i));
end
for i = 1:length(indexO1)
    testdataO{i} = dataO{indexO1(i)};
    testlabelO(i) = labelO(indexO1(i));
end

for i = 1:length(indexNoisy)
    traindataNoisy{i} = dataNoisy{indexNoisy(i)};
    trainlabelNoisy(i) = labelNoisy(indexNoisy(i));
end
for i = 1:length(indexNoisy1)
    testdataNoisy{i} = dataNoisy{indexNoisy1(i)};
    testlabelNoisy(i) = labelNoisy(indexNoisy1(i));
end

trainset = [traindataN traindataA traindataO traindataNoisy];
testset = [testdataN testdataA testdataO testdataNoisy];
trainlabel = [trainlabelN trainlabelA trainlabelO trainlabelNoisy];
testlabel = [testlabelN testlabelA testlabelO testlabelNoisy];
%将数据打乱
index1 = randperm(length(trainset));
index2 = randperm(length(testset));
trainset = trainset(index1);
trainlabel = trainlabel(index1);
testset = testset(index2);
testlabel = testlabel(index2);

save('./TrainAndTestSet/trainset.mat','trainset');
save('./TrainAndTestSet/trainlabel.mat','trainlabel');
save('./TrainAndTestSet/testset.mat','testset');
save('./TrainAndTestSet/testlabel.mat','testlabel');