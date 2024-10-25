function [probs] = utl_inverse_gaussian_defective_categorical(x,drift_pdf,drift_cdf,threshold1,threshold2)
if isrow(x)
    x=x';
end
pdf = (threshold1) ./ sqrt(2*pi*(x.^3)) .* exp(-0.5 * ((drift_pdf.*(x) - threshold1).^2) ./ (x));

cdf = normcdf(((drift_cdf.*(x)) - threshold2) ./ sqrt(x)) + ...
    exp(2.*drift_cdf.*threshold2) .* normcdf((-(drift_cdf.*(x)) - threshold2) ./ sqrt(x));
survival = 1-cdf;
survival=prod(survival,2);
probs = pdf.*survival;

