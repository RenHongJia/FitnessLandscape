function  AnalyzeProblem(S_struct,func)
%ANALYZE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global H;
func_num = 1;
[walk, S_MSE] = GetRandomWalkFitness(S_struct, func, 500, 1);
if(strfind(S_struct.TestFunctionType, 'CEC') == 1)
    func_num = S_struct.func_num;
end

AutoCorrelation(S_MSE, S_struct);
    t  = AnalyzeH([S_MSE.FVr_oa]);
    H(func_num,:) = t;
%     GetEntropy(H,S_struct.TestFunctionType)

end

