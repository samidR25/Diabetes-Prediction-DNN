[dataset, classes] = load_dataset('diabetes.csv');

[training_data, validation_data, test_data, ...
    number_of_features, number_of_classes] = ...
    data_processing(dataset, classes);

[layers, options] = network_design(50, ...
    number_of_classes, validation_data, number_of_features,...
    16);

trained_net = trainNetwork(training_data, classes, layers, options);

predicted = classify(trained_net, test_data(:, 1:end-1), 'MiniBatchSize',16);

test_data = test_data{:, classes};
accuracy = sum(predicted==test_data)/numel(test_data)

figure
confusionchart(test_data, predicted)