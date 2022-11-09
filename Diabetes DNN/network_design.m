function [layers, options] = network_design(hidden_layer, ...
    number_of_classes, validation_data, number_of_features,...
    mini_batch_size)

    layers = [
        featureInputLayer(number_of_features, 'Normalization','zscore') % to get values between 0-1
        fullyConnectedLayer(hidden_layer) % create hidden layers
        batchNormalizationLayer
        reluLayer
        fullyConnectedLayer(number_of_classes)
        softmaxLayer
        classificationLayer % Cross-Entropy Loss-> the lower the loss function,the more accurate the model
    ];
    
    options = trainingOptions("adam", ... % training options (how we want to train the model)
        'MiniBatchSize', mini_batch_size, ...
        'Shuffle', 'every-epoch', ...
        'ValidationData',validation_data, ...
        'Plots','training-progress', ...
        'Verbose',false);


end