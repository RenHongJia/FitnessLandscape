clc;
clear;
%AddWorkPath;
%ά��
% d=[5,15,30];
d=[5];
% d=[2];
n = size(d,2);
% all function :func_list + func_list2
% func_list = {'Ackley','Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226','Spherical'};
% test ���� 
% func_list = {         'Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226'};
 func_list = {'Rosenbrock'};
func_list2 = {'Beale','GoldsteinPrice'}; %ֻ��2ά

%  FDC = zeros(1,size(func_list,2));
func_size = size(func_list,2);
FDC = '';
title = '';

global H;
H = zeros(size(func_list,2), 9);

for func = func_list
    j = 1;
    for i = 1:n
        con  = 1;
        while(con >0)
            clc;
            [OUTPUT] = runTestOldFunctions(func{1},d(i));
            FDC = [FDC OUTPUT.FDC];
            title = [title func{1}];
            j = j+1;
%             con = input('����������,�س�������һά:');
            con = 0;
        end
    end
%     input('�������:');
    
end

fname = 'classic function';
% �������� FDC �� Entropy
PlotFDC(func_list, fname ,FDC);
GetEntropy(H, fname,func_list);


function fun_all()
func_list = {'Ackley','Beale','GoldsteinPrice','Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226','Spherical'}
for func = func_list
    disp(func{1});
end
end