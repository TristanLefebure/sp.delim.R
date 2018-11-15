# sp.delim.R
R function to delimit species starting from patristic distances

## Exemple:

```{r}
require(ape) 
source('sp.delim.R')
require(knitr)

#generate a random tree
tr <- rtree(100, max=0.2)
#get patristic distance
pat.dist <- cophenetic(tr)
#delimit species using a 0.16 threshold
otu.l <- threshold.delim(pat.dist, 0.16)
otu.tab <- sp.list2table(otu.l)

kable(head(otu.tab))
```






