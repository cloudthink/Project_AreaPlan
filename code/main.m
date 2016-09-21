clear,clc;
j=120%W
w=40%E
month=12
day=21

mubiao0 = struct('id',0,'quyu_sr',[-50,60],'quyu_sl',[50,60],'quyu_xr',[-50,-60],'quyu_xl',[50,-60],'quyu_h',0)
one = struct('id',1,'quyu_sr',[-170,60],'quyu_sl',[-120,60],'quyu_xr',[-170,-140],'quyu_xl',[-120,-140],'quyu_h',70)
two = struct('id',2,'quyu_sr',[-170,-170],'quyu_sl',[-120,-170],'quyu_xr',[-170,-230],'quyu_xl',[-120,-230],'quyu_h',60)
three = struct('id',3,'quyu_sr',[-70,-150],'quyu_sl',[80,-150],'quyu_xr',[-70,-230],'quyu_xl',[80,-230],'quyu_h',90)
four = struct('id',4,'quyu_sr',[110,-160],'quyu_sl',[190,-160],'quyu_xr',[110,-240],'quyu_xl',[190,-240],'quyu_h',90)
five = struct('id',5,'quyu_sr',[110,70],'quyu_sl',[180,70],'quyu_xr',[110,-70],'quyu_xl',[180,-70],'quyu_h',90)

n=0

for quyu=[one,two,three,four,five]
    n=n+1
    quyu_hh=quyu.quyu_h
    quyu_sr=quyu.quyu_sr;
    quyu_sl=quyu.quyu_sl;
    quyu_xr=quyu.quyu_xr;
    quyu_xl=quyu.quyu_xl;
     
    quyu=n
    [xxp,yyp]=zuobiao_yinying(quyu,quyu_sr,quyu_hh)
    all_xxp{n,1}=xxp
    all_yyp{n,1}=yyp
    [xxp,yyp]=zuobiao_yinying(quyu,quyu_sl,quyu_hh)
    all_xxp{n,2}=xxp
    all_yyp{n,2}=yyp
    [xxp,yyp]=zuobiao_yinying(quyu,quyu_xr,quyu_hh)
    all_xxp{n,3}=xxp
    all_yyp{n,3}=yyp
    [xxp,yyp]=zuobiao_yinying(quyu,quyu_xl,quyu_hh)
    all_xxp{n,4}=xxp
    all_yyp{n,4}=yyp

