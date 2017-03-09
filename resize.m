%Resizing images%
x=imread('cameraman.tif');
y=imresize(x,2);
figure,imshow(y);
figure,imagesc(y),colormap(gray);
