# BANDLE for the Bayesian Analysis of Differential Localisation Experiments

R-package for analysis differential localisation experiments, include storage, computation, statistics and visulisations 

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![license](https://img.shields.io/badge/license-Artistic--2.0-brightgreen.svg)](https://opensource.org/licenses/Artistic-2.0)


# Basic ideas and concepts

- start with replicated MS spatial proteomics data in `MSnSets` and perform a workflow

We recommend reading our other workflow manuscripts:

Basic processing and machine learning:

https://f1000research.com/articles/5-2926

Bayesian analysis:

https://f1000research.com/articles/8-446

The BANDLE manusript is currently on biorxiv:

https://www.biorxiv.org/content/10.1101/2021.01.04.425239v3


For manuscripts that apply bandle, see:

https://www.biorxiv.org/content/10.1101/2022.01.24.477541v1
https://linkinghub.elsevier.com/retrieve/pii/S1535-9476(22)00002-0


# Installation requirements

Users will require a working version of R, currently at least version >4. It is recommend to use RStudio. The package can then be installed using the `devtools` package. The package should take a few minutes to install on a regular desktop or laptop. The package will need to be loaded using `library(bandle)`

```{r,}
devtools::install_github("ococrook/bandle")
```

# Examples

A simple demo is given in the vigenettes folder with clear demonstrations of the input and output. A small dataset can take around an hour to run; for large dataset we recommend a a compute server. The longest the analysis has taken has been a couple of hours on a single compute node. The demo take a few minutes to run.

The vignettes include an example of the analysis of the THP-1 monocyte system, as well as simulated examples.


# Documentation

Documentation to run the main functions can be found in the vignette or by typing ?bandle in the consol after loading the package.

# Contribution

Contributions are welcome, please open issue so we can discuss any contribution in advance.

# Feature requests

This package is actively being developed and maintained, please open an issue if you would like a particular feature.

