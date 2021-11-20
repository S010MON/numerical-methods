% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
function [output] = displaycarmodels()

    % Load the data and convert to cell for easy formatting
    data = load('cardata.mat');
    data_cell = struct2cell(data);
    
    % Prompt the user for the number of cylinders
    cylinders = data.Cylinders;
    avail_cylinders = unique(data.Cylinders);
    cylinders_string = string(avail_cylinders);
    [indx, tf] = listdlg('PromptString', {'Select no of cylinders'},'SelectionMode','Single','ListString',cylinders_string);
    
    % On user choice, run through all cylinders and select out those with
    % the choice of cylinders made
    choice = avail_cylinders(indx);
    model = data_cell{3};
    avail_models = {};
    for i = 1:length(cylinders)
        if (cylinders(i) == choice)
            avail_models{end+1} = model(i,1:36);
        end %if
    end%for
    
    % Prompt the user for the model type
    [indx, tf] = listdlg('PromptString', {'Select model'},'SelectionMode','Single','ListString',avail_models);
    
    % On user choice, run through all models and select the model that fits
    % the description provided
    choice = string(avail_models(indx));
    car_index = 0;
    for i = 1:length(model)
        if (model(i,1:36) == choice)
            car_index = i; 
        end %if
    end%for
    
    % Format the data into strings to print to the terminal out
    c_mod = string(data.Model(car_index, 1:36));
    c_hp = string(data.Horsepower(car_index));
    c_wgt = string(data.Weight(car_index));
    c_ogn =string(data.Origin(car_index, 1:7));
    formatSpec = 'Model: %s \nHorsepower: %s\nWeight: %s\nOrigin: %s\n';
    fprintf(formatSpec, c_mod, c_hp, c_wgt, c_ogn);
    
    % Provide variables selected as raw output
    output = [c_mod; c_hp; c_wgt; c_ogn];
end %function
