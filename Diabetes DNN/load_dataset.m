function [dataset, classes] = load_dataset(file_name)

    dataset = readtable(file_name, 'TextType','string');
    classes = 'Result';
    dataset = convertvars(dataset, classes, 'categorical');

    if ~isempty(dataset)
        disp('dataset loaded')
    end
end