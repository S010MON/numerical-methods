% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
function [data] = outpatientreport()

    % Load data
    data = load('myhospital.mat');
    
    % Print out 10 random details
    for i = 1:10
    
        % Generate a random integer
        r = randi(length(data.LastName));
        
        % Index all variables for the random 'r'
        name = string(data.LastName(r));
        sex = string(data.Sex(r));
        age = data.Age(r);
        weight = data.Weight(r);
        smoker = data.isSmoker(r);
        
        % Print out to terminal
        formatspec = '%s %s %i %i %i\n'; 
        fprintf(formatspec, name, sex, age, weight, smoker);
    end %for
        
    % Plot weight against smoking 
    figure
    boxplot(data.Weight, data.isSmoker);
    title('Smoking and Non smoking effect on weight');
    ylabel('Weight (kg)');
    xlabel('Is smoker?');
end %function
