function PlotFDC(func_list, fname,FDC) 
% Ref.
% M��ller C L, Sbalzarini I F. Global characterization of the CEC 2005 fitness landscapes using fitness-distance analysis[C]
% //European Conference on the Applications of Evolutionary Computation. Springer, Berlin, Heidelberg, 2011: 294-303.
%

%PlotFDC ����FDC�ĶԱȷ���
%   func_list �����Ĳ��Ժ���
%   FDC ����õ���FDC����Ҫ��Ҫ�������ϵ��r


func_size = size(func_list,2);
figure;
x=[1:func_size];
bar(x,[FDC.r]);
xlabel("���Ժ���");
ylabel("FDCϵ��");
title("FDC");
hold on;
y  = repelem(0.75,1,func_size+2);
plot([0:1:(func_size+1)],y,'--');
y  = repelem(0.15,1,func_size+2);
plot([0:1:(func_size+1)],y,'--');
hold off;
print(gcf,'-dpng', ['.\img\FDC\',fname, ' FDC.png']);
end

