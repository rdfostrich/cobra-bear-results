# H0: HDT-IC == OSTRICH
# Compare means with one-way ANOVA

ostrich <- read.csv('../beara/query/ostrich/_median_vm.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../beara/query/hdt-ic/_median_vm.csv')
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 1.387e-05
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.5622
#mean(hdt$ms) # 0.03779415
# HDT-IC < OSTRICH

ostrich <- read.csv('../beara/query/ostrich/_median_dm.csv')
ostrich <- ostrich[which(ostrich$patch_start==0,ostrich$offset==0),]
hdt <- read.csv('../beara/query/hdt-ic/_median_dm.csv')
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.5306667
#mean(hdt$ms) # 0.1093232
# HDT-IC < OSTRICH

ostrich <- read.csv('../beara/query/ostrich/_median_vq.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../beara/query/hdt-ic/_median_vq.csv')
# => Reject H0
#mean(ostrich$lookup.mus.inf) # 0.896
#mean(hdt$ms) # 0.365846
# HDT-IC < OSTRICH

ostrich <- read.csv('../bearb-daily/query/ostrich/_median_vm.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-daily/query/hdt-ic/_median_vm.csv')
#t.test(ostrich$lookup.mus, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus) # 0.1846292
#mean(hdt$ms) # 0.1033203
# HDT-IC < OSTRICH

ostrich <- read.csv('../bearb-daily/query/ostrich/_median_dm.csv')
ostrich <- ostrich[which(ostrich$patch_start==0,ostrich$offset==0),]
hdt <- read.csv('../bearb-daily/query/hdt-ic/_median_dm.csv')
#t.test(ostrich$lookup.mus, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus) # 0.2104713
#mean(hdt$ms) # 0.4033166
# HDT-IC > OSTRICH !

ostrich <- read.csv('../bearb-daily/query/ostrich/_median_vq.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-daily/query/hdt-ic/_median_vq.csv')
# => Reject H0
#mean(ostrich$lookup.mus) # 0.294
#mean(hdt$ms) # 7.52071
# HDT-IC > OSTRICH !

ostrich <- read.csv('../bearb-hourly/query/ostrich/_median_vm.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-hourly/query/hdt-ic/_median_vm.csv')
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.3094276
#mean(hdt$ms) # 0.08732993
# HDT-IC < OSTRICH

ostrich <- read.csv('../bearb-hourly/query/ostrich/_median_dm.csv')
ostrich <- ostrich[which(ostrich$patch_start==0,ostrich$offset==0),]
hdt <- read.csv('../bearb-hourly/query/hdt-ic/_median_dm.csv')
#t.test(ostrich$lookup.mus.inf, hdt$ms)
# p: 2.2e-16
# => Reject H0, unequal means
#mean(ostrich$lookup.mus.inf) # 0.3272151
#mean(hdt$ms) # 0.4127122
# HDT-IC > OSTRICH !

ostrich <- read.csv('../bearb-hourly/query/ostrich/_median_vq.csv')
ostrich <- ostrich[which(ostrich$offset==0),]
hdt <- read.csv('../bearb-hourly/query/hdt-ic/_median_vq.csv')
# => Reject H0
#mean(ostrich$lookup.mus.inf) # 0.814
#mean(hdt$ms) # 106.392
# HDT-IC > OSTRICH !