source("lib/libraries.r")


#1 tabela-brezposelnost po statističnih regijah (ok)
brezposelnost.regije <- read.csv2(file="podatki/brezposelnost_po_statisticnih_regijah.csv", header=TRUE, fileEncoding="Windows-1250", skip = 3, dec = '.',
                                  col.names = c('leto', 'regija', 'stopnja_aktivnosti', "stopnja_delovne_aktivnosti", 'stopnja_brezposelnosti', 'delovna_aktivnost_glede_na_starostno_skupino'))

graf_regije <- brezposelnost.regije[,-6]
graf_regije <- graf_regije[,-4]
graf_regije <- graf_regije[,-3]
  #graf_regije <- transform(graf_regije, stopnja_brezposelnosti=(stopnja_brezposelnosti*1000))

  #tabela za zemljevid 2010
brezposelnost.2010 <-filter(graf_regije, leto == '2010')


  #tabela za zemljevid 2018
brezposelnost.2018 <- filter(graf_regije, leto == '2018')



#2.tabela-brezposelnost po trajanju iskanja dela za celotno Slovenijo(ok za zemljevid)
trajanje <- read.csv2(file="podatki/trajanje.csv", header=TRUE, skip = 2, na=c('N'), fileEncoding="Windows-1250", 
                                   col.names = c("nekaj","čas", "spol", "leto",  "skip", "brezposelnost"))

trajanje <- trajanje[,-5]
trajanje <- trajanje[,-3]
trajanje <- trajanje[,-1]


#3.tabela-brezposelnost v Sloveniji
slovenija <- read.csv2(file="podatki/slovenija.csv", header=TRUE, skip = 1, fileEncoding="Windows-1250", 
                       col.names = c("kohezj", "skupine", "spol", "leto", "brezposelnost"))

slovenija <- slovenija[,-3]
slovenija <- slovenija[,-2]
slovenija <- slovenija[,-1]
#slovenija <- transform(slovenija, brezposelnost = (brezposelnost * 1000))




#4.tabela-brezposelnost glede na stopnjo dosežene izobrazbe
izobrazba <- read.csv2(file="podatki/izobrazba.csv", header=TRUE, skip = 2, fileEncoding="Windows-1250",
                                     col.names = c("leto", "Kohezijska_regija", "Spol", "izobrazbe", 
                                                   "meritve", "brezposelnost"))
izobrazba <- izobrazba[, -5]
izobrazba <- izobrazba[, -3]
izobrazba <- izobrazba[, -2]

#izobrazba <- transform(izobrazba, brezposelnost = (brezposelnost*1000))


#5.tabela-kriminaliteta v Sloveniji glede na statistične regije
kriminaliteta <- read.csv2(file="podatki/kriminaliteta.csv", header=TRUE, skip = 2, 
                       col.names = c("regija", "nekaj", "leto", "obsojeni"), dec = '.', fileEncoding="Windows-1250")        
kriminaliteta <- kriminaliteta[,-2]



#tabela za Shiny
povprecje <- left_join(kriminaliteta, graf_regije, by=c('regija','leto'))
colnames(povprecje) <- c('regija', 'leto', 'obsojeni',  'stopnja_brezposelnost')

povprecje$stopnja_brezposelnost <- as.numeric(povprecje$stopnja_brezposelnost)


#6.tabela- Delovno sposobni glede na aktivnost in mere aktivnosti po starostnih skupinah in spolu za celotno Slovenijo
aktivnost <- read.csv2(file="podatki/aktivnosti.csv", header=TRUE, skip = 2, 
                           col.names = c("regija", "starostna_skupina","spol", "leto", "meritve", "delovno_sposobni"), dec = '.', fileEncoding="Windows-1250") 


aktivnost<-aktivnost[,-1]
aktivnost$delovno_sposobni <- as.numeric(aktivnost$delovno_sposobni)
aktivnost$leto <- as.numeric(aktivnost$leto)

