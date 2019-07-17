% Camera identification example
clear;
'Example - Do the three images represent the same camera that took the image Pxxx.jpg?'
im1 = 'Images\430.jpg',
im2 = 'Images\431.jpg',
im3 = 'Images\432.jpg',
% im4 = 'Images\433.jpg',
% im5 = 'Images\434.jpg',
% im6 = 'Images\435.jpg',
% im7 = 'Images\436.jpg',
% im8 = 'Images\437.jpg',
% im9 = 'Images\438.jpg',
%im10 = 'Images\439.jpg',
Images(1).name = im1;  Images(2).name = im2; 
Images(3).name = im3; 
% Images(4).name = im4;
% Images(5).name = im5;
% Images(6).name = im6;
% Images(7).name = im7;
% Images(8).name = im8;
% Images(9).name = im9;
%Images(10).name = im10;
RP = getFingerprint(Images);
RP = rgb2gray1(RP);
    sigmaRP = std2(RP);
Fingerprint = WienerInDFT(RP,sigmaRP);
%imwrite(Fingerprint,"b.jpg")
imx = 'Images\a.jpg',
Noisex = NoiseExtractFromImage(imx,2);
Noisex = WienerInDFT(Noisex,std2(Noisex));
% The optimal detector (see publication "Large Scale Test of Sensor Fingerprint Camera Identification")
Ix = double(rgb2gray(imread(imx)));
C = crosscorr(Noisex,Ix.*Fingerprint);
detection = PCE(C)

