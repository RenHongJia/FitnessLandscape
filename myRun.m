clc;
clear;
%AddWorkPath;
% d=[5,15,30];
d=[2];
% d=[2];
n = size(d,2);
func_list = {'Ackley','Beale','GoldsteinPrice','Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226','Spherical'}
for func = func_list
    for i = 1:n
        con  = 1;
        while(con >0)
            clc;
            runTest(func{1},d(i));
            con = input('����������,�س�������һά:');
        end
    end
end

function fun_all()
func_list = {'Ackley','Beale','GoldsteinPrice','Griewank','Quadric','Quartic','Rastrigin','Rosenbrock','Salomon','Schwefel222','Schwefel226','Spherical'}
for func = func_list
    disp(func{1});
end
end