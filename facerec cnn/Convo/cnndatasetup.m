train_y=zeros(60,10);
for i=1:10
    k=6*i-5;
    l=6*i;
    for j=k:l
train_y(j,i)=1;
    end
end

disp(train_y);
train_x = [];
for m=1:10
    
TrainDatabasePath='E:\pss projects\FEI\';
 
%no_images=size(dir([TrainDatabasePath,'\*']),1)-size(dir([TrainDatabasePath,'\*m']),1)-2;

disp('Loading Faces');
 
    
   
       
    for i=2:7
    sj=int2str(i);
    si=int2str(m);
    str=strcat(TrainDatabasePath,si,'-0',sj,'.jpg');
    img = imread(str);
    %imshow(img);
    img = rgb2gray(img);
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    train_x = [train_x temp]; % 'T' grows after each turn                    
    end
    
end
TestDatabasePath='E:\pss projects\FEI\9-0';
 
%no_images=size(dir([TrainDatabasePath,'\*']),1)-size(dir([TrainDatabasePath,'\*m']),1)-2;
test_x = [];
disp('Loading Faces');
 
    
   
       
    for i=5:6
        sk=int2str(i);
        str=strcat(TestDatabasePath,sk,'.jpg');
    
        img = imread(str);
        %imshow(img);
        img = rgb2gray(img);
        [irow icol] = size(img);
   
        temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
        test_x = [test_x temp]; % 'T' grows after each turn   
    end
        test_y=zeros(2,10);
        test_y(1,5)=1;
        test_y(2,5)=1;
        %disp(test_y);



save FEI_CNN.mat train_x train_y test_x test_y

  
