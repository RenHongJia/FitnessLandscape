function PlotFDC(func_list, FDC) 
%PlotFDC ����FDC�ĶԱȷ���
%   func_list �����Ĳ��Ժ���
%   FDC ����õ���FDC����Ҫ��Ҫ�������ϵ��r
func_size = size(func_list,2);
figure;
x=[1:func_size];
bar(x,[FDC.r]);
xlabel("���Ժ���");
ylabel("FDCϵ��");
hold on;
y  = repelem(0.75,1,func_size+2);
plot([0:1:(func_size+1)],y,'--');
y  = repelem(0.15,1,func_size+2);
plot([0:1:(func_size+1)],y,'--');
hold off;
end