end
k=0
color=['r','c','m','y','g']
for mubiao=[one,two,three,four,five,mubiao0]       
    k=k+1
    quyu=k
    line([mubiao.quyu_sr(1),mubiao.quyu_sl(1)],[mubiao.quyu_sr(2),mubiao.quyu_sl(2)])
    line([mubiao.quyu_xr(1),mubiao.quyu_xl(1)],[mubiao.quyu_xr(2),mubiao.quyu_xl(2)])
    line([mubiao.quyu_sr(1),mubiao.quyu_xr(1)],[mubiao.quyu_sr(2),mubiao.quyu_xr(2)])
    line([mubiao.quyu_sl(1),mubiao.quyu_xl(1)],[mubiao.quyu_sl(2),mubiao.quyu_xl(2)])
    
    if k>0&&k<6
        g=length(all_xxp{k,2})
        fill([mubiao.quyu_sr(1),mubiao.quyu_sl(1),mubiao.quyu_xr(1),mubiao.quyu_xl(1)],[mubiao.quyu_sr(2),mubiao.quyu_sl(2),mubiao.quyu_xr(2),mubiao.quyu_xl(2)],color(quyu),'facealpha',0.5)
        fill([mubiao.quyu_sr(1),mubiao.quyu_xr(1),mubiao.quyu_sl(1),mubiao.quyu_xl(1)],[mubiao.quyu_sr(2),mubiao.quyu_xr(2),mubiao.quyu_sl(2),mubiao.quyu_xl(2)],color(quyu),'facealpha',0.5)
        fill([mubiao.quyu_sr(1),mubiao.quyu_xr(1),all_xxp{k,3}(1),all_xxp{k,1}(1)],[mubiao.quyu_sr(2),mubiao.quyu_xr(2),all_yyp{k,3}(1),all_yyp{k,1}(1)],color(quyu),'facealpha',0.5)
        fill([mubiao.quyu_sl(1),mubiao.quyu_xl(1),all_xxp{k,4}(g),all_xxp{k,2}(g)],[mubiao.quyu_sl(2),mubiao.quyu_xl(2),all_yyp{k,4}(g),all_yyp{k,2}(g)],color(quyu),'facealpha',0.5)
        
        
        line([all_xxp{k,1}(1),all_xxp{k,3}(1)],[all_yyp{k,1}(1),all_yyp{k,3}(1)])
        line([all_xxp{k,2}(1),all_xxp{k,4}(1)],[all_yyp{k,2}(1),all_yyp{k,4}(1)])
        line([all_xxp{k,1}(length(all_xxp{k,2})),all_xxp{k,3}(length(all_xxp{k,2}))],[all_yyp{k,1}(length(all_yyp{k,2})),all_yyp{k,3}(length(all_yyp{k,2}))])
        line([all_xxp{k,2}(length(all_xxp{k,4})),all_xxp{k,4}(length(all_xxp{k,2}))],[all_yyp{k,2}(length(all_yyp{k,2})),all_yyp{k,4}(length(all_yyp{k,2}))])
        
        fill([all_xxp{k,1},all_xxp{k,2}],[all_yyp{k,2},all_yyp{k,1}],color(quyu),'facealpha',0.5)
        fill([all_xxp{k,3},all_xxp{k,4}],[all_yyp{k,4},all_yyp{k,3}],color(quyu),'facealpha',0.5)
        fill([all_xxp{k,1},mubiao.quyu_xl(1)],[all_yyp{k,1},mubiao.quyu_xl(2)],color(quyu),'facealpha',0.5)
        fill([all_xxp{k,2},mubiao.quyu_xl(1)],[all_yyp{k,2},mubiao.quyu_xl(2)],color(quyu),'facealpha',0.5)
        fill([all_xxp{k,1},mubiao.quyu_xr(1)],[all_yyp{k,1},mubiao.quyu_xr(2)],color(quyu),'facealpha',0.5)
        fill([all_xxp{k,2},mubiao.quyu_xr(1)],[all_yyp{k,2},mubiao.quyu_xr(2)],color(quyu),'facealpha',0.5)
        
        %创建点集
        dianji{k,1}=[all_xxp{k,1}(1) all_xxp{k,2}(g) all_xxp{k,4}(g) mubiao.quyu_xr(1) mubiao.quyu_xl(1) all_xxp{k,3}(1) all_xxp{k,1}(1)]
        dianji{k,2}=[all_yyp{k,1}(1) all_yyp{k,2}(g) all_yyp{k,4}(g) mubiao.quyu_xr(2) mubiao.quyu_xl(2) all_yyp{k,3}(1) all_yyp{k,1}(1)]
        %plot(dianji{k,1},dianji{k,2},'+w',100,200,'*b')
        %in(k)=inpolygon(100,200,dianji{k,1},dianji{k,2})
    end
end

line([mubiao0.quyu_sr(1),mubiao0.quyu_sl(1)],[mubiao0.quyu_sr(2),mubiao0.quyu_sl(2)],'color',[1 1 1],'LineWidth',3)
line([mubiao0.quyu_xr(1),mubiao0.quyu_xl(1)],[mubiao0.quyu_xr(2),mubiao0.quyu_xl(2)],'color',[1 1 1],'LineWidth',3)
line([mubiao0.quyu_sr(1),mubiao0.quyu_xr(1)],[mubiao0.quyu_sr(2),mubiao0.quyu_xr(2)],'color',[1 1 1],'LineWidth',3)
line([mubiao0.quyu_sl(1),mubiao0.quyu_xl(1)],[mubiao0.quyu_sl(2),mubiao0.quyu_xl(2)],'color',[1 1 1],'LineWidth',3)
saveas(gcf,'C:\Users\think\Desktop\面积项目\out\示意图.jpg')


fuhe_p=0
p_n=0
x1=mubiao0.quyu_sr(1)
x2=mubiao0.quyu_sl(1)
y1=mubiao0.quyu_sr(2)
y2=mubiao0.quyu_xr(2)
for mubiao_x=[-50:1:50]
    for mubiao_y=[-60:1:60]
        p_n=p_n+1
        in_n=0
        for kk=[1:1:5]
            inin=inpolygon(mubiao_x,mubiao_y,dianji{kk,1},dianji{kk,2})
            if inin==1
                in_n=in_n+1
            end
        end
        if in_n<=3
            fuhe_p=fuhe_p+1
        end
    end
end
long=mubiao0.quyu_sl(1)-mubiao0.quyu_sr(1)
weight=mubiao0.quyu_sr(2)-mubiao0.quyu_xr(2)
all_mianji=long*weight
min_mianji=(fuhe_p/p_n)*(long*weight)
fp = fopen('C:\Users\think\Desktop\面积项目\out\结果.txt','wt')
fprintf(fp,'mubiaozongmianji:%f\nzuixiaomianji:%f',all_mianji,min_mianji)
%fprintf(fp,'zuixiaomianji:%f',min_mianji)