
clc;clear;

objectname = "obama2trump";

ImageFold = "dataset\Images\"+ objectname +"\"+ objectname +"\";
saveFold = "dataset\Images\"+ objectname +"\"+ objectname +"_noise\";

FileFolder = fullfile(ImageFold);
DirOutput = dir(fullfile(FileFolder,"*.jpg"));
FileNames = {DirOutput.name};

[m,n] = size(FileNames);

for i = 1:n
    name = FileNames(1,i);
    imx = strcat(ImageFold,name);
    img = imread(imx);
    Noisex = NoiseExtractFromImage(img,2);
    Noisex = WienerInDFT(Noisex,std2(Noisex));
    %imshow(Noisex);
    imwrite(Noisex,saveFold + objectname + "_noise_" + num2str(i) + ".jpg")
end





% % Camera identification example
% 
% 'Example - Do the three images represent the same camera that took the image Pxxx.jpg?'
% im1 = 'Images\P1.jpg',
% im2 = 'Images\P2.jpg',
% im3 = 'Images\P3.jpg',
% %im4 = 'Images\Pxxx.jpg',
% Images(1).name = im1;  Images(2).name = im2; 
% Images(3).name = im3; %Images(4).name = im4;
% RP = getFingerprint(Images);
% RP = rgb2gray1(RP);
%     sigmaRP = std2(RP);
% Fingerprint = WienerInDFT(RP,sigmaRP);
% imwrite(Fingerprint,"d.jpg")
% imx = 'Images\Pxxx.jpg',
% Noisex = NoiseExtractFromImage(imx,2);
% Noisex = WienerInDFT(Noisex,std2(Noisex));
% 
% % The optimal detector (see publication "Large Scale Test of Sensor Fingerprint Camera Identification")
% Ix = double(rgb2gray(imread(imx)));
% C = crosscorr(Noisex,Ix.*Fingerprint);
% detection = PCE(C)

