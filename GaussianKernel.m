function results = GaussianKernel(x1, x2, sigma)

% power = 1;

diff = x1-x2;

lengthsqd = diff'*diff;

results = exp(-1 * lengthsqd / 2 / sigma / sigma);