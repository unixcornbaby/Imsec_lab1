    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                    TP 1 -- IMSECU                      %
    %                        06/03/18                        %
    %                                                        %
    % Camille PLAYS & William CLOT                Exercice 4 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% REMINDER : PLEASE EXECUTE PREVIOUS EXERCICES BEFORE EXECUTING THIS FILE

close all;

%% Part A : Computing identification rates for set B

train_B = loadImagesInDirectory('../Images/train_B/');
test_B = loadImagesInDirectory('../Images/test_B/');

projection_trainB_A = projectImages(train_B, Means, SpaceA);
projection_testB_A = projectImages(test_B, Means, SpaceA);
FigureHandle8 = plotFirst3Coordinates(projection_trainB_A, 5, 5);

trainB_A_rate=zeros(1,100);

for i=1:100
    trainB_A_rate(i) = identify(projection_trainB_A,projection_testB_A,i,1);
end


figure('Name','Identification rates for set B in space A','NumberTitle','off')

[rateB_A_max, rateB_A_index] = max(trainB_A_rate);
x=[rateB_A_index,rateB_A_index];
y=[0,rateB_A_max];

plot(trainB_A_rate)
xlabel('Number of eigenfaces')
ylabel('Identification rate B on SpaceA')

hold on %Adding the maximum value
plot(x,y);
hold off

disp('Best identification rate :')
disp(rateB_A_max)
disp('when using this number of eigenfaces :')
disp(rateB_A_index)


%% Part B : Computing the eigenspace B

[MeansB, SpaceB, EigenvaluesB] = buildSpace(train_B);
projection_trainB_B = projectImages(train_B, MeansB, SpaceB);
projection_testB_B = projectImages(test_B, MeansB, SpaceB);

FigureHandle9 = plotFirst3Coordinates(projection_testB_B, 5, 5);

trainB_B_rate=zeros(1,100);

for i=1:100
    trainB_B_rate(i) = identify(projection_trainB_B,projection_testB_B,i,1);
end

figure('Name','Identification rates for set Bin space B','NumberTitle','off')

[rateB_B_max, rateB_B_index] = max(trainB_B_rate);
x=[rateB_B_index,rateB_B_index];
y=[0,rateB_B_max];

plot(trainB_B_rate)
xlabel('Number of eigenfaces')
ylabel('Identification rate B on SpaceB')

hold on %Adding the maximum value
plot(x,y);
hold off

disp('Best identification rate :')
disp(rateB_B_max)
disp('when using this number of eigenfaces :')
disp(rateB_B_index)

