xm1i=4;
ym1i=3;
xm2i=6;
ym2i=5;
v=1;
del_t=0.5;
del_theta=4;
list1x=[];
list2y=[];
list1y=[];
list2x=[];
list1x=[list1x xm1i];
list2x=[list2x xm2i];
list1y=[list1y ym1i];
list2y=[list2y ym2i];
sub1=100;
s=1;
xm1f=0;
ym1f=0;
sdel_theta=0;
while s<=10
    xm1=xm1i;
    xm2=xm2i;
    ym1=ym1i;
    ym2=ym2i;
    k=1;
    sdel_theta=del_theta+sdel_theta;
        rssival=rssiw(xm1,ym1,xm2,ym2);
        xm2=xm2+v*cosd(sdel_theta)*0.5;
        ym2=xm2+v*sind(sdel_theta)*0.5;
        list2x=[list2x xm2];
        list2y=[list2y ym2];
        for kl=1:0.05:2
            xm1=xm1+kl*cosd(sdel_theta)*0.5;
            ym1=ym1+kl*sind(sdel_theta)*0.5;
            rssival2=rssiw(xm1,ym1,xm2,ym2);
           
            %rssival2=rssi(wr,xm1,ym1,xm2,ym2,k1,k2);
            sub=rssival2-rssival;
            if(sub<sub1)
                sub1=sub;
                xm1f=xm1;
                ym1f=ym1;
%                 if(k==10)
%                     list1x=[list1x xm1];
%                     list1y=[list1y ym1];
%                     break;
%             else
%                 xm1f=xm1;
%                 ym1f=ym1;
            end
%             if(k==4)
%                 minsub=sub1;
%                 list1x=[list1x xm1f];
%                 list1y=[list1y ym1f];
%                 break;
%             end
        end
%                 end
%                 
%             end
%             sub1=sub;
%             
%             %break;
%         end
%         
%         break;
%     end
s=s+1;
list1x=[list1x xm1f];
list1y=[list1y ym1f];
   
end
v1=[list1x;list1y];
v2=[list2x;list2y];
for i=1:10
figure(1);
 plot(list1x(i),list1y(i),'o');
 xlim([0 10]);
 ylim([0 10]);
 hold on;
 plot(list2x(i),list2y(i),'^');
 xlim([0 10]);
 ylim([0 10]);
 pause(2);
end
% for i=1:3
%     
%     
%     %plot(list1x,list1y);
%     %plot(list2x,list2y);
%     %for j=1:2
%     figure(3);
%     axis([0 10 0 10]);
%     plot(v1(1,i),v1(2,i),'o');
%     hold on;
%     
%     %figure(2);
%     plot(v2(1,i),v1(2,i),'^');
%     %drawnow;
%     hold on;
%      
%     pause(2);
%     %end
%   
% end
function p=ang(x1,y1,x,y)
    j=(x-x1)/(y-y1);
    s=1/j;
    o=atan(s);
    p1=o*57.2958;
    if(x-x1<0&&y-y1<0)
        p=p1;
    end
    if(x-x1>0&&y-y1<0)
         p=p1+180;
    end
    if(x-x1>0&&y-y1>0)
         p=180+p1;
    end
    if(x-x1<0&&y-y1>0)
         p=360+p1;
    end
end

function dist=di(x1,y1,x,y)
     %list1=[x1 y1];
     %list2=[x2 y2];
     ds=(x-x1)^2+(y-y1)^2;
     fs=sqrt(ds);
     if(fs<0)
         fs=-1*fs;
     end
     dist=fs;
end
function rx=xc(t1,k1,x)
%global t1
    rx=x+((t1)*cosd(k1));
    
end
function ry=yc(t1,k1,y)
%global t1
    ry=y+((t1)*sind(k1));

end
function [u,v,yx,uy]=rssi(jk,x1,y1,x,y,k1,k2)
    %global t1 t2
    t1=jk;
    t2=jk+1;
    strf1="C:\Users\111117103\Downloads\angle_test_rssi\tile"+string(t1)+"_"+string(k1)+"deg.txt";
    strf2="C:\Users\111117103\Downloads\angle_test_rssi\tile"+string(t1)+"_"+string(k2)+"deg.txt";
    strf3="C:\Users\111117103\Downloads\angle_test_rssi\tile"+string(t2)+"_"+string(k1)+"deg.txt";
    strf4="C:\Users\111117103\Downloads\angle_test_rssi\tile"+string(t2)+"_"+string(k2)+"deg.txt";
    f1=readmatrix(strf1);
    f2=readmatrix(strf2);
    f3=readmatrix(strf3);
    f4=readmatrix(strf4);
    pos=randi([1 80]);
    tk1=f1(pos);
    tk2=f2(pos);
    tk3=f3(pos);
    tk4=f4(pos);
    xca1=xc(t1,k1,x);
    xca2=xc(t1,k2,x);
    xca3=xc(t2,k1,x);
    xca4=xc(t2,k2,x);
    yca1=yc(t1,k1,y);
    yca2=yc(t1,k2,y);
    yca3=yc(t2,k1,y);
    yca4=yc(t2,k2,y);
    
    dis1=di(x1,y1,xca1,yca1);
    dis2=di(x1,y1,xca2,yca2);
    dis3=di(x1,y1,xca3,yca3);
    dis4=di(x1,y1,xca4,yca4);
    A=[dis1 dis2 dis3 dis4];
    min_dist=min(A);
    if(min_dist==dis1)
        yx=xca1;
        uy=yca1;
    end
    if(min_dist==dis2)
        yx=xca2;
        uy=yca2;
    end
    if(min_dist==dis3)
        yx=xca3;
        uy=yca3;
    end
     if(min_dist==dis4)
        yx=xca4;
        uy=yca4;
     end
    sum_rssi=dis1*tk1+dis2*tk2+dis3*tk3+dis4*tk4;
    avg_rssi=sum_rssi/(dis1+dis2+dis3+dis4);
    u=avg_rssi;
    v=min_dist;
end
% function [u,v]=return_val(t1,t2)
%     global t1 t2
%     u=t1;
%     v=t2;
% end   
function u=rssiw(xm1,ym1,xm2,ym2)
    dis1=di(xm1,ym1,xm2,ym2);
    ang1=ang(xm1,ym1,xm2,ym2);
    wr=round(dis1);
    if(wr>=5)
        wr=4;
    end
    for i=0:11
        az=i*30;
        az1=az+30;
        if(ang1>az&&ang1<az1)
           k1=az;
           k2=az1;
        end
     
    end
    if(k2==360)
        k2=0;
    end
%     tl1=xm1-xm2;
%     tl1mod=abs(tl1);
%     tl2=ym1-ym2;
%     tl2mod=abs(tl2);
%     if(tl1mod<=5&&tl2mod<=5)
        u=rssi(wr,xm1,ym1,xm2,ym2,k1,k2);
    end
