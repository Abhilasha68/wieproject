%pttrans2%
a= imread('cameraman.tif');
ad=im2double(a);
x=ad;
[r,c]=size(ad);
factor=6;
for i=1:r
    for j=1:c %operating rowwisely%
        x(i,j)=factor *log(1+ ad(i,j));
    end
end
subplot(1,2,1);imshow(ad);title('Before');
subplot(1,2,2);imshow(x);title('After');

