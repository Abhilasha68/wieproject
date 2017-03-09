i=imread('cameraman.tif');
f=ones(3,3)/9;
f

i1=filter2(f,i,'same');
imshow(i1/255);
figure;imshow(i);