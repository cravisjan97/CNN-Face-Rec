load cnn.mat;
        TestDatabasePath='E:\pss projects\FEI\';
        %label=5;
        %test=5;
       
        label=inputdlg('Enter the ID no.:','Label');
        label=str2double(label);
        rt=int2str(label);
        expectimage=strcat('E:\pss projects\FEI-2\',rt,'-05.jpg');
        imshow(expectimage);
        test=inputdlg('Enter the test image:','Test');
        dlg_title='Test';
        test=str2double(test);
         im=strcat('E:\pss projects\FEI-2\',int2str(test),'-05.jpg');
        SelectedImage=imread(im);
        imshow(SelectedImage);
        
        
        TestDatabasePath=strcat(TestDatabasePath,int2str(test),'-0');
        
 
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
    test_x = double(reshape(test_x,28,28,2 ))/255;
        test_y=zeros(2,10);
        test_y(1,label)=1;
        test_y(2,label)=1;
        test_y = double(test_y');

[er, bad] = cnntest(cnn, test_x, test_y);

%plot mean squared error
%figure; plot(cnn.rL);
%assert(er<0.12, 'Too big error');
if(er<0.12)
    disp('YES');
end
if(er>0.12)
    disp('NO');
end

subplot(121),imshow(SelectedImage);
title('Test Face');
if(er<0.12)
    text(100,600,'ACCESS GRANTED','Color','green','FontSize',35);
end
if(er>0.12)
    text(100,600,'ACCESS DENIED','Color','red','FontSize',35);
end
subplot(122);
imshow(expectimage);
title('Expected Face');
 

 
       