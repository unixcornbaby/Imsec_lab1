%%%%%%%%%%%%%%%%%%%%
%      Part A      %
%%%%%%%%%%%%%%%%%%%%

test_A = loadImagesInDirectory('..\Images\test_A\');
test_projection = projectImages(test_A, Means, SpaceA);
%FigureHandle6 = plotFirst3Coordinates(test_projection, 5, 5);

%%%%%%%%%%%%%%%%%%%%
%      Part B      %
%%%%%%%%%%%%%%%%%%%%

figureHandle7 = approximateImage('..\Images\test_A\s1_6.jpg',Means,SpaceA,10);

%%%%%%%%%%%%%%%%%%%%
%      Part B      %
%%%%%%%%%%%%%%%%%%%%
figure()
model_first = model_projection(1:5:end,:);
test_rate=zeros(1,100);

for i=1:100
    test_rate(i) = identify(model_first,test_projection,i,1);
end

plot(test_rate)
xlabel('number of eigenfaces')
ylabel('identification rate')

