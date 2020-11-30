clear 
clc
a = imread('1_infrared.jpg');
b = imread('1_visible.jpg');
n = 4; 
lmd = 200;
a = double(a);
b = rgb2gray(b);
b = double(b);

[ga, la] = laplas(a,n);
[gb, lb] = laplas(b,n);
lf = cell(n,1);
r = abs(la{n});
p = r./max(max(r));
c = atan(lmd*p)/atan(lmd);
lf{n} = c.*la{n} + (1-c).*lb{n};

for j=1:n-1
    lf{j} = bidaxiao(la{j},lb{j});
end

img = lf{n};
for k = n-1:-1:1
    img = imresize(img,[size(lf{k},1),size(lf{k},2)],'bilinear');
    img = imfilter(img,fspecial('gaussian',[5,5],64),'conv','same','replicate');
    img = img + lf{k};
end

imshow([a b img],[]);