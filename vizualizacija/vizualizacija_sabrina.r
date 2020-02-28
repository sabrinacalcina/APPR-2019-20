library(ggplot2)
library(ggvis)
library(dplyr)
library(rgdal)
library(mosaic)
library(maptools)
library(ggmap)
library(mapproj)
library(munsell)

source(file = 'lib/uvozi.zemljevid.r', encoding = 'UTF-8')
source('lib/libraries.r', encoding = 'UTF-8')
source('uvoz/uvoz_s.r', encoding = 'UTF-8')


#Brezposelnost v Sloveniji na splošno
osnovni_graf <- ggplot(slovenija, aes(x=leto, y=brezposelnost, fill="5"), )+
  ggtitle('Brezposelnost glede na celotno Slovenijo v 1000')+
  geom_bar(stat = 'identity', position = 'dodge')



#Graf stopnje brezposelnosti skozi leta glede na staistične
vec_graf <- ggplot(data = graf_regije, mapping = aes(x=regija, y=stopnja_brezposelnosti, fill=factor(leto))) +
  labs(fill='leto') +
  ggtitle('Brezposelnost na 1000 prebivalcev po regijah') +
  geom_bar(stat = 'identity', position = 'dodge') +
  labs(x = 'Regija', y = 'Stopnja brezposelnosti') +
  theme(axis.text.x = element_text(angle = 90, size = 8))


#Zemljevid brezposelnosti po statističnih regijah glede na 1000 ljudi
  #za leto 2010

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1") %>% fortify()
colnames(Slovenija)[12]<-'regija'
Slovenija$regija <- gsub('GoriÅ¡ka', 'Goriška', Slovenija$regija)
Slovenija$regija <- gsub('KoroÅ¡ka', 'Koroška', Slovenija$regija)
Slovenija$regija <- gsub('Notranjsko-kraÅ¡ka', 'Primorsko-notranjska', Slovenija$regija)
Slovenija$regija <- gsub('Obalno-kraÅ¡ka', 'Obalno-kraška', Slovenija$regija)
Slovenija$regija <- gsub('Spodnjeposavska', 'Posavska', Slovenija$regija)



zemljevid.brezposelnost.2010 <- ggplot() +
  geom_polygon(data = right_join(brezposelnost.2010,Slovenija, by = c('regija')),
               aes(x = long, y = lat, group = group, fill = stopnja_brezposelnosti))+
  xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2010') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#FCDADA', high='#970303', limits=c(3,12))


  #za leto 2018

zemljevid.brezposelnost.2018 <- ggplot() +
  geom_polygon(data = right_join(brezposelnost.2018,Slovenija, by = c('regija')),
               aes(x = long, y = lat, group = group, fill = stopnja_brezposelnosti))+
  xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2018') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#FCDADA', high='#970303',limits=c(3,12))




#Grafki brezposelnosti v Sloveniji glede na stopnjo dosežene izobrazbe

graf_izobrazba <- ggplot(data = izobrazba, mapping = aes(x=leto, y=brezposelnost, col="4")) +
  ggtitle('Brezposelnost glede na stopnjo dosežene izobrazbe') +
  geom_point() +
  #facet_grid( Drzava~.) +
  facet_wrap(izobrazbe~., ncol=3) +
  theme(axis.text.x = element_text(angle = 90, size = 6))


#Brezposelnost glede na trajanje iskanja dela

graf_trajanje <- ggplot((data = trajanje), aes(x=leto, y=brezposelnost, col=cas)) + geom_point() + geom_line() +
  scale_x_continuous('Leto', breaks = seq(2008, 2018, 1), limits = c(2008,2018)) +
  ggtitle('Brezposelnost na 1000 prebivalcev glede na čas iskanja dela')





