% function H = AnalyzeCEC(func_num)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 func_num = 25;
eps = 2;

dim = 2;
domain = [-100,100];
steps = 5000;
step_size = 1;
walk = RandomWalk(dim,domain,steps,step_size);

fhd=str2func('cec17_func');
fitness = feval(fhd,walk',func_num);

temp  = ([0 fitness]);
diff = fitness - temp(1:steps);
diff(1) = 0;
% si = zeros(1,steps);

eps =  min(diff);

t = 1;
for e = [0, eps/128, eps/64, eps/32, eps/16, eps/8, eps/4, eps/2, eps]
si = (diff < - e) * -1 + ( abs(diff) <= e) * 0 + (diff > e) * 1;
p = zeros(1,6);
for i = 2:(steps - 1)
    if(si(i) == 0 && si(i+1) == 1) % 0 1
        p(1) = p(1) + 1;
    elseif(si(i) == 0 && si(i+1) == -1) % 0 -1
        p(2) = p(2) + 1;
    elseif(si(i) == 1 && si(i+1) == 0) % 1 0
        p(3) = p(3) + 1;
    elseif(si(i) == 1 && si(i+1) == -1) % 1 -1
        p(4) = p(4) + 1;
    elseif(si(i) == -1 && si(i+1) == 0) % -1 0
        p(5) = p(5) + 1;
    elseif(si(i) == -1 && si(i+1) == 1) % -1 1
        p(6) = p(6) + 1;
    end
end
 p = p / (steps - 2);
 H(t) = - sum(p .* (log2(p)/log2(6)) );
 t = t + 1;
 
end
H = max(H);
ttt  = 1;
% end