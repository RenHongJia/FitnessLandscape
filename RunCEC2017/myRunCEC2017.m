clc;
clear;
% addpath(genpath(pwd));
% d=[5,15,30];
%d=[2,5,15,30];
%func_num = 1;
% d=[2,10,30,50,100]; % cec2017


% 维度
d=[10];
[m n] = size(d);
%运行次数
totalTime = 1;
% test 测试
func_list = [1:1];
% all functions 所有函数 
%func_list = [1:25];


result = [];

FDC = '';
title = '';
R = '';

fname = 'CEC2017'


FDC1.Cfb = 0;
FDC1.Cd = 0;
FDC1.Cdb = 0;
FDC1.Cfd = 0;
FDC1.af = 0;
FDC1.ad = 0;
FDC1.r = 0;

global H;
H = zeros(size(func_list,2), 9);

for func_num = func_list
    for time = 1:totalTime
        for i = 1:n
            con  = 1;
            while(con >0)
                clc;
                if (CheckFile(func_num,d(i))==0)
                    [FVr_x,S_y,I_nf,OUTPUT] = runTestCEC2017(func_num,d(i));
                     FDC = [FDC OUTPUT.FDC];
                    result(func_num, time) = S_y.FVr_oa(1);
                else
                    result(func_num, time) = 0;
                    FDC = [FDC FDC1];
              
                end
                %             con = input('请输入‘回车’继续下一维，‘其他键’重跑，‘ctrl+c’ 结束:');
                con = 0;
            end
        end
    end
end

PlotFDC(func_list, fname, FDC);
GetEntropy(H, fname,func_list)

%% 检查文件
% func_num:测试函数编号
% D: 维度
function re = CheckFile(func_num,D)
re = 0;
if func_num == 2
    re = 3;
    disp("This function (F2) has been deleted");
elseif  func_num < 11 && D == 2 %前10个测试函数可以是2维
    re  = 0;
elseif (D==2&&((func_num>=17&&func_num<=22)||(func_num>=29&&func_num<=30)))
    disp("\nError: hf01,hf02,hf03,hf04,hf05,hf06,cf07&cf08 are NOT defined for D=2.\n");
    re = -1;
elseif func_num > 10 &&  func_num <21 && D == 2  %11-20个测试函数不可以是2维
    disp("Test functions 11-20  are only defined for D=10,30,50,100.");
    re = -1;
else
    dataFile = sprintf('M_%d_D%d.txt',func_num,D);
    if exist(dataFile,'file')==0
        %     error(['no data file:' dataFile]);
        disp("error:");
        disp(['no data file:' dataFile]);
        re = 1;
    end
    dataFile = sprintf('shift_data_%d.txt',func_num);
    if exist(dataFile,'file')==0
        %     error(['no data file:' dataFile]);
        disp("error:");
        disp(['no data file:' dataFile]);
        re = 2;
    end
    dataFile = sprintf('input_data/shuffle_data_%d_D%d.txt',func_num,D);
    if exist(dataFile,'file')==0
        %    error(['no data file:' dataFile]);
        disp("error:");
        disp(['no data file:' dataFile]);
        re = 3;
    end
end

end
