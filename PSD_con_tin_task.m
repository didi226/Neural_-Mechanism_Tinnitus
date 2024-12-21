 
function [ psd_t02] = PSD_con_tin_task(M)%

H_f=[4,8,13,30,45];
L_f=[1,4,8,13,30];
 t0=[];Fs=250;
M=[1 2   4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20    22 23 24 25 26 27 28 29 30 31 32 33  34  35 36 37 38 39 40 41 42    44 45 46 47  48 49 50   52 53 54 55   57];% 3:只有两轮任务态的数据
M=1:52;
%EEG = pop_loadset('filename',strcat(num2str(i), '_100_icaed.set'),'filepath','D:\\RAWDdata\\health\\rest\\icaed\\');
for I=1:52;
i=M(I);
EEG = pop_loadset('filename',strcat('h_',num2str(i), '_2_ica_ok.set'),'filepath','D:\\RAWDdata\\select data\\health\\task\\');
s=EEG.data;
% s= eeg_rest_1S_del_close_2(s,45);  30       15000          15
% s=reshape(s,30,size(s,2)*size(s,3));
% s= eeg_rest_1S_del_close_2(s,s,70);

  for m=1:15
      m
      s=squeeze(EEG.data(:,:,m));
      s= eeg_rest_1S_del_close_2(s,s,70);
      NN=12;
   for n=1:30
     
  % t0(n,:,i)=EEG_fft_AR_1(s(n,:),Fs,H_f,L_f) ;
            aa= health_tinnitus_PSD(s(n,:),Fs);
           aaa=cat(1,aa,aa((2*size(aa,1)-59):size(aa,1),:));%补长 到60S
            
             t0(m,n,:,:)=aaa;
       end
   end
 save(strcat('D:\RAWDdata\select data\result\PSD\',strcat('h_2_',num2str(I))), 't0');%strcat(num2str(i), '_100.set')
 t0=[];
end












