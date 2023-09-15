% For (1024, 512) code
e = 1;i = 1;
EbN_o = zeros(1,4);FE_R = zeros(1,4); BE_R = zeros(1,4); N_B = zeros(1,4);  %preallocating 
NB_IT= zeros(1,4); NB_Lk = zeros(1,4);
disp('Calculations for (1024, 512) code')
while (e <= 4)
    [E, F, B, Nb, Nbit, Nblk] = Polar(1024, 512, e); %calling the function
    e = e+0.5;
    EbN_o(i) = E;
    FE_R(i) = F;
    BE_R(i) = B;
    N_B(i) = Nb;
    NB_IT(i) = Nbit;
    NB_Lk(i) = Nblk;
    i = i+1;
end
disp('SNR for (1024, 512) code is : ')
disp(EbN_o(:))
disp('BER for (1024, 512) code is: ')
disp(BE_R(:))
disp('Number of block error for (1024, 512) code is:')
disp(N_B(:))
disp('Number of bit error for (1024, 512) code is: ')
disp(NB_IT(:))

disp('Graphs')
%plotting the BER vs SNR graph for (1024, 512)code
figure
semilogy(EbN_o,BE_R,...
    'Marker', '>',...
    'MarkerEdgeColor', 'g')
hold on
semilogy(EbNo,FE_R,...
    'Marker', 'o',...
    'MarkerEdgeColor', 'b')
legend('BER', 'FER')
title('BER and FER vs SNR(dB)')
grid on


%Comments: 1. Processing Time increases as the length of code word
              %increases (8.349 Sec for (64,32) & 133.890 Sec for (1024,512))
          %2. BER & FER reduces for higher DB values
          %3. BER Values are comparitively higher than code (64,32) for DB values 1 tp
              %2 and reduces drastically for the higher values and reaches zero for DB values 3.5
              %and 4
          %4. Number of Bit error & Block error reduces as the DB values increases.
          %5. For code length(1024):Number of Bit error & Block error vanishes for DB
              %values 3.5 and 4


% Submitted by :
% Chhavi Dadhich - Matrix No: 11147450
% Dharmalingam Suganya - Matrix No: 11148547
