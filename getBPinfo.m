%通过研究对象初始化BP网络
function [input_train, ps, output_train, ts, inputnum, hiddenmun, outputnum, data_num, lenchrom]=getBPinfo
%input_train               影响因素参量
%output_target         目标输出
%inputnum                 输入层数
%hiddenmun              隐层数
%outputnum              输出层数
%data_num                 数据组数（影响因素--目标输出）
%lenchrom                  染色体长度

D = load('Data.mat');
preData = D.P;

%用6组数据训练网络
input_train  = preData(1:8,1:7);
output_train = preData(1:8,8);
input_train = input_train';
output_train = output_train';

%数据归一化
[input_train , ps] = mapminmax(input_train , 0 ,1);
[output_train , ts] = mapminmax(output_train , 0 ,1);

%提取BP网络基本信息
hiddenmun=9;
[inputnum,data_num]=size (input_train);
[outputnum, data_num]=size (output_train);
lenchrom=inputnum*hiddenmun++hiddenmun+hiddenmun*outputnum+outputnum;%遗传算法编码长度
fprintf('遗传算法染色体编码长度 : %d\n'  , lenchrom);