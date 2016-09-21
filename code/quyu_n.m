function [all_xxp,all_yybp]=quyu_n(n,quyu_sr,quyu_xr,quyu_xl,quyu_h)
m=0
for quyu_zuobiao=[quyu_sr;quyu_sl;quyu_xr;quyu_xl]
    m=m+1
    %quyu_zuobiao=[-250,-280]
    %quyu_h=90
    quyu=n
    [xxp,yyp]=zuobiao_yinying(quyu,quyu_zuobiao,quyu_h)
    all_xxp{n,m}=xxp
    all_yyp{n,m}=yyp
end