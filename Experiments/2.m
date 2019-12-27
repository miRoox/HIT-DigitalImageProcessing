% ��Ե���
img=rgb2gray(imread('mouse.png'));
imshow(img) %ͼ1(a)
background=rgb2gray(imread('background.png'));
imshow(background) %ͼ1(b)
edgesobel1=edge(img,'Sobel');
imshow(edgesobel1) %ͼ2(a)
edgecanny1=edge(img,'Canny');
imshow(edgecanny1) %ͼ2(b)
edgesobel2=edge(background,'Sobel');
imshow(edgesobel2) %ͼ2(c)
edgecanny2=edge(background,'Canny');
imshow(edgecanny2) %ͼ2(d)

% �߽����
imgbw=~imbinarize(img);
imshow(imgbw) %ͼ3(a)
imgbwf=imfill(imgbw,'holes');
imshow(imgbwf) %ͼ3(b)
boundaries=bwboundaries(imgbwf);
figure;
hold on;
m=length(boundaries);
axis equal;
for k=1:m
    b=boundaries{k};
    plot(b(:,2),b(:,1),'g','LineWidth',0.8); % ����ÿ���߽�
end
set(gca,'YDir','reverse');
hold off

% �������
diff=imsubtract(background,img);
imshow(diff) %ͼ4(a)
diffbw=imbinarize(diff);
imshow(diffbw) %ͼ4(b)
diffbwf=imfill(diffbw,'holes');
imshow(diffbwf) %ͼ4(c)
diffboundaries=bwboundaries(diffbwf);
figure;
hold on;
m=length(diffboundaries);
axis equal;
for k=1:m
    b=diffboundaries{k};
    plot(b(:,2),b(:,1),'g','LineWidth',0.8); % ����ÿ���߽�
end
set(gca,'YDir','reverse');
hold off
