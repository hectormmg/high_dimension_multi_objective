function reducedPop = dimReduce(popObj, technique)
    switch technique
        case 'pca'
            reducedPop = applyPCA(popObj);
        case 'isomap'
            reducedPop = applyIsomap(popObj);
        case 'lle'
            reducedPop = lle(popObj, 4);
    end
end