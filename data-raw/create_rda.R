
# IMPORT COUNT TABLES -----------------------------------------------------

gorilla <- "/run/user/32104/gvfs/sftp:host=chimp/data/share"

count.tables <- readRDS(file = paste0(gorilla,'/htp/powsim/inputdat/count_tables.rds'))
cellannot.tables <- readRDS(file = paste0(gorilla,'/htp/powsim/inputdat/cellannot_tables.rds'))
geneannot.tables <- readRDS(file = paste0(gorilla,'/htp/powsim/inputdat/geneannot_tables.rds'))

names(count.tables)

# SAVE COUNT TABLES AS RDA FILES ------------------------------------------

buettner_cnts <- count.tables[["buettner"]]
buettner_cnts <- buettner_cnts[rowSums(buettner_cnts)>0,]
save(buettner_cnts, file='buettner_cnts.rda', compress = 'bzip2', compression_level = 9)
islam2011_cnts <- count.tables[["islam_es2011"]]
islam2011_cnts <- islam2011_cnts[rowSums(islam2011_cnts)>0,]
save(islam2011_cnts, file='islam2011_cnts.rda', compress = 'bzip2', compression_level = 9)
islam2014_cnts <- count.tables[["islam_es2014"]]
islam2014_cnts <- islam2014_cnts[rowSums(islam2014_cnts)>0,]
save(islam2014_cnts, file='islam2014_cnts.rda', compress = 'bzip2', compression_level = 9)
kolodziejczk_cnts <- count.tables[["kolodziejcz_2015"]]
kolodziejczk_cnts <- kolodziejczk_cnts[rowSums(kolodziejczk_cnts)>0,]
tmp <- cellannot.tables[['kolodziejcz_2015']]
colnames(kolodziejczk_cnts) <- tmp$condition
save(kolodziejczk_cnts, file='kolodziejczk_cnts.rda', compress = 'bzip2', compression_level = 9)
soumillon_cnts <- count.tables[["soumillon_2014"]]
tmp <- cellannot.tables[['soumillon_2014']]
colnames(soumillon_cnts) <- tmp$condition
soumillon_cnts <- soumillon_cnts[,!grepl('Bulk', colnames(soumillon_cnts))]
table(colnames(soumillon_cnts))
save(soumillon_cnts, file='soumillon_cnts.rda', compress = 'bzip2', compression_level = 9)


# IMPORT ESTIMATED PARAMETERS ---------------------------------------------

estparams.files <- list.files(paste0(gorilla, "/htp/powsim/estparam_out/"),pattern=".estparam.rds$", full=TRUE)
names(estparams.files) <- substring(list.files(paste0(gorilla, "/htp/powsim/estparam_out/"),pattern=".estparam.rds$", full=FALSE), first = 1, last = nchar(list.files(paste0(gorilla, "/htp/powsim/estparam_out/"),pattern=".estparam.rds$", full=FALSE))-4)
dat2keep <- c("buettner.estparam", "islam_es2011.estparam", "standard_2i_media_+_LIF.estparam", 'soumillon_2014.estparam', "islam_es2014.estparam")
estparam.files <- estparams.files[dat2keep]

estParam.res <- lapply(estparams.files, function(x) { readRDS(x)})

# SAVE ESTIMATED PARAMETERS AS RDA FILES ----------------------------------

buettner_param <- estParam.res[["buettner.estparam"]]
devtools::use_data(buettner)
islam2011_param <- estParam.res[["islam_es2011.estparam"]]
devtools::use_data(islam2011)
islam2014_param <- estParam.res[["islam_es2014.estparam"]]
devtools::use_data(islam2014)
kolodziejczk_param <- estParam.res[["kolodziejcz_2015.estparam"]]
devtools::use_data(kolodziejczk)
soumillon_param <- estimateNBParam(countData = soumillon_cnts, RNAseq = 'singlecell', sigma = 1.96, estFramework = 'MatchMoments')

# EXAMPLE POWSIM OUTPUT ---------------------------------------------------

kolodziejczk_simDE <- readRDS(file = paste0(gorilla,'/htp/powsim/sim_out/observed/standard_2i_media_+_LIF.estparam_20000_0.2_lfc.gamma.narrow_given_MAST.simres.rds'))
save(kolodziejczk_simDE, file='data-raw/kolodziejczk_simDE.rda', compress = 'bzip2', compression_level = 9)
