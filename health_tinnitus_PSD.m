function [A] = health_tinnitus_PSD(signal,fs)%
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%signal：低频信号
%signal：高频信号
%h_f,l_f：h_f(1)/h_f(2)为高频滤波上限和下限，l_f(1)/l_f(2)为低频滤波上限和下限
%fs：采样率

% H_f=[4,8,10,13,20,30,45];%7
% L_f=[2,4,8,10,13,20,30];
% H_f=[4,6,8,10,13,16,18,24,30,36,45];%11
% L_f=[2,4,6,8,10,13,16,18,24,30,36];
% size(signal)
% H_f=[5,6,8,10,13,16,20,24,28,32,36,40,45];
% L_f=[3,4.5,6,8,10,13,16,20,24,28,32,36,40];
H_f=[4,8,12,20,30,45];
L_f=[1,4,8,13,20,30];
H_f=[4,8,10,13,20,30,45];
L_f=[1,4,8,10,13,20,30];
H_f=[4,8,13,30,45];
L_f=[1,4,8,13,30];
% for i=1:length(H_f)
%      data_bandp0(i,:) = eegfilt(signal,fs,L_f(i),H_f(i),0,[],0,'fir1',0);%事先滤波好放进数组
% %      data1= eegfilt(w,250,1,45,0,[],'fir1');
% 
% end
fs=250;
T=1;
N=2;%间隔秒数
N=1;
% N=0.5;
M=15*250;
M=10*250;
   M=2*250;
      M=5*250;
% H_f=2:45;
% L_f=1:44;
K0=250;
%   M=2*250;
data_bandp0=signal;
 K=floor((length(signal)-M)/250/N);%数据分段长度：M
% K=floor((length(signal)-K0)/K0);%数据分段长度：M
% length(signal)/250
%  for  i=1:length(H_f)
 Y=[];
     for j=1:K
     y= data_bandp0(:,((j-1)*250*N+1:(j-1)*250*N+M));
      Y(j,:)= EEG_AR_psd(y,fs,H_f,L_f);
  
     end
%  end
% A=mean(Y,1);
A=Y;
% H_f=[4,8,10,13,16,20,24,28,32,36,40,45];%12
% L_f=[2,4,8,10,13,16,20,24,28,32,36,40];
% for ii=1:length(H_f)%1:7
%     for jj=(ii+1):length(H_f)% i:7
%         l_f(1)=L_f(ii);l_f(2)=H_f(ii);
%         h_f(1)=L_f(jj);h_f(2)=H_f(jj);
%        plv=Tinnitus_PAC(signal,l_f,h_f,fs);%        
%        L_H_plv3(1,ii,jj)=plv(1);
%         L_H_plv3(2,ii,jj)=plv(2);
%     end
% 
% end

