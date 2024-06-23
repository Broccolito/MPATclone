This is a clone.

# MPAT: Multiple Phenotype Association Testing

## Overview

`MPAT` is an R package designed for conducting multiple phenotype genetic association studies based on summary statistics. It facilitates the analysis of associations between single-nucleotide polymorphisms (SNPs) and multiple phenotypes by combining univariate testing summary statistics.

## Installation

To install `MPAT`, you can use the following R command:

```
R
Copy code
# Install from CRAN or GitHub repository (assuming it's available)
install.packages("MPAT")
```

## Features

- **Fourteen Statistical Methods:** Includes methods such as Principal Component (PC), MinP, Fisher's method combinations, and variance component tests.
- **Support for GWAS Data:** Designed to work with genome-wide association study (GWAS) datasets.
- **Comprehensive Example Data:** Comes with example data `lipids`, illustrating usage with real genetic data on lipid levels.

## Usage

Below is an example demonstrating how to use `MPAT` to analyze genetic data:

```
R
Copy code
library(MPAT)

# Load example data
data(lipids)
lipids_zscore = as.matrix(lipids[,c("Zscore.HDL","Zscore.LDL","Zscore.TG","Zscore.TC")])
Sigma = cor(lipids_zscore)

# Perform a multi-phenotype association test
result = DSUM(Z.vec=lipids_zscore[1,], Sigma)

# Print the p-value
print(result$pvalue)
```

## Functions

- `PC()`: Combines correlated GWAS summary statistics.
- `MinP()`: Uses the minimum of the p-values for multiple phenotypes.
- `mixFisher()`: Combines Z-statistics using Fisher’s method.
- `mixAda()`: Adaptively selects optimal combination coefficients.
- Other functions include `mixTippett()`, `mixVarWeight()`, and `SUM()`.

## Documentation

For more detailed information on each function and its parameters, please refer to the `MPAT` package documentation included with the package.

## License

This project is licensed under the GPL-2.0 license - see the LICENSE file for details.

## Authors

- **Zhonghua Liu** - *Initial work* - [Zhonghua Liu](mailto:zliu@mail.harvard.edu)

## Acknowledgments

- This package builds on the concepts described in the paper "MPAT: An R Package for Multivariate Phenotype Association Studies".
- This is a clone package, and the original version of the package can be found at: https://www.hsph.harvard.edu/lin-lab/mpat/

