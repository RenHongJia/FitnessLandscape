clc;
clear;
%AddWorkPath;
% d=[5,15,30];
d=[5];
% d=[2];
n = size(d,2);
% func_list = {'Ackley','Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226','Spherical'};
% func_list = {'Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226'};
 func_list = {'Rosenbrock'};
func_list2 = {'Beale','GoldsteinPrice'}; %ֻ��2ά
%  FDC = zeros(1,size(func_list,2));
func_size = size(func_list,2);
FDC = '';
title = '';
for func = func_list
    j = 1;
    for i = 1:n
        con  = 1;
        while(con >0)
            clc;
            [OUTPUT] = runTest(func{1},d(i));
            FDC = [FDC OUTPUT.FDC];
            title = [title func{1}];
            j = j+1;
%             con = input('����������,�س�������һά:');
            con = 0;
        end
    end
%     input('�������:');
    
end

PlotFDC(func_list, FDC);


function fun_all()
func_list = {'Ackley','Beale','GoldsteinPrice','Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226','Spherical'}
for func = func_list
    disp(func{1});
end
end