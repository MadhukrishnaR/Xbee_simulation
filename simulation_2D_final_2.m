x=2;%x_coordinate of the stationary x_bee
y=3;%y_coordinate of the staionary x_bee
x1=5;%x_coordinate of the starting point of the moving xbee
y1=7;%y_coordinate of the starting point of the moving xbee
%list1=[];
%list2=[];
a=ang(x1,y1,x,y);
w=di(x1,y1,x,y);
list1=[];
list2=[];
list1=[list1 x1];
list2=[list2 y1];
var=0;
%global t1 t2
while true
    a=ang(x1,y1,x,y);
    w=di(x1,y1,x,y);
    %j=string(w);
    jk=round(w);
    if(jk>=5)
        jk=4;
    end    
    for i=0:11
        az=i*30;
        az1=az+30;
        if(a>az&&a<az1)
           k1=az;
           k2=az1;
        end
     
    end
    if(k2==360)
        k2=0;
    end
    tl1=x-x1;
    tl1mod=abs(tl1);
    tl2=y-y1;
    tl2mod=abs(tl2);
    if(tl1mod<=5&&tl2mod<=5)
        %global t1 t2
        [rssival,mindist,fx,fy]=rssi(jk,x1,y1,x,y,k1,k2);
         %list1=[list1 fx];
        %list2=[list2  fy];
        m_line1=(fy-y1)/(fx-x1);
        m_line2=(fy-y)/(fx-x);
        if(fx<x1)
            delta_x1=x1-fx;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=x1;
        while er<=10
           xp=xp-fdelta_x1;
           yp=(xp-x1)*m_line1+y1;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
        end
        
        if(x<fx)
            delta_x1=fx-x;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=fx;
        while er<=10
           xp=xp-fdelta_x1;
           yp=(xp-x)*m_line2+y;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
        end
        
        break;
        
        elseif(fx<x)
            delta_x1=x-fx;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=x;
        while er<=10
           xp=xp-fdelta_x1;
           yp=(xp-fx)*m_line2+fy;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
        end
        break;
        else
            if(fy>y)
                yp=fy;
                del_y=(fy-y)/10;
                er=1;
                while er<=10
                    xp=fx;
                    yp=yp-del_y;
                    list1=[list1 xp];
                    list2=[list2 yp];
                    er=er+1;
                end
            end
            if(fy<y)
                yp=fy;
                del_y=(y-fy)/10;
                er=1;
                while er<=10
                    xp=fx;
                    yp=yp+del_y;
                    list1=[list1 xp];
                    list2=[list2 yp];
                    er=er+1;
                end
            end
            break;
        end
        %[a1,b1]=return_val(t1,t2);
        %rssival2=rssi(jk,fx,fy,x,y,k1,k2);
        
        elseif(x1<fx)
            delta_x1=fx-x1;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=x1;
        while er<=10
           xp=xp+fdelta_x1;
           yp=(xp-x1)*m_line1+y1;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
        end
        
        if(x<fx)
            delta_x1=fx-x;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=fx;
        while er<=10
           xp=xp-fdelta_x1;
           yp=(xp-x)*m_line2+y;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
        end
        
        break;
        
        elseif(fx<x)
            delta_x1=x-fx;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=x;
        while er<=10
           xp=xp-fdelta_x1;
           yp=(xp-fx)*m_line2+fy;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
        end
        break;
        else
            if(fy>y)
                yp=fy;
                del_y=(fy-y)/10;
                er=1;
                while er<=10
                    xp=fx;
                    yp=yp-del_y;
                    list1=[list1 xp];
                    list2=[list2 yp];
                    er=er+1;
                end
            end
            if(fy<y)
                yp=fy;
                del_y=(y-fy)/10;
                er=1;
                while er<=10
                    xp=fx;
                    yp=yp+del_y;
                    list1=[list1 xp];
                    list2=[list2 yp];
                    er=er+1;
                end
            end
            break;
        
        end
        %[a1,b1]=return_val(t1,t2);
        %rssival2=rssi(jk,fx,fy,x,y,k1,k2);
        else
            if(y1>fy)
            del_y=y1-fy;
            fdel_y=del_y/10;
            pe=1;
            while pe<=10
               xp=fx;
               yp=y1-fdel_y;
               list1=[list1 xp];
               list2=[list2 yp];
               pe=pe+1;
            end
        elseif(y1<fy)
             del_y=fy-y1;
            fdel_y=del_y/10;
            pe=1;
            while pe<=10
               xp=fx;
               yp=y1+fdel_y;
               list1=[list1 xp];
               list2=[list2 yp];
               pe=pe+1;
            end
            else
                list1=[list1 fx];
                list2=[list2 fy];
            end
            if(x<fx)
            delta_x1=fx-x;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=fx;
           while er<=10
           xp=xp-fdelta_x1;
           yp=(xp-x)*m_line2+y;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
           end
           break;
        
            elseif(fx<x)
            delta_x1=x-fx;
            fdelta_x1=delta_x1/10;
            er=1;
            xp=x;
           while er<=10
           xp=xp-fdelta_x1;
           yp=(xp-fx)*m_line2+fy;
           list1=[list1 xp];
           list2=[list2 yp];
           er=er+1;
           end
           break;
            else
            if(fy>y)
                yp=fy;
                del_y=(fy-y)/10;
                er=1;
                while er<=10
                    xp=fx;
                    yp=yp-del_y;
                    list1=[list1 xp];
                    list2=[list2 yp];
                    er=er+1;
                end
            end
            if(fy<y)
                yp=fy;
                del_y=(y-fy)/10;
                er=1;
                while er<=10
                    xp=fx;
                    yp=yp+del_y;
                    list1=[list1 xp];
                    list2=[list2 yp];
                    er=er+1;
                end
            end
            break;
            end
       end 
    %var=var+1;
    end 
end

v=[list1;list2];
%line(list1,list2);
% car = line([], [], 'MarkerSize', 10, 'Color', 'r');
% carx = list1(1); cary = list2(1);
% numxy = length(list1);
% carm = 'x';
% set(car, 'XData', carx, 'YData', cary, 'Marker', carm);
% drawnow;
%hold on;
for t=1:21
    figure(1);
    %axis([0 5 0 10]);
    plot(list1,list2);
    hold on;
    plot(v(1,t),v(2,t),'o');
    drawnow
    %delay(2);
    pause(0.5);
end
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
