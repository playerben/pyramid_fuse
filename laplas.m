function [Gau, laplas] = laplas(I,num)
Gau=cell(num,1);
N=1;
Gau{N}=I;
h=fspecial('gaussian',[5,5],64);
for N=2:num
    temp=imfilter(Gau{N-1},h,'conv','same','replicate');
    Gau{N}=temp(1:2:end,1:2:end,:);
end
temp=Gau{size(Gau,1)};
% for N=1:num
%     figure;
%     imshow(Gau{N});
% end
%���в����������˹����������
laplas=cell(num,1);
for index=num-1:-1:1
    temp=imresize(Gau{index+1},[size(Gau{index},1),size(Gau{index},2)],'bilinear');%�ϲ�������������˹������
    temp=imfilter(temp,h,'conv','same','replicate');
    laplas{index}=Gau{index}-temp;
end
laplas{num}=Gau{num};
% for N=1:num
%     figure;
%     imshow(laplas{N},[]);
% end
end
%���в����������˹����������
%����������˹�������ع�
% img=Gau{N};
% for index2=N:-1:2
%     temp=imresize(Gau{index2},[size(Gau{index2-1},1),size(Gau{index2-1},2)],'bilinear');
%     temp=imfilter(temp,h,'conv','same','replicate');
%     img=temp+laplas{index2-1};
% end
% imshow(laplas{3});