# biogeoTools: An R package with tools for biogeographic analysis 
`biogeoTools` is an R package developed using C++. The package aims to facilitate the process of building niche models and contains tools for biogeographic analysis.

# Installation text

<span style="color:red">**Windows users:**</span> Before installation it is important to have installed [Rtools](https://cran.r-project.org/bin/windows/Rtools/).

<span style="color:red">**Mac users:**</span> Install Xcode command line tools 

<span style="color:red">**Linux users:**</span> please, follow the installation guide.

## Complete installation guide

Complete installation guide for Windows, Linux, and MacOS users 


html code <--

```r
if (!require('devtools')) install.packages('devtools')
devtools::install_github('patauchi/biogeoTools')
# If you want to build vignette, install pandoc before and then
devtools::install_github('patauchi/biogeoTools',build_vignettes=TRUE)
```

# Help pages

Users can fin help for all `biogeoTools` functions at http::

# References

### Please cite the package as
Atauchi, P.J., Peterson, A. T. (2021). biogeoTools: Tools for Biogeographical Analyses. R package version 1.0.

### Environmental Heterogeneity
Atauchi, P.J., Peterson, A. T. (2022). The importance of environmental heterogeneity on species distribution.


The paper of the application is accesible from https://


### Points Spatial Correlation
Atauchi, P.J., Peterson, A. T. (2022). Bias on spatial points


The paper of the application is accesible from https://


### effect on bias samples on species distribution models
Atauchi, P.J., Peterson, A. T. (2022). 


The paper of the application is accesible from https://


# Acknowledgements

Biodiversity Institute, The University of Kansas for academic trainingl; MatBios 2021 PAIP N87387257 and I324927 for partial financial support.
