function FDC = CalFDC(S_bestmem,S_bestva_FVr_oa,iter,S_struct)
%CalFDC ����FDC
%   S_bestmem �㷨����õ������Ÿ���
%   S_bestva_FVr_oa �㷨����õ�������ֵ
%   iter ���еĵ�������
%   S_struct �ṹ�壬���в��������ã���Ҫ��ȫ�����Ÿ���Ͷ�Ӧ����Ӧֵ��
FDC.Cfb = sum(S_bestva_FVr_oa)/iter;
FDC.Cd = pdist2( S_bestmem(1:iter,:) ,S_struct.bestmemit);
FDC.Cdb = sum(FDC.Cd)/iter;
FDC.Cfd = sum((S_bestva_FVr_oa -  FDC.Cfb) .* (FDC.Cd - FDC.Cdb))/iter;
FDC.af = std2(S_bestva_FVr_oa);
FDC.ad = std2(FDC.Cd);
FDC.r =  FDC.Cfd/FDC.af/FDC.ad;
end

