clear;
clc;
load('./Normalization/Test_three_dimension_nor.mat');
test_three_d = zeros(18286,12,length(three_dimension_test));
%18286 is max size
for k = 1:length(three_dimension_test)
    temp = zeros(18286,12);
    for i = 1:size(three_dimension_test{k},1)
        for j = 1:size(three_dimension_test{k},2)
            temp(i,j) = three_dimension_test{k}(i,j);
        end
    end
    test_three_d(:,:,k) =temp;
end
save('./ZeroPadding/test_three_d.mat','test_three_d');
clear three_dimension_test
clear test_three_d

load('./Normalization/Train_three_dimension_nor.mat');
train_three_d11 = zeros(18286,12,1000);
for k = 1:1000
    temp = zeros(18286,12);
    for i = 1:size(three_dimension_train{k},1)
        for j = 1:size(three_dimension_train{k},2)
            temp(i,j) = three_dimension_train{k}(i,j);
        end
    end
    train_three_d11(:,:,k) =temp;
end
save('./ZeroPadding/train_three_d11.mat','train_three_d11');
clear train_three_d11

%6821    3000 3000 821
train_three_d12 = zeros(18286,12,1000); 
for k = 1001:2000
    temp = zeros(18286,12);
    for i = 1:size(three_dimension_train{k},1)
        for j = 1:size(three_dimension_train{k},2)
            temp(i,j) = three_dimension_train{k}(i,j);
        end
    end
    train_three_d12(:,:,k-1000) =temp;
end
save('./ZeroPadding/train_three_d12.mat','train_three_d12');
clear train_three_d12

train_three_d13 = zeros(18286,12,1000);
for k =2001:3000
    temp =zeros(18286,12);
    for i = 1:size(three_dimension_train{k},1)
        for j =1:size(three_dimension_train{k},2)
            temp(i,j) = three_dimension_train{k}(i,j);
        end
    end
    train_three_d13(:,:,k-2000) = temp;
end
save('./ZeroPadding/train_three_d13.mat','train_three_d13');
clear train_three_d13


%！！！！！！！！！！！！！！！！！！！！！！！！！！！
train_three_d21 = zeros(18286,12,1000); 
for k = 3001:4000
    temp = zeros(18286,12);
    for i = 1:size(three_dimension_train{k},1)
        for j = 1:size(three_dimension_train{k},2)
            temp(i,j) = three_dimension_train{k}(i,j);
        end
    end
    train_three_d21(:,:,k-3000) =temp;
end
save('./ZeroPadding/train_three_d21.mat','train_three_d21');
clear train_three_d21
%！！！！！！！！！！！！！！！！！！！！！！！！！！
train_three_d22 = zeros(18286,12,1000); 
for k = 4001:5000
    temp = zeros(18286,12);
    for i = 1:size(three_dimension_train{k},1)
        for j = 1:size(three_dimension_train{k},2)
            temp(i,j) = three_dimension_train{k}(i,j);
        end
    end
    train_three_d22(:,:,k-4000) =temp;
end
save('./ZeroPadding/train_three_d22.mat','train_three_d22');
clear train_three_d22


%6821    3000 3000 821
train_three_d23 = zeros(18286,12,1000); 
for k = 5001:6000
    temp = zeros(18286,12);
    for i = 1:size(three_dimension_train{k},1)
        for j = 1:size(three_dimension_train{k},2)
            temp(i,j) = three_dimension_train{k}(i,j);
        end
    end
    train_three_d23(:,:,k-5000) =temp;
end
save('./ZeroPadding/train_three_d23.mat','train_three_d23');
clear train_three_d23

train_three_d3 = zeros(18286,12,821);
for k = 6001:6821
    temp = zeros(18286,12);
    for i = 1:size(three_dimension_train{k},1)
        for j = 1:size(three_dimension_train{k},2)
            temp(i,j) = three_dimension_train{k}(i,j);
        end
    end
    train_three_d3(:,:,k-6000) =temp;
end
save('./ZeroPadding/train_three_d3.mat','train_three_d3');
clear train_three_d3
