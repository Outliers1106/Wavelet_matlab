clear all;
close all;
% N = 0, A = 1, O =2, ~=3
fid = fopen('training2017/REFERENCE-v3.csv');
label_ = textscan(fid,'%s');
label_ = label_{1};
label_all = [];
for i = 1:length(label_)
    label = label_(i);
    label = cell2mat(label);
    if label(8) =='N'
        label =0;
    elseif label(8) =='A'
        label =1;
    elseif label(8)=='O'
        label = 2;
    else
        label = 3;
    end
    label_all(i) = label;
end

A = dir(fullfile('training2017\*.mat'));
rawdata = {};
for i = 1:length(A)
    data = load(['training2017\',A(i).name]);
    data = cell2mat(struct2cell(data));
    rawdata{i} = data;
    fprintf('round %d\n',i);
end
save rawdata.mat rawdata;
save label.mat label_all;