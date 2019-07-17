clc;clear;

objectname = "obama2trump";
estimateLength = 100;

ImageFold = "dataset/Images/"+ objectname +"/"+ objectname +"_minus/";
saveFold = "dataset/Images/"+ objectname +"/"+ objectname +"_minus_FR/"+ num2str(estimateLength) +"/";

FileFolder = fullfile(ImageFold);
DirOutput = dir(fullfile(FileFolder,"*.jpg"));
FileNames = {DirOutput.name};

[m,n] = size(FileNames);

% for i = 1:n
%     if i==n break; end
%     name1 = FileNames(1,i);
%     path1 = strcat(ImageFold,name1);
%     img1 = imread(path1);
%     
%     name2 = FileNames(1,i+1);
%     path2 = strcat(ImageFold,name2);
%     img2 = imread(path2);
%     
%     img_minus = img1-img2;
%     imwrite(img_minus,saveFold+num2str(i)+".jpg");
%     
% end

%%估计指纹
for i = 1:estimateLength:n
    for j = 0:estimateLength-1
        name = FileNames(1,i+j);
        path = strcat(ImageFold,name);
        Images(j+1).name = path;
    end    
    RP = getFingerprint(Images);
    RP = rgb2gray1(RP);
    sigmaRP = std2(RP);%计算矩阵元素的标准差
    Fingerprint = WienerInDFT(RP,sigmaRP);
    imwrite(Fingerprint,saveFold + objectname + "_minus_FR_" + num2str(i) + "_" + num2str(i+estimateLength-1) + ".jpg")
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

