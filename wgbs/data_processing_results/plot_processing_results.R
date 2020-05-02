


pdat = read_tsv('~/gitreps/hybrid_methylation/wgbs/data_processing_results/pipeline_counts.tsv',
                col_names = c('run', 'value', 'stat'))
pdat

pdat %>% 
  summarize(mean(value)/1e6)

pdat %>% 
  filter(grepl('_R1_', run),
         stat=='rawCounts') %>% 
  summarize(tot=sum(value)/1e9)
  

pdat %>% 
  ggplot(aes(x = value, fill=stat)) +
  geom_density(alpha=0.5) +
  geom_vline(xintercept = mean(pdat$value), lty=2)



ldat = read_tsv('~/gitreps/hybrid_methylation/wgbs/data_processing_results/lambda.cov',
                col_names = c('scaffold', 'pos1', 'pos2', 'pctM', 'nM', 'nU'))

ldat %>% 
  summarize(100-mean(pctM, na.rm=TRUE),
            1-(mean(nM/(nM+nU))))
