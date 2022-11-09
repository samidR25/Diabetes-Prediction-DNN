function [training_data, validation_data, test_data, ...
    number_of_features, number_of_classes] = ...
    data_processing(dataset, classes) % returns vals in arr

    class_name = categories(dataset{:, classes});
    number_of_data = size(dataset,1);
    t = floor(0.7*number_of_data); % separate the data into 3p
    v = floor(0.15*number_of_data);
    tst_d = t-v; 
    
    random = randperm(number_of_data);
    random_train = random(1:t);     % permutate the data 
    random_validation = random(t+1:t+v);
    random_test= random(t+v+1:end);
    
    training_data = dataset(random_train, :); 
    validation_data = dataset(random_validation, :); % to get only the rows
    test_data = dataset(random_test, :);
    
    number_of_features = size(dataset, 2)-1; %for features only
    number_of_classes = numel(class_name); % to get class (Yes/no)

end