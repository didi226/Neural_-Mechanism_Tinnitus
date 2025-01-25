
clc;clear all;%%读取正常人任务态数据并进行分段：  正常人数据：0：1：

% EEG = pop_loadcnt('D:\patient_tast\1.cnt' , 'dataformat', 'auto', 'memmapfile', '');
% EEG = eeg_checkset( EEG );
% EEG = pop_saveset( EEG, 'filename','1.set','filepath','D:\\syx_p_rw\\');
% EEG = eeg_checkset( EEG );
x = dir('F:\HHY\health tast\1\*.cnt');%  D:\patient_tast\patient_tast_data
%  x = dir('D:\patient_tast\patient_tast_data\*.cnt');
L1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];%T7-T3 T8-T4 P7-T5 P8-T6
L2=[3,4,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,28,29,30,31,32,34,35,36];%排序以此为准 绘图以次为准
d1=struct2cell(x);
KK=size(d1,2);
 H_f=[4,8,13,30,45];
L_f=[1,4,8,13,30];
fs=250;
MM=2500;%读取分段长度
t=1;k=1;fs=250;SS0=[];SS1=[];W=[];n=1;K=1;T=1;LL1=0;m=1;LL=[];V=1;B=1;EEG_Sg2=[];
 for i=M:M%1:11%M:M%KK%5:8%1:4%43:KK%读每个cnt文件
