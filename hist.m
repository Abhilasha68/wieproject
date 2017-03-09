i =imread('cameraman.tif');
figure;
subplot(1,2,1);imshow(i);
subplot(1,2,2);imhist(i);
%stretching%
imh=imadjust(i,[0.1,0.2],[0.01,1.6]);
imh1=histeq(i);%histogram equalization%
figure;
subplot(2,2,1);imshow(imh);title('STRETCH');
subplot(2,2,2);imhist(imh);
subplot(2,2,3);imshow(imh1);title('histeq');
subplot(2,2,4);imshow(imh1);
