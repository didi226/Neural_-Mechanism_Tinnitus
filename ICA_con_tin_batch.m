% clc;clear all;close all
 function [x]= ICA_con_tin_batch(K)%  
% K=1;
%% 进行ICA
% ICA_healt_tinnitus_rest_1()
   M=[1 2 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20   22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 44 45 46 47  48 49 50   52 53 54 55   57 ];%
% M=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20   22 23 24 25 26 27 28 29 30 31 32    34   35 36 37 38 39 40 41   43];

% M=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20  21 22 23 24 25 26 27 28 29 30 31  33  34   35 36 37 38   40 41   43];
x=[];
M=1:14;
if(K==1)
   for I =11:14%length(M)
    I
    i=M(I);
% EEG = pop_loadset('filename',strcat(num2str(i), '_100_ica.set'),'filepath','D:\\HHY\\healthy subject\\healthy subject\\rest\\1\\');
EEG = pop_loadset('filename',strcat(num2str(i), '_100.set'),'filepath','D:\\RAWDdata\\lingnan\\task\\');
% D:\HHY\healthy subject\healthy subject\rest\1
EEG = eeg_checkset( EEG );
%EEG = pop_loadset('filename',strcat(num2str(i), '_0.set'),'filepath','setpath');%_0.set _1.set _2.set _100.set _101.set
%EEG = pop_runica(EEG, 'extended',1,'pca',m,'interupt','on'); % m 为3个被试中总电极数减去最大的坏导数
 
 EEG = pop_reref( EEG, []);
EEG = eeg_checkset( EEG );
 
EEG = pop_runica(EEG, 'extended',1,'interupt','on');
 
EEG = pop_saveset( EEG, 'filename',strcat(num2str(i), '_100_ica.set'), 'filepath','D:\RAWDdata\lingnan\task\');%_0_ica.set _1_ica.set _2_ica.set _100_ica.set _101_ica.set
   end
end

 

if(K==0)
   for I =11:14%length(M)
    I
    i=M(I);
% EEG = pop_loadset('filename',strcat(num2str(i), '_100_ica.set'),'filepath','D:\\HHY\\healthy subject\\healthy subject\\rest\\1\\');
EEG = pop_loadset('filename',strcat(num2str(i), '_101.set'),'filepath','D:\\RAWDdata\\lingnan\\task\\');
% D:\HHY\healthy subject\healthy subject\rest\1
EEG = eeg_checkset( EEG );
%EEG = pop_loadset('filename',strcat(num2str(i), '_0.set'),'filepath','setpath');%_0.set _1.set _2.set _100.set _101.set
%EEG = pop_runica(EEG, 'extended',1,'pca',m,'interupt','on'); % m 为3个被试中总电极数减去最大的坏导数
 
 EEG = pop_reref( EEG, []);
EEG = eeg_checkset( EEG );
 
EEG = pop_runica(EEG, 'extended',1,'interupt','on');
 
EEG = pop_saveset( EEG, 'filename',strcat(num2str(i), '_101_ica.set'), 'filepath','D:\RAWDdata\lingnan\task\');%_0_ica.set _1_ica.set _2_ica.set _100_ica.set _101_ica.set
   end
end

 
   
   