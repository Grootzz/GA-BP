%BP网络所对应的权值、阐值函数通过遗传算法实数编码解码
function [W1,B1,W2,B2,input_train,output_train,A1,A2,SE,fitval]=gadecod(x)
%x                                       input：个体
%W1                                  output：输入层到隐层的权值
%B1                                    output：隐层神经元阈值
%W2                                  output：隐层到输出层权值
%B2                                   output：输出层神经元阈值
%input_train                    output：归一化的输入训练数据
%output_train                 output：归一化的目标输出训练数据
%A1                                   output：
%A2                                   output：
%SE                                    output：均方差
%fitval                                output：适应度
[input_train,ps, output_train,ts ,inputnum,hiddenmun,outputnum,data_num,lenchrom]=getBPinfo;
%前inputnum*hiddenmun个编码为W1
for i=1:hiddenmun
    for k=1:inputnum
        W1(i, k)=x(inputnum*(i-1)+k);
    end
end

%接着的hiddenmun*outputnum个编码(即第inputnum*hiddenmun个后的编码)为W2
for i=1:outputnum
    for k=1:hiddenmun
        W2(i,k) =x(hiddenmun*(i-1)+k+inputnum*hiddenmun);
    end
end

%接着的hiddenmun个编码(即第inputnum*hiddenmun+hiddenmun*outputnum个后的编码)为B1
for i=1:hiddenmun,
    B1(i,1) =x((inputnum*hiddenmun+hiddenmun*outputnum)+i);
end

%接着的outputnum个编码(即第inputnum*hiddenmun+hiddenmun*outputnum+hiddenmun个后的编码)为B2
for i=1:outputnum
    B2(i,1) =x((inputnum*hiddenmun+hiddenmun*outputnum+hiddenmun)+i);
end

B11=B1;
B22=B2;
for i=1:data_num-1
    B11=[B11 B1];
    B22=[B22 B2];
end
%计算hiddenmun与outputnum层的输出
A1=tansig(W1*input_train-B11);
A2=logsig(W2*A1-B22);
%计算误差平方和
SE=sumsqr(output_train-A2);
fitval=1/SE;%遗传算法的适应值
