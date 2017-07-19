# We test our H0 that the version has no influence on the OSTRICH query evaluation efficiency.
# Lineair model with as reponse the lookup time and as factors the version and the number of results,
# we expect version not to have an influence

# confidence level 99%
# H0: impact of version is 0
# If p is low, reject H0 with 1-alpha confidence

beara_dm <- read.csv('../beara/query/ostrich/_average_dm.csv')
beara_dm <- beara_dm[which(beara_dm$offset==0 & beara_dm$patch_start==0),]
#summary(lm(lookup.mus.inf ~ patch_end + resultsinf, data=beara_dm))
# v-p: 0.301 => == 0
# r-p: 0.320 => == 0
# ACCEPT H0
#cor.test(beara_dm$patch, beara_dm$lookup.mus.inf)
# cor: 0.1380577
# p:   0.7232
# H0: ACCEPT

beara_vm <- read.csv('../beara/query/ostrich/_average_vm.csv')
beara_vm <- beara_vm[which(beara_vm$offset==0),]
#summary(lm(lookup.mus.inf ~ patch + resultsinf, data=beara_vm))
# v-p: 0.960 => == 0
# r-p: 0.570 => == 0
# ACCEPT H0
#cor.test(beara_vm$patch, beara_vm$lookup.mus.inf)
# cor: -0.2770768
# p:   0.4383
# H0: ACCEPT

bearbd_dm <- read.csv('../bearb-daily/query/ostrich/_average_dm.csv')
bearbd_dm <- bearbd_dm[which(bearbd_dm$patch_start==0 & bearbd_dm$offset==0),]
#summary(lm(lookup.mus ~ patch_end + results, data=bearbd_dm))
# v-p: 0.0391 => == 0
# r-p: 2.13e-09 => != 0
# ACCEPT H0
#cor.test(bearbd_dm$patch_end, bearbd_dm$lookup.mus)
# cor: 0.4509677
# p:   1.037e-05
# H0: REJECT

bearbd_vm <- read.csv('../bearb-daily/query/ostrich/_average_vm.csv')
bearbd_vm <- bearbd_vm[which(bearbd_vm$offset==0),]
#summary(lm(lookup.mus ~ patch + results, data=bearbd_vm))
# v-p: 0.694 => == 0
# r-p: 0.697 => == 0
# ACCEPT H0
#cor.test(bearbd_vm$patch, bearbd_vm$lookup.mus)
# cor: 0.007640334
# p:   0.9433
# H0: ACCEPT

bearbh_dm <- read.csv('../bearb-hourly/query/ostrich/_average_dm.csv')
bearbh_dm <- bearbh_dm[which(bearbh_dm$patch_start==0 & bearbh_dm$offset==0),]
#summary(lm(lookup.mus.inf ~ patch_end + resultsinf, data=bearbh_dm))
# v-p: 0.259 => == 0
# r-p: 2e-16 => != 0
# ACCEPT H0
#cor.test(bearbh_dm$patch_end, bearbh_dm$lookup.mus.inf)
# cor: 0.1499068
# p:   1.658e-14
# H0: REJECT

bearbh_vm <- read.csv('../bearb-hourly/query/ostrich/_average_vm.csv')
bearbh_vm <- bearbh_vm[which(bearbh_vm$offset==0),]
#summary(lm(lookup.mus.inf ~ patch + resultsinf, data=bearbh_vm))
# v-p: 0.568319 => == 0
# r-p: 0.000574 => != 0
# ACCEPT H0
#cor.test(bearbh_vm$patch, bearbh_vm$lookup.mus.inf)
# cor: 0.2063941
# p:   5.924e-14
# H0: REJECT