%       i=1
i
      d3=str2mat(d1(1,i));     
      d3;
     EEG = pop_loadcnt(strcat('F:\HHY\health tast\1\',d3), 'dataformat', 'auto', 'memmapfile', '');
 %     EEG = pop_loadcnt(strcat('B:\huagong tast\1\data_task\',d3), 'dataformat', 'auto', 'memmapfile', '');
 EEG=pop_chanedit(EEG, 'lookup','D:\\toolbox\\eeglab13_0_0b\\eeglab13_0_0b\\plugins\\dipfit2.2\\standard_BESA\\standard-10-5-cap385.elp');
     R=size(EEG.data,1);%32/36
     R0(i)=R;
     pause(3)
     R1=EEG.event;
if((R==32)&length(R1)==4)
      %电极电位 重参考 通道选择
%        EEG = pop_reref( EEG, []);%EEG = pop_reref( EEG, [27 33] );
EEG = pop_select( EEG,'nochannel',{'HEOG' 'VEOG'});  
S=[];
K=1;T=1;
 HH = read_eeg_marker_tast(EEG);%1:心算 0:安静
%        S0=EEG.data(:,[HH(2,1):HH(2,2)]);
 EEG1 = pop_epoch( EEG, {  '1'  '3'  '5'  '7'  '9' '11'  '13'  '15'  '17'  '19' '21'  '23'  '25'  '27'  '29'  }, [10 60], 'newname', 'CNT file epochs', 'epochinfo', 'yes');
%  EEG = pop_saveset( EEG, 'filename',strcat(num2str(i), '_CG_1.set'), 'filepath','D:\zhengchang_tast\');%路径1=D:\patient_tast
 EEG2 = pop_epoch( EEG, {   '2'  '4'  '6'  '8'  '10' '12'  '14'  '16'  '18'  '20' '22'  '24'  '26'  '28'  '30' }, [10 60], 'newname', 'CNT file epochs', 'epochinfo', 'yes');
S1=reshape(EEG1.data,30,size(EEG1.data,2)*size(EEG1.data,3));
 S2=reshape(EEG2.data,30,size(EEG2.data,2)*size(EEG2.data,3));
for ii=1:30
     S1(ii,:)= eegfilt(S1(ii,:),fs,1,45,0,[],0,'fir1',0);%          
end

for ii=1:30
     S2(ii,:)= eegfilt(S2(ii,:),fs,1,45,0,[],0,'fir1',0);%     
end

%   S= pop_reref_1(S);%平均参考
   [data_clean,data_rec,DL0,rej_num,ss1] =Tinnitus_ICA_eye(S,M0);
    F(:,2)=data_clean(1,1:250*750);
    F(:,1)=data_rec(1,1:250*750);
 rej_num0(i)=rej_num;
[SS1,FS0]=Tinnitus_ICA_dele_1(data_clean);%剔除异常肌电
%   NN=floor(size(SS,2)/MM)
% if(size(SS,2)>120*250)
%  [data_clean,data_rec,DL0,Z] =Tinnitus_ICA(SS1);%ICA
data_clean=SS1;
[SS]=Remove_baddata_epoch(data_clean(:,:));%30 *N 剔除异常幅值
[SS]=Remove_baddata_epoch_1(SS);%30 *N 剔除异常高幅值
 NN=floor(size(SS,2)/MM)
for ii=1:NN
ss=SS(:,[((ii-1)*MM+1):ii*MM]);
EEG_Sg2(:,:,B)=squeeze(ss)';
B=B+1;
end
 B=1;    
end
      %%%%%%%%%5
      %%%%%%%%%%
 
      %%%%%%%%%%%%%%%%
if((R==36)&length(R1)==4)
      %电极电位 重参考 通道选择
     %   EEG = pop_reref( EEG, [27 33] );
EEG = pop_select( EEG,'nochannel',{'HEOL' 'HEOR' 'VEOU' 'VEOL' 'A1' 'A2'});   
S=[];
K=1;T=1;   
EEG1 = pop_epoch( EEG, {  '1'  '3'  '5'  '7'  '9' '11'  '13'  '15'  '17'  '19' '21'  '23'  '25'  '27'  '29'  }, [10 60], 'newname', 'CNT file epochs', 'epochinfo', 'yes');
%  EEG = pop_saveset( EEG, 'filename',strcat(num2str(i), '_CG_1.set'), 'filepath','D:\zhengchang_tast\');%路径1=D:\patient_tast
 EEG2 = pop_epoch( EEG, {   '2'  '4'  '6'  '8'  '10' '12'  '14'  '16'  '18'  '20' '22'  '24'  '26'  '28'  '30' }, [10 60], 'newname', 'CNT file epochs', 'epochinfo', 'yes');
S1=reshape(EEG1.data,30,size(EEG1.data,2)*size(EEG1.data,3));
 S2=reshape(EEG2.data,30,size(EEG2.data,2)*size(EEG2.data,3));
 
for ii=1:30
     S1(ii,:)= eegfilt(S1(ii,:),fs,1,45,0,[],0,'fir1',0);%          
end

for ii=1:30
     S2(ii,:)= eegfilt(S2(ii,:),fs,1,45,0,[],0,'fir1',0);%     
end
%   S= pop_reref_1(S);%平均参考
%     [data_clean,data_rec,DL0,Z] =Tinnitus_ICA_eye(S);%ICA
    size(S1);
   [data_clean,data_rec,DL0,rej_num,ss1] =Tinnitus_ICA_eye(S1,M0);
    F(:,2)=data_clean(1,1:250*750);
    F(:,1)=data_rec(1,1:250*750);
%   rej_num0(i)=rej_num;
 rej_num0(i)=rej_num;
[SS1,FS0]=Tinnitus_ICA_dele_1(data_clean);%剔除异常肌电
% [SS1,FS0]=Tinnitus_ICA_dele_1(EEG.data);%剔除异常肌电
% [SS1,FS0]=Tinnitus_ICA_dele_1(S);%剔除异常肌电
%   NN=floor(size(SS,2)/MM)
% if(size(SS,2)>120*250)
%  [data_clean,data_rec,DL0,Z] =Tinnitus_ICA(SS1);%ICA
data_clean=SS1;
[SS]=Remove_baddata_epoch(data_clean(:,:));%30 *N 剔除异常幅值
size(SS)
[SS]=Remove_baddata_epoch_1(SS);%30 *N 剔除异常幅值
size(SS)
 NN=floor(size(SS,2)/MM)
for ii=1:NN
ss=SS(:,[((ii-1)*MM+1):ii*MM]);
EEG_Sg2(:,:,B)=squeeze(ss)';
B=B+1;
end
 B=1;    
end
            %%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%5
 save(strcat('F:\HHY\health tast\1\',strcat('EEG_tast_health_hhy_',num2str(i))), 'EEG_Sg2');%strcat(num2str(i), '_100.set')

%%%%%%%%%%%%%%%%%%%55
 end   
R0;
rej_num0
 %%%%%%%%%%%%%%%%%%%%
 %数据异常剔除
% rest_health.open=SS1(LL(:,1),:,:,:);
% rest_health.close=SS0(LL(:,1),:,:,:);
% rest_health.LL=LL;
% rest_health.tips='H_f=[4,8,13,30,45];L_f=[1,4,8,13,30]; 函数：EEG_sleep_fft_00，约10秒1段,W:剔除异常数据后对应subject标号';
% save(strcat('D:\zhengchang resting\tinnitus_resting_data\','EEG_rest_health_ica'), 'EEG_Sg');%路径1=D:\patient_tast

 %%%%%%%%%%%%%%%%%%%%%
% z=x;filename = 'chronic_test';
% for k=1:length(x)
% system(['ren "F:\sunyixian data\test chronic\' z(k).name '" ' filename '_' int2str(k) '.mat']);
% end;

%1改名：filename_new
%2重采样/取30个导联： [x,H]=Sun_Yat_sen_readdata(N)
%3滤波0.5-45带通/保存为set格式：Sun_Yat_sen_dataproceed()
%4取特征：[S1]=Sun_Yat_sen_readdata_1(N)

