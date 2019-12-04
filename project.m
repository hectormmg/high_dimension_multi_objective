% Héctor Miguel Morales González
% Dimension Reduction for Many Objective Optimization Problems

% Configure PlatEMO Global
configargs = ['-problem', { @MaF1 }, '-M', 10, '-D', 20, '-N', 500];
Global = GLOBAL(configargs{:});

%  Initialize Random Population
pop = Global.Initialization();
obj = MaF1();

% Extract objectives matrix
popObj = CalObj(obj, pop.decs);

% Generate random weights matrix
weights = unifrnd(zeros(500, 10), ones(500, 10));
weights = bsxfun(@rdivide, weights, sum(weights, 2));

% Find non-dominated solutions in original population
% with Tchebychev's Distance Metric
tchIndices = tchebychevMetric(weights, popObj);


% Apply dimension reduction to original objectives matrix
reducedPop = dimReduce(popObj, 'isomap');

indices = getNonDominated(reducedPop);

shared = intersect(tchIndices, indices);

[originalNonDominated, ~] = size(tchIndices);
[reducedNonDominated, ~] = size(shared);

percentageKept = reducedNonDominated/originalNonDominated * 100;


