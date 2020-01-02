# H0: HDT-CB == OSTRICH
# Compare means with one-way ANOVA (analysis of variance)

ostrich <- read.csv('../beara/query/ostrich/_median_vm.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../beara/query/hdt-cb/_median_vm.csv')
#ks.test(ostrich$lookup.mus.inf, "pnorm", 1, 2) # p: 0.00293 -> normal distr
#ks.test(hdt$ms, "pnorm", 1, 2) # p: 0.02095 -> normal distr
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 1.68e-05
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.5622
#mean(hdt$ms) # 1.306266
# HDT-CB >= OSTRICH !

ostrich <- read.csv('../beara/query/ostrich/_median_dm.csv')
ostrich <- ostrich[which(ostrich$patch_start==0,ostrich$offset==0),]
hdt <- read.csv('../beara/query/hdt-cb/_median_dm.csv')
#ks.test(ostrich$lookup.mus.inf, "pnorm", 1, 2) # p: 7.167e-06 -> normal distr
#ks.test(hdt$ms, "pnorm", 1, 2) # p: 0.00148 -> normal distr
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.05334
#mean(hdt$ms) # 0.3802984
# HDT-CB >= OSTRICH !

ostrich <- read.csv('../beara/query/ostrich/_median_vq.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../beara/query/hdt-cb/_median_vq.csv')
# just one sample...
# => Reject H0
#mean(ostrich$lookup.mus.inf) # 0.896
#mean(hdt$ms) # 0.777231
# HDT-CB < OSTRICH

ostrich <- read.csv('../bearb-daily/query/ostrich/_median_vm.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-daily/query/hdt-cb/_median_vm.csv')
#ks.test(ostrich$lookup.mus, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#ks.test(hdt$ms, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#t.test(ostrich$lookup.mus, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus) # 0.1846292
#mean(hdt$ms) # 0.3473258
# HDT-CB < OSTRICH

ostrich <- read.csv('../bearb-daily/query/ostrich/_median_dm.csv')
ostrich <- ostrich[which(ostrich$patch_start==0,ostrich$offset==0),]
hdt <- read.csv('../bearb-daily/query/hdt-cb/_median_dm.csv')
#ks.test(ostrich$lookup.mus, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#ks.test(hdt$ms, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#t.test(ostrich$lookup.mus, hdt$ms)
# p: 0.02863
# => Accept H0, equal means
#mean(ostrich$lookup.mus) # 0.2104713
#mean(hdt$ms) # 0.1810234
# HDT-CB >= OSTRICH !

ostrich <- read.csv('../bearb-daily/query/ostrich/_median_vq.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-daily/query/hdt-cb/_median_vq.csv')
# just one sample...
# => Reject H0
#mean(ostrich$lookup.mus) # 0.294
#mean(hdt$ms) # 0.82898
# HDT-CB >= OSTRICH !

ostrich <- read.csv('../bearb-hourly/query/ostrich/_median_vm.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-hourly/query/hdt-cb/_median_vm.csv')
#ks.test(ostrich$lookup.mus.inf, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#ks.test(hdt$ms, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.3094276
#mean(hdt$ms) # 1.733312
# HDT-CB >= OSTRICH !

ostrich <- read.csv('../bearb-hourly/query/ostrich/_median_dm.csv')
ostrich <- ostrich[which(ostrich$patch_start==0,ostrich$offset==0),]
hdt <- read.csv('../bearb-hourly/query/hdt-cb/_median_dm.csv')
#ks.test(ostrich$lookup.mus.inf, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#ks.test(hdt$ms, "pnorm", 1, 2) # p: < 2.2e-16 -> normal distr
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.3272151
#mean(hdt$ms) # 1.661122
# HDT-CB >= OSTRICH !

ostrich <- read.csv('../bearb-hourly/query/ostrich/_median_vq.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-hourly/query/hdt-cb/_median_vq.csv')
# just one sample...
# => Reject H0
#mean(ostrich$lookup.mus.inf) # 0.814
#mean(hdt$ms) # 3.95088
# HDT-CB >= OSTRICH !