%读取数据集
%P为客运量数据
%F为货运量数据
function [P , F] = dataInit

P = xlsread('passengerFlow.xlsx');
F = xlsread('freightFlow.xlsx');

save('Data');
