function    x=EEG_AR_psd(y,Fs,H_f,L_f) %对信号X的功率谱分析 频带占比

%%%%%%%%%%AR 模型

% H_f=[4,8,13,30,45];
% L_f=[1,4,8,13,30];

L=length(y);
y=double(y);
 [Pyy,W]=pyulear(y,10,256,Fs);%

for i=1:length(H_f)
     f_idx=Pyy(L_f(i):H_f(i)-1);%6-30hz
    
     sumx(i)=sum(f_idx); 
end
x= (sumx);
%   x=sumx/sum(sumx);

% x=f_idx;

%   x=Pyy(f_idx);
 %plot(x)
 %for i=
% f=f-Fs./2;
% subplot(2,1,2)
% plot(f,fftshift(Y));
% t=1;
% for i=1:length(Pyy)
%     if(f(i)<4)
%     %Pyy(i)=Pyy(i)^2;
%     %Pyy(i)=0.001;
%     f0(t)=Pyy(i);
%     t=t+1;
%     else
%        % break;
%     end    
% end
% delta=sum(f0);%4 8
% %Pyy1(1)=1.1;
% %Pyy=log10(Pyy);
% %sm=sum(Pyy1);
% %Pyy1=Pyy1;%/sm;%/sm;
% %Pyy1(48:52)=0;
% %sm=1;Pyy1=Pyy1/sm;%/sm;
% 
% t=1;
% %length(Pyy)
% for i=1:length(f)
%     if(f(i)>3)&(f(i)<8)
%         f1(t)=Pyy(i);
%         t=t+1;
%     end
% end
% theta=sum(f1);%4 8
% 
% t=1;
% for i=1:length(f)
%     if(f(i)>8)&(f(i)<10)
%         f2(t)=Pyy(i);
%         t=t+1;
%     end
% end
% alph1=sum(f2);%8 10
% 
% t=1;
% for i=1:length(f)
%     if(f(i)>10)&(f(i)<13)
%         f3(t)=Pyy(i);
%         t=t+1;
%     end
% end
% alph2=sum(f3);%10 13
% 
% t=1;
% for i=1:length(f)
%     if(f(i)>13)&(f(i)<18)
%         f4(t)=Pyy(i);
%         t=t+1;
%     end
% end
% beta1=sum(f4);%13 18
% 
% t=1;
% for i=1:length(f)
%     if(f(i)>18)&(f(i)<30)
%         f5(t)=Pyy(i);
%         t=t+1;
%     end
% end
% beta2=sum(f5);%18 30
% 
% t=1;
% for i=1:length(f)
%     if(f(i)>30)&(f(i)<45)
%         f6(t)=Pyy(i);
%         t=t+1;
%     end
% end
% gama=sum(f6);%30 45
% %plot(Pyy1);
% Pyy2(1)=delta;%/sm;0-4
% Pyy2(2)=theta;%/sm;%4 8
% Pyy2(3)=alph1;%/sm;%8 10
% Pyy2(4)=alph2;%/sm;/sm;%11 13
% Pyy2(5)=beta1;%/sm;/sm;
% Pyy2(6)=beta2;%/sm;/sm;
% Pyy2(7)=gama;%/sm;/sm;
% %f=zeros(1,length(Pyy1));
% %f(1,[18:60])=Pyy1(1,[18:60]);
% %x=f;
% Pyy2=log(Pyy2);
% sm=sum(Pyy2);
% %x=Pyy2/sm;
% x=Pyy;
% %x=Pyy1;
% %n=1:length(Pyy);
% %f=n*250/Fs;    %频率序列

%plot(f(1:length(Pyy)/5),Pyy(1:length(Pyy)/5));hold on;grid;
%x=Pyy(4:45);
