名称：基于遗传算法的BP神经网络
--------------------------------------------------
介绍：
          利用遗传算法并行地优化BP网络的权值和阈值，从而避免了BP网络在优化权值和阈值时陷入局部最优的缺点

背景： 
          这个项目的背景为客运量和货运量的预测

文件介绍：
1. freightFlow.xlsx  ： 货运量数据集，前7列为影响货运量的因素，第8列为货运量
2. passengerFlow.xlsx ： 客运量数据集，前7列为影响货运量的因素，第8列为客运量
3. Data.mat：这是一个结构体，成员P为从客运量数据集，成员F为货运量数据集

函数概述：
1. gadecod：对输入的染色体编码，编码方式一般有两种，实数编码和二进制编码。
                        此项目中对应的为实数编码，所以编码后的值即为解码后的值。
2. getBPinfo：获取BP网络的基本信息。
3. gabpEval：计算适应度
4. normInit：数据获取，存入结构体Data.mat
5 mainFun：主函数，完成训练和预测

GAOT使用说明：
因为项目中用到了GAOT工具包中的函数，所以需要将GAOT工具包加入路径
操作步骤为：点击GAOT文件--->添加到路径--->选定文件夹和子文件夹
这样，工程中就可以调用GAOT工具包中的函数了

初始种群的生成函数：
[pop]=initializega(num,bounds,eevalFN,eevalOps,options)
【输出参数】
 pop--生成的初始种群
【输入参数】
num--种群中的个体数目
bounds--代表变量的上下界的矩阵
eevalFN--适应度函数
eevalOps--传递给适应度函数的参数
options--选择编码形式(浮点编码或是二进制编码)[precision F_or_B]
precision--变量进行二进制编码时指定的精度
F_or_B--为1时选择浮点编码，否则为二进制编码,由precision指定精度)

遗传算法函数：
[x,endPop,bPop,traceInfo]=ga(bounds,evalFN,evalOps,startPop,opts,termFN,termOps,selectFN,selectOps,xOverFNs,xOverOps,mutFNs,mutOps)
【输出参数】
x--求得的最优解
endPop--最终得到的种群
bPop--最优种群的一个搜索轨迹
traceInfo--每一代的最好的适应度和平均适应度
【输入参数】
bounds--代表变量上下界的矩阵
evalFN--适应度函数
evalOps--传递给适应度函数的参数
startPop-初始种群
opts[epsilonprob_opsdisplay]--opts(1:2)等同于initializega的options参数，第三个参数控制是否输出，一般为0。如[1e-610]
termFN--终止函数的名称,如['maxGenTerm']
termOps--传递个终止函数的参数,如[100]
selectFN--选择函数的名称,如['normGeomSelect']
selectOps--传递个选择函数的参数,如[0.08]
xOverFNs--交叉函数名称表，以空格分开，如['arithXoverheuristicXoversimpleXover']
xOverOps--传递给交叉函数的参数表，如[20;23;20]
mutFNs--变异函数表，如['boundaryMutationmultiNonUnifMutationnonUnifMutationunifMutation']
mutOps--传递给交叉函数的参数表,如[400;61003;41003;400]


