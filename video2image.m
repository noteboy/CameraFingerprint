%将视频每一帧存储起来

clc;
clear;

DataFold = "dataset/Videos/"
ImageFold = "dataset/Images/"

FileFolder = fullfile(DataFold);
DirOutput = dir(fullfile(FileFolder,"*.mp4"));
FileNames = {DirOutput.name};

[m,n] = size(FileNames)
for i = 1:n
    name1 = FileNames(1,i);
    name = name1{1,1}(1:end-4)
    if ~exist("dataset/Images/"+ name,"dir")
       mkdir("dataset/Images/",name) 
    end
    
    path = strcat(DataFold,name1);
    VideoObj = VideoReader(path{1,1});
    nframes = get(VideoObj,"NumberOFFrames");
    for j = 1:nframes
       currentFrame = read(VideoObj,j);
       imwrite(currentFrame,ImageFold+name+"/"+name+"_"+num2str(j)+".jpg");
    end
    
end
