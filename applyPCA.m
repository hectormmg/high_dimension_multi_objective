function reducedPop = applyPCA(popObj)
    [coeff, score, latent, ~, explained] = pca(popObj);
    relevantComps = findRelevantComps(explained);
    reducedPop = score(:, 1:relevantComps);
end

function relevantComps = findRelevantComps(varianceProportions)
    varianceCovered = 0.0;
    index = 0;
    while varianceCovered < 85.0
        index = index + 1;
        varianceCovered = varianceCovered + varianceProportions(index);
    end
    relevantComps = index;
end