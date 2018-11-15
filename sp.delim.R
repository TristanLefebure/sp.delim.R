require(cluster)


# A function that eats a distance matrix,
# make clusters following a threshold, and then export the 
# the clusters composition in a list
threshold.delim <- function(dist, threshold) {
	bindist <- dist
	#transform to binary and distance
	bindist[which(bindist <= threshold)] <- 0
	bindist[which(bindist > threshold)] <- 1
	bindist <- as.dist(bindist)
	#make a cluster and cut the branches longer than 0
	sp.tr <- cutree(as.hclust(diana(bindist)), h=0)
	sp.tr.l <- list()
	for (k in unique(sp.tr)) {
				sp.tr.l[[k]] <- names(which(sp.tr == k))
			}
	return(sp.tr.l)
}

#count the number of OTUs given a threshold
nbrSP <- function(dist, threshold) {
	bindist <- dist
	#transform to binary and distance obthresholdect
	bindist[which(bindist <= threshold)] <- 0
	bindist[which(bindist > threshold)] <- 1
	bindist <- as.dist(bindist)
	#make a cluster and cut the branches longer than 0
	sp.tr <- cutree(as.hclust(diana(bindist)), h=0)
	sp.tr.l <- list()
	for (k in unique(sp.tr)) {
				sp.tr.l[[k]] <- names(which(sp.tr == k))
			}
	nbrSp <- length(sp.tr.l)
	return(nbrSp)
}

#transform the list outputed by threshold.delim into a table
sp.list2table  <- function(splist) {
	seq <- MOTU <- NULL
	for(i in 1:length(splist)) {
		taxa <- splist[[i]]
		for(j in taxa) {
			seq <- c(seq, j)
			MOTU <- c(MOTU, i)
		}
	}
	return(data.frame(seq=seq, motu=MOTU))
}
 
