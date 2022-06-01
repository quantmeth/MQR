# example R options set globally
options(width = 60, digits = 3)

# example chunk options set globally
knitr::opts_chunk$set(
  comment = ">",
  collapse = TRUE
  )

#tous
library(tidyverse)
library(kableExtra)
library(papaja)
#library(ggpubr)

# 
#library(lavaan)

# Multiniveau
# library(lme4)     # pour lmer
# library(arm)      # pour les S.E.
# library(lmerTest) # pour les valeur-p
# library(performance)  # pour ICC