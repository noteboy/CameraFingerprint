FRFolder = "dataset/Images/obama2trump/obama2trump_FR/10/"
minusFRFolder = "dataset/Images/obama2trump/obama2trump_minus_FR/10/"
savefolder = "dataset/Images/obama2trump/obama2trump_FR_minusFR/10/"


FRFileFolder = fullfile(FRFolder);
FPDirOutput = dir(fullfile(FRFileFolder,"*.jpg"));
FRFileNames = {FPDirOutput.name};

[m1,n1] = size(FRFileNames);

minusFRFileFolder = fullfile(minusFRFolder);
minusFRDirOutput = dir(fullfile(minusFRFileFolder,"*.jpg"));
minusFRFileNames = {minusFRDirOutput.name};

[m2,n2] = size(minusFRFileNames);

n = min(n1,n2)
for i = 1:n
    FRname = FRFileNames(1,i);
    FRpath = strcat(FRFolder,FRname);

    minusFRname = minusFRFileNames(1,i);
    minusFRpath = strcat(minusFRFolder,minusFRname);
    
    FR = imread(FRpath);
    minusFR = imread(minusFRpath);
    
    result = FR - minusFR;
    figure(1);
    subplot(1,3,1);imshow(FR);
    subplot(1,3,2);imshow(minusFR);
    subplot(1,3,3);imshow(result);
    
    
    imwrite(result,savefolder+num2str(i)+".jpg");
    
end
