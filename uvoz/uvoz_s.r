source("lib/libraries.r")


#1 tabela-brezposelnost po statističnih regijah
brezposelnost.regije <- read.csv2(file="podatki/brezposelnost_po_statisticnih_regijah.csv", header=TRUE, skip = 2, col.names = c('leto', 'statistična_regija', 'stopnja_aktivnosti', "stopnja_delovne_aktivnosti", 'Stopnja_brezposelnosti', 'delovna_aktivnost_glede_na_starostno_skupino'))
#brezpo.slovenija <- brezposelnost.regije%>%filter(a=='SLOVENIJA')


#2. tabela-brezposelnost glede na stopnjo dosežene izobrazbe
brezposelnost.izobrazba <- read.csv2(file="podatki/brezposelnost_po_stopnji_izobrazbe.csv", header=TRUE, skip = 2, col.names = c("leto", "Kohezijska_regija", "Spol", "Skupna_brezposelnost", "Skupna_brezposelnost_%", "brez_izobrazbe", "brez_izobrazbe_%", "osnovnosolska_izobrazba", "osnovnosolska_izobrazba_%", "nizja_ali_srednja", "nizja_ali_srednja_%", "srednja_strokovna", "srednja_strokovna_%", "visokosolska", "visokosolska_%"))


#3.tabela-brezposelnost po starosti
brezposelnost.starost <- read.csv2(file="podatki/tabela_po_starosti_dva.csv", header=TRUE, skip = 2, col.names = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"), na=('N'))


#4.tabela-brazoselnost in kriminaliteta
brezposelnost.kriminaliteta <- read.csv2(file="documents/GitHub/APPR-2019-20/podatki/brezposelnost_kriminaliteta.csv", header=TRUE, skip = 2, col.names = c("a", "b", "c", "d", "e", "f", "g", "h"))





