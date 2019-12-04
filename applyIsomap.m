% Héctor Miguel Morales González
% This function applies the Isomap technique to our original objective
% population and interprets the result to return the dimensionally-reduced
% objective population
function reducedPop = applyIsomap(popObj)
    options.display = 0;
    options.verbose = 0;
    [Y, R, E] = Isomap(pdist2(popObj,popObj), 'k', '5', options);
    idx = find(R < 0.01, 1);
    if isempty(idx)
        [~, idx] = min(R, [], 2);
    end
    reducedPop = (Y.coords{idx, 1})';
end