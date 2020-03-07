source("lib/libraries.r")


#1 tabela-brezposelnost po statističnih regijah
brezposelnost.regije <- read.csv2(file="podatki/brezposelnost_po_statisticnih_regijah.csv", header=TRUE, skip = 3, fileEncoding="Windows-1250", dec = '.',
                                  col.names = c('leto', 'regija', 'stopnja_aktivnosti', "stopnja_delovne_aktivnosti", 'stopnja_brezposelnosti', 'delovna_aktivnost_glede_na_starostno_skupino'))

graf_regije <- brezposelnost.regije[,-6]
graf_regije <- graf_regije[,-4]
graf_regije <- graf_regije[,-3]

  #tabela za zemljevid 2010
brezposelnost.2010 <-filter(graf_regije, leto == '2010')


  #tabela za zemljevid 2018
brezposelnost.2018 <- filter(graf_regije, leto == '2018')



#2.tabela-brezposelnost po trajanju iskanja dela za celotno Slovenijo
trajanje <- read.csv2(file="podatki/trajanje.csv", header=TRUE, skip = 2, na=c('N'), fileEncoding="Windows-1250", 
                                   col.names = c("nekaj","cas", "spol", "leto",  "skip", "brezposelnost"))

trajanje <- trajanje[,-5]
trajanje <- trajanje[,-3]
trajanje <- trajanje[,-1]


#3.tabela-brezposelnost v Sloveniji(ja)
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


#5.tabela- Delovno sposobni glede na aktivnost in mere aktivnosti po starostnih skupinah in spolu za celotno Slovenijo
aktivnost <- read.csv2(file="podatki/aktivnosti.csv", header=TRUE, skip = 2, 
                           col.names = c("regija", "starostna_skupina","spol", "leto", "meritve", "delovno_sposobni"), dec = '.', fileEncoding="Windows-1250") 


aktivnost<-aktivnost[,-1]
aktivnost$delovno_sposobni <- as.numeric(aktivnost$delovno_sposobni)
aktivnost$leto <- as.numeric(aktivnost$leto)

