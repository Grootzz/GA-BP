%适应值计算函数
%遗传算法的适应值计算
function [sol, val]=gabpEval (sol, options)
%val一the fittness of this individual
%sol一the individual, returned to allow for Lamarckian  evolution
%options-[current generation]
[input_train,ps , output_train,ts ,inputnum,hiddenmun,outputnum,data_num,lenchrom]=getBPinfo;

for i=1:lenchrom
x(i)=sol(i);
end
[W1,B1,W2,B2,input_train,output_train,A1,A2,SE,val]=gadecod(x);