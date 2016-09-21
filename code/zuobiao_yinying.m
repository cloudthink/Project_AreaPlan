function [xxp,yyp]=zuobiao_yinying(quyu,quyu_zuobiao,quyu_h)
jingdu=120%W
weidu=40%E
month=12
day=21

n=0
%quyu_zuobiao=quyu_xl
for t=[9:0.1:15]
    n=n+1
    %ce=deg2rad(120)
    [beta,L]=i_all_o_p(jingdu,weidu,t,month,day,quyu_h)
    betas(n)=beta
    l(n)=L
    xx(n)=L*sin(beta)
    yy(n)=L*cos(beta)
    if t<=12
        xxp(n)=quyu_zuobiao(1)-xx(n)
        yyp(n)=quyu_zuobiao(2)+yy(n)
    else
        xxp(n)=quyu_zuobiao(1)+xx(n)
        yyp(n)=quyu_zuobiao(2)+yy(n)
    end 
end
color=['r','c','m','y','g']
plot(xxp,yyp,color(quyu),quyu_zuobiao(1),quyu_zuobiao(2),'+')
%line([quyu_zuobiao(1),xxp(1)],[quyu_zuobiao(2),yyp(1)])
%line([quyu_zuobiao(1),xxp(length(xxp))],[quyu_zuobiao(2),yyp(length(xxp))])
fill([xxp,quyu_zuobiao(1)],[yyp,quyu_zuobiao(2)],color(quyu),'facealpha',0.5)

hold on