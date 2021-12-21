
%clear all;

%load('Net1', 'network1');
%{
exerciseNumber = 4;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);
numOfImages = size(xTrain, 4);
xTrain = reshape(xTrain, 784, numOfImages)./255;
xValid = reshape(xValid, 784, size(xValid,4))./255;

options = trainingOptions('adam', ...
  'InitialLearnRate',0.001, ...
  'MaxEpochs',1, ...
  'MiniBatchSize',8192, ...
  'Shuffle', 'every-epoch', ...
  'ValidationData',{xValid, xValid}, ...
  'ValidationFrequency',30, ...
  'ValidationPatience',5, ...
  'Plots','training-progress', ...
  'ExecutionEnvironment', 'gpu');

layers = [
  sequenceInputLayer(784);
  fullyConnectedLayer(50, 'WeightsInitializer', 'glorot');
  reluLayer
  fullyConnectedLayer(2, 'WeightsInitializer', 'glorot');
  reluLayer
  fullyConnectedLayer(784, 'WeightsInitializer', 'glorot');
  reluLayer
  regressionLayer
];
%}
%{
  network1 = trainNetwork(xTrain, xTrain, network1.Layers, options);
trainPred1 = predict(network1, xTrain);

layers_encode1 = network1.Layers(1:5);
layers_encode1(6) = regressionLayer;
encoder1 = assembleNetwork(layers_encode1);

layers_decode1 = sequenceInputLayer(2);
layers_decode1(2:4) = network1.Layers(6:8);
decoder1 = assembleNetwork(layers_decode1);

testDataSize = size(xTest, 4);
xTest1 = reshape(xTest, 784, testDataSize)./255;
testEnc1 = predict(encoder1, xTest1);
testDec1 = predict(decoder1, testEnc1);

save('Net1');
%}
%clear all;

%load('Net2', 'network2');

exerciseNumber = 4;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);
numOfImages = size(xTrain, 4);
xTrain = reshape(xTrain, 784, numOfImages)./255;
xValid = reshape(xValid, 784, size(xValid,4))./255;

options = trainingOptions('adam', ...
  'InitialLearnRate',0.001, ...
  'MaxEpochs',40, ...
  'MiniBatchSize',8192, ...
  'Shuffle', 'every-epoch', ...
  'ValidationData',{xValid, xValid}, ...
  'ValidationFrequency',30, ...
  'ValidationPatience',5, ...
  'Plots','training-progress', ...
  'ExecutionEnvironment', 'gpu');
%{
layers = [
  sequenceInputLayer(784);
  fullyConnectedLayer(50, 'WeightsInitializer', 'glorot');
  reluLayer
  fullyConnectedLayer(4, 'WeightsInitializer', 'glorot');
  reluLayer
  fullyConnectedLayer(784, 'WeightsInitializer', 'glorot');
  reluLayer
  regressionLayer
];
%}
%network2 = trainNetwork(xTrain, xTrain, network2.Layers, options);
trainPred2 = predict(network2, xTrain);

layers_encode2 = network2.Layers(1:5);
layers_encode2(6) = network2.Layers(8);
encoder2 = assembleNetwork(layers_encode2);

layers_decode2 = sequenceInputLayer(4);
layers_decode2(2:4) = network2.Layers(6:8);
decoder2 = assembleNetwork(layers_decode2);

testDataSize = size(xTest, 4);
xTest2 = reshape(xTest, 784, testDataSize)./255;
testEnc2 = predict(encoder2, xTest2);
testDec2 = predict(decoder2, testEnc2);

save('Net2');
