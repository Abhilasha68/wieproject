%Point transformations%
i= imread('cameraman.tif');
i1=i>120;
imshow(i1)
id=double(i);
id1=id+100;
imshow(uint8(id1));

id2=id-50;
imshow(uint8(id2));
figure,imshow(i);
id2=imadd(i,100);
figure,imshow(id2);
y=imsubtract(i,50);
figure,imshow(y);
y=immultiply(i,0.6);
figure,imshow(y);
y=imdivide(i,2);
figure,imshow(y);
y=imcomplement(i);
figure,imshow(y);