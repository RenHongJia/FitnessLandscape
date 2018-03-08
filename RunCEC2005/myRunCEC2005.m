clc;
clear;
% addpath(genpath(pwd));

d=[30];
[m n] = size(d);
FDC = '';
title = '';
R = '';
times = 25;
func_size = 25

result = zeros(func_size, times);

FDC1.Cfb = 0;
FDC1.Cd = 0;
FDC1.Cdb = 0;
FDC1.Cfd = 0;
FDC1.af = 0;
FDC1.ad = 0;
FDC1.r = 0;

for func_num = 2:func_size
    for i = 1:n
        con  = 1;
        while(con >0)
            for c = 1:times
                clc;
                 if (CheckFile(func_num,d(i))==0)
                    [FVr_x,S_y,I_nf,OUTPUT] = runTestCEC2005(func_num,d(i));
                     FDC = [FDC OUTPUT.FDC];
                     title = sprintf("func %d ", func_num);
                 else
                      FDC = [FDC FDC1];
                 end
                 result(func_num,c) = S_y.FVr_oa;
                 var1 = var(result');
                 std1 = std(result');
                 con = 0;
    %             con = input('�����롮�س���������һά���������������ܣ���ctrl+c�� ����:');
            end
            end
    end
end

figure;
func_size = size(FDC,2);
x=[21:25];
bar(x, [FDC.r]);
xlabel("���Ժ���");
ylabel("FDCϵ��");
hold on;
y  = repelem(0.75,1,func_size+2);
plot([20:1:26],y,'--');
y  = repelem(0.15,1,func_size+2);
plot([20:1:26],y,'--');
hold off;

%% ����ļ�
% func_num:���Ժ������
% D: ά��
function re = CheckFile(func_num,D)
re = 0;
if func_num == 12 || func_num == 21
    re = 1;
    disp("����12����");
end
    
end
