% ±ßÔµ¼ì²â
img=rgb2gray(imread('mouse.png'));
imshow(img) %Í¼1(a)
background=rgb2gray(imread('background.png'));
imshow(background) %Í¼1(b)
edgesobel1=edge(img,'Sobel');
imshow(edgesobel1) %Í¼2(a)
edgecanny1=edge(img,'Canny');
imshow(edgecanny1) %Í¼2(b)
edgesobel2=edge(background,'Sobel');
imshow(edgesobel2) %Í¼2(c)
edgecanny2=edge(background,'Canny');
imshow(edgecanny2) %Í¼2(d)

% ±ß½ç¸ú×Ù
imgbw=~imbinarize(img);
imshow(imgbw) %Í¼3(a)
imgbwf=imfill(imgbw,'holes');
imshow(imgbwf) %Í¼3(b)
boundaries=bwboundaries(imgbwf);
figure;
hold on;
m=length(boundaries);
axis equal;
for k=1:m
    b=boundaries{k};
    plot(b(:,2),b(:,1),'g','LineWidth',0.8); % »æÖÆÃ¿Ìõ±ß½ç
end
set(gca,'YDir','reverse');
hold off

% ±³¾°²î·Ö
diff=imsubtract(background,img);
imshow(diff) %Í¼4(a)
diffbw=imbinarize(diff);
imshow(diffbw) %Í¼4(b)
diffbwf=imfill(diffbw,'holes');
imshow(diffbwf) %Í¼4(c)
diffboundaries=bwboundaries(diffbwf);
figure;
hold on;
m=length(diffboundaries);
axis equal;
for k=1:m
    b=diffboundaries{k};
    plot(b(:,2),b(:,1),'g','LineWidth',0.8); % »æÖÆÃ¿Ìõ±ß½ç
end
set(gca,'YDir','reverse');
hold off
