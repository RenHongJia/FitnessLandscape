clc;
clear;
% addpath(genpath(pwd));

d=[2,10];
[m n] = size(d);
FDC = '';
title = '';
for func_num = 1:2
    for i = 1:n
        con  = 1;
        while(con >0)
            clc;
%             if (CheckFile(func_num,d(i))==0)
                [FVr_x,S_y,I_nf,OUTPUT] = runTestCEC2005(func_num,d(i));
                 FDC = [FDC OUTPUT.FDC];
                 title = sprintf("func %d ", func_num);
%             end
            con = input('�����롮�س���������һά���������������ܣ���ctrl+c�� ����:');
        end
    end
end

%% ����ļ�
% func_num:���Ժ������
% D: ά��
function re = CheckFile(func_num,D)
re = 0;

end
