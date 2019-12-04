% Héctor Miguel Morales González
% Tchebychev Distance Metric for finding non-dominated solutions

% D(x,y) tchebychev := max(wi|(xi - yi)|)

function indices = tchebychevMetric(weights, objectives)
    num_w = size(weights, 1);
    indices = zeros(num_w, 1);
    
    % Get minimum value for each objective/column (y vector)
    min_objectives = min(objectives, [], 1);

    % Matrix with absolute value of distance of each objective from the
    % minimum
    % |(xi - yi)|
    tchebycheffDifference = abs(bsxfun(@minus, objectives, min_objectives));
    
    % Try with different weights
    for i = 1:num_w
        % wi *  |(xi - yi)|
        weightedDifference = bsxfun(@times, weights(i, :), ...
            tchebycheffDifference);
        
        % Get maximum weighted distance
        max_values = max(weightedDifference, [] , 2);
        
        % Identify non-dominated solution for this set of weights
        [~, idx] = min(max_values);
        indices(i) = idx;
    end
    indices = unique(indices);
end