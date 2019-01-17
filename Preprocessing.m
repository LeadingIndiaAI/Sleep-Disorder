function final()
    %close all; 
    clear all;    
    clc;
    
    x=csvread('h4.csv',1);
    figure('Name','Original Signal');
    plot(x);
    Fs=500;
    t=(0:length(x)-1)*1/Fs;
    CutFrq1=[30 13 12 8 7 4 3 0.5];
    %head = ['H','L','M','S','V'];  %Creating an excel file for output
    %xlswrite('output.xls',head,1,'A1');            %with heading alpha,beta etc.
    ImfByFilter=sp_DFTOrthogonalOrFIR_IIR_LINOEP(x,t,Fs,CutFrq1,'dft'); % 'dft' or 'fir'

            for i=1:length(CutFrq1)+1 
                Data(:,i)=ImfByFilter{i}; 
            end
     figure('Name','classification of alpha,beta,theta,delta waves');
     subplot(4,1,1);
     plot(Data(:,2))
     title("Beta")
     subplot(4,1,2);
    plot(Data(:,4))
     title("Alpha")
     subplot(4,1,3);
     plot(Data(:,6))
     title("Theta")
     subplot(4,1,4);
     plot(Data(:,8))
     title("Delta")

xoo = Data(:,2);                                %Beta Activity
nfft = 2^nextpow2(length(xoo));
Pxx = abs(fft(xoo,nfft)).^2/length(xoo)/Fs;

hi = max(Pxx);          %Maximum value
lo = min(Pxx);          %Minimum value
mea = mean(Pxx,'all');  %Mean value
sd = std(Pxx);          %Standard Deviation 
vr = var(Pxx);          %Variance
barray =[hi lo mea sd vr];
%Exceltowrite = [{'Max','Min','Mean','Standard Deviation','Variance'};barray];
%xlswrite('output.xls',barray,1,'A2');


xooa = Data(:,4);                                %Alpha Activity
nfft = 2^nextpow2(length(xooa));
Pxx2 = abs(fft(xooa,nfft)).^2/length(xooa)/Fs;

hi2 = max(Pxx2);          %Maximum value
lo2 = min(Pxx2);          %Minimum value
mea2 = mean(Pxx2,'all');  %Mean value
sd2 = std(Pxx2);          %Standard Deviation 
vr2 = var(Pxx2);          %Variance
aarray =[hi2 lo2 mea2 sd2 vr2];
%Exceltowrite = [{'Max','Min','Mean','Standard Deviation','Variance'};barray];
%xlswrite('output.xls',aarray,1,'A3');

xoot = Data(:,6);                                %Theta Activity
nfft = 2^nextpow2(length(xoot));
Pxx3 = abs(fft(xoot,nfft)).^2/length(xoot)/Fs;

hi3 = max(Pxx3);          %Maximum value
lo3 = min(Pxx3);          %Minimum value
mea3 = mean(Pxx3,'all');  %Mean value
sd3 = std(Pxx3);          %Standard Deviation 
vr3 = var(Pxx3);          %Variance
tarray =[hi3 lo3 mea3 sd3 vr3];
%Exceltowrite = [{'Max','Min','Mean','Standard Deviation','Variance'};barray];
%xlswrite('output.xls',tarray,1,'A4');

xood = Data(:,8);                                %Delta Activity
nfft = 2^nextpow2(length(xood));
Pxx4 = abs(fft(xood,nfft)).^2/length(xood)/Fs;

hi4 = max(Pxx4);          %Maximum value
lo4 = min(Pxx4);          %Minimum value
mea4 = mean(Pxx4,'all');  %Mean value
sd4 = std(Pxx4);          %Standard Deviation 
vr4 = var(Pxx4);          %Variance
darray =[hi4 lo4 mea4 sd4 vr4];
%Exceltowrite = [{'Max','Min','Mean','Standard Deviation','Variance'};barray];
%xlswrite('output.xls',darray,1,'A5');

farray = [hi hi2 hi3 hi4 lo lo2 lo3 lo4 mea mea2 mea3 mea4 sd sd2 sd3 sd4 vr vr2 vr3 vr4];
xlswrite('output.xls',farray,1,'A11');

%xoo = xoo / sqrt( sum( xoo.^2 ) );
figure('Name',"Normalized wave");
subplot(4,1,1);
plot(Pxx);
title("Beta");
subplot(4,1,2);
plot(Pxx2);
title("Alpha");
subplot(4,1,3);
plot(Pxx3);
title("Theta");
subplot(4,1,4);
plot(Pxx4);
title("Delta");

    ImfByFilter=sp_DFTOrthogonalOrFIR_IIR_LINOEP(x,t,Fs,CutFrq1,'dft'); % use 'dft' or 'fir'
end
