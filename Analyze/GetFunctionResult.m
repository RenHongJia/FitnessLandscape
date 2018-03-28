function [best,worst,mid,mean1,std1] = GetFunctionResult(result)
%GETFUNCTIONRESULT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[allfunc alltime] = size(result);
for i = 1: allfunc
    temp = result(i,:);
    best(i) = min(temp);
    worst(i) = max(temp);
    mean1(i) = mean(temp);
    std1(i) = mean(temp);
    ts = sort(temp);
    mid(i) = ts( round(alltime/2) );
end

a =  [best;mean1;mid;worst;std1]';
t =1;
end

