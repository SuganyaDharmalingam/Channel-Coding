%this is the main file which calls the function Polar to encode and decode
%the polar code

% For (64, 32) code
e = 1; i = 1;
EbNo = zeros(1,4);FER = zeros(1,4); BER = zeros(1,4); NB = zeros(1,4);  %preallocating
NBIT = zeros(1,4); NBL = zeros(1,4);
disp('Calculations for (64, 32) code')
while (e <= 4)
    [E, F, B, Nb, Nbit, Nblk] = Polar(64, 32, e); %calling the function
    e = e+0.5; %jump for SNR
    EbNo(i) = E;
    FER(i) = F;
    BER(i) = B;
    NB(i) = Nb;
    NBIT(i) = Nbit;
    NBL(i) = Nblk;
    i = i+1;
end
disp('SNR for (64, 32) code is: ')
disp(EbNo(:))
disp('BER for (64, 32) code is: ')
disp(BER(:))
disp('FER')
disp(FER(:))
disp('Number of block error for (64, 32) code is:')
disp(NB(:))
disp('Number of bit error for (64, 32) code is: ')
disp(NBIT(:))
disp('Graphs')
%plotting the BER vs SNR graph for (64, 32)code
figure
semilogy(EbNo,BER,...
    'Marker', '>',...
    'MarkerEdgeColor', 'g')
hold on
semilogy(EbNo,FER,...
    'Marker', 'o',...
    'MarkerEdgeColor', 'b')
legend('BER', 'FER')
title('BER and FER vs SNR(dB)')
grid on

%Comments: 1. Processing Time increases as the length of code word
              %increases (8.349 Sec for (64,32) & 133.890 Sec for (1024,512))
          %2. BER & FER reduces for higher DB values
          %3. Number of Bit error & Block error reduces as the DB values increases.
          %4. For code length(1024):Number of Bit error & Block error vanishes for DB
              %values 3.5 and 4
