
<!-- README.md is generated from README.Rmd. Please edit that file -->
powsim\_RData
=============

This repository contains count matrices of published RNA-seq experiments (xx\_cnts.rda) and estimated negative binomial parameters as exemplaric input to powsim (xx\_estparam.rda). For the Kolodziejczk data set we also included simulation results.

RNA-seq experiments
===================

The following published data sets are available:

Islam et al. 2011 [GSE29087](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE29087)
-----------------------------------------------------------------------------------------

The 48 mouse embryonic stem cells were prepared with the STRT-seq protocol.

Islam et al. 2014 [GSE46980](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE46980)
-----------------------------------------------------------------------------------------

The 96 mouse embryonic stem cells were prepared with the improved STRT-seq protocol, i.e. including unique molecular identifiers (UMI).

Buettner et al. 2014 [E-MTAB-2805](http://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-2805/)
----------------------------------------------------------------------------------------------

288 mouse embryonic stem cells were stained with Hoechst and sorted by FACS into three different cell cycle stages (G1, G2M, S1). Single cell RNA-Seq was performed using Fluidigm C1 system and libraries were generated using Nextera XT (Illumina) kit.

Kolodziejczk et al. 2015 [E-MTAB-2600](https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-2600/)
---------------------------------------------------------------------------------------------------

869 mouse embryonic stem cells under three different conditions: serum + LIF (242 cells), 2i + LIF (433 cells) and alternative 2i + LIF (194 cells). Single cell RNA-Seq was performed using Fluidigm C1 system and libraries were generated using Nextera XT (Illumina) kit. We reduced the data set to standard serum + LIF cultured cells for parameter estimation.

Soumillon et al. 2014 [GSE53638](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE53638)
---------------------------------------------------------------------------------------------

Directed adipogenic differentiation of human cells in vitro over time. We have included the transcriptomic profiling of approx. 12000 cells collected over the differentiation of human adipose-derived stem/stromal cells. Library protocol is Single Cell RNA Barcoding and Sequencing (SCRB-Seq) with unique molecular identifiers (UMI).
