clear;
clc;

image = imread("lena.jpg");
[m, n] = size(image);

figure(1);
new_image = zeros(m + 50, n + 50, 'uint8');
new_image(26:m+25, 26:n+25) = image;
imshow(new_image);

%%
figure(2);
new2_image = image;
elipse = @(x, y) ((x - (m/2))^2)/((m/2)^2) + ((y - (n/2))^2)/((n/2)^2);
for k = 1:m
    for l = 1:n
        if elipse(k, l) > 1
            new2_image(k, l) = 255;
        end
    end
end
imshow(new2_image);