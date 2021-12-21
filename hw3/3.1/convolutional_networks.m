clear all;

exerciseNumber = 4;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);

options = trainingOptions('sgdm', ...
  'Momentum',0.9, ...
  'InitialLearnRate',0.001, ...
  'MaxEpochs',60, ...
  'MiniBatchSize',8192, ...
  'Shuffle', 'every-epoch', ...
  'ValidationData',{xValid, tValid}, ...
  'ValidationFrequency',30, ...
  'ValidationPatience',5, ...
  'Plots','training-progress');

layers = [
  imageInputLayer([28 28 1]);
  convolution2dLayer(5, 20, 'Padding', 1, 'WeightsInitializer', 'narrow-normal');
  reluLayer
  maxPooling2dLayer(2, 'Stride', 2);
  fullyConnectedLayer(100, 'WeightsInitializer', 'narrow-normal');
  reluLayer
  fullyConnectedLayer(10, 'WeightsInitializer', 'narrow-normal');
  softmaxLayer
  classificationLayer
];

network1 = trainNetwork(xTrain, tTrain, layers, options);

trainPred1 = classify(network1, xTrain);
validPred1 = classify(network1, xValid);
testPred1 = classify(network1, xTest);

trainError1 = sum(trainPred1 ~= tTrain)./numel(tTrain);
validError1 = sum(validPred1 ~= tValid)./numel(tValid);
testError1 = sum(testPred1 ~= tTest)./numel(tTest);

fprintf('The training set error is: %.4f\n.', trainError1);
fprintf('The validation set error is: %.4f\n.', validError1);
fprintf('The test set error is: %.4f\n.', testError1);

clear all;

exerciseNumber = 4;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);

options = trainingOptions('sgdm', ...
  'Momentum',0.9, ...
  'InitialLearnRate',0.01, ...
  'MaxEpochs',30, ...
  'MiniBatchSize',8192, ...
  'Shuffle', 'every-epoch', ...
  'ValidationData',{xValid, tValid}, ...
  'ValidationFrequency',30, ...
  'ValidationPatience',5, ...
  'Plots','training-progress');

layers = [
  imageInputLayer([28 28 1]);
  convolution2dLayer(3, 20, 'Padding', 1, 'WeightsInitializer', 'narrow-normal');
  batchNormalizationLayer
  reluLayer
  maxPooling2dLayer(2, 'Stride', 2);
  convolution2dLayer(3, 30, 'Padding', 1, 'WeightsInitializer', 'narrow-normal');
  batchNormalizationLayer
  reluLayer
  maxPooling2dLayer(2, 'Stride', 2);
  convolution2dLayer(3, 50, 'Padding', 1, 'WeightsInitializer', 'narrow-normal'); 
  batchNormalizationLayer
  reluLayer
  fullyConnectedLayer(10, 'WeightsInitializer', 'narrow-normal');
  softmaxLayer
  classificationLayer
];

network2 = trainNetwork(xTrain, tTrain, layers, options);

trainPred2 = classify(network2, xTrain);
validPred2 = classify(network2, xValid);
testPred2 = classify(network2, xTest);

trainError2 = sum(trainPred2 ~= tTrain)./numel(tTrain);
validError2 = sum(validPred2 ~= tValid)./numel(tValid);
testError2 = sum(testPred2 ~= tTest)./numel(tTest);

fprintf('The training set error is: %.4f\n.', trainError1);
fprintf('The validation set error is: %.4f\n.', validError1);
fprintf('The test set error is: %.4f\n.', testError1);

