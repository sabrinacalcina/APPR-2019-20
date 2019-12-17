source("lib/libraries.r")


#1 tabela-brezposelnost po statističnih regijah
brezposelnost.regije <- read.csv2(file="podatki/brezposelnost_po_statisticnih_regijah.csv", header=TRUE, skip = 3, 
                                  col.names = c('leto', 'statistična_regija', 'stopnja_aktivnosti', "stopnja_delovne_aktivnosti", 'Stopnja_brezposelnosti', 'delovna_aktivnost_glede_na_starostno_skupino'))


#2. tabela-brezposelnost glede na stopnjo dosežene izobrazbe
brezposelnost.izobrazba <- read.csv2(file="podatki/brezposelnost_po_stopnji_izobrazbe.csv", header=TRUE, skip = 2, 
                                     col.names = c("leto", "Kohezijska_regija", "Spol", "Skupna_brezposelnost", "Skupna_brezposelnost_procenti", "brez_izobrazbe", "brez_izobrazbe_procenti", "osnovnosolska_izobrazba", "osnovnosolska_izobrazba_procenti", "nizja_ali_srednja", "nizja_ali_srednja_procenti", "srednja_strokovna", "srednja_strokovna_procenti", "cisjesolska_visokosolska", "visokosolska_procenti"))
brezposelnost.izobrazba <- brezposelnost.izobrazba%>%select(-Skupna_brezposelnost)
brezposelnost.izobrazba <- brezposelnost.izobrazba%>%select(-Skupna_brezposelnost_procenti)
brezposelnost.izobrazba <- brezposelnost.izobrazba%>%select(-brez_izobrazbe_procenti)
brezposelnost.izobrazba <- brezposelnost.izobrazba%>%select(-osnovnosolska_izobrazba_procenti)
brezposelnost.izobrazba <- brezposelnost.izobrazba%>%select(-nizja_ali_srednja_procenti)
brezposelnost.izobrazba <- brezposelnost.izobrazba%>%select(-srednja_strokovna_procenti)
brezposelnost.izobrazba <- brezposelnost.izobrazba%>%select(-visokosolska_procenti)




#3.tabela-brazoselnost in kriminaliteta
brezposelnost.kriminaliteta <- read.csv2(file="podatki/kriminaliteta_dva.csv", header=TRUE, skip = 2, 
                                         col.names = c("aktivnost", "leto", "vsa_kazniva_dejanja", "brez_solske_zobrazbe", "odnovnosolska_izobrazba", "poklicna_ali_srednja_izobrazba", "visjesolska_izobrazba", "visokosolska_izobrazba_prve_stopnje","visokosolska_izobrazba_druge_stopnje", "magisterij"))
brezposelnost.kriminaliteta <- brezposelnost.kriminaliteta%>%select(-vsa_kazniva_dejanja)


#4.tabela-brezposelnost po trajanju iskanja dela
brezposelnost.iskanje <- read.csv2(file="podatki/brezposelnost_po_trajanju_iskanja_dela.csv", header=TRUE, skip = 2, na=c('N'),  
                                   col.names = c("kohezijska_regija", "spol", "leto", "vsi_brezposelni", "manj_kot_en_mesec", "od_1_do_5_mesecev", "od_6_do_11_mesecev", "od_12_do_23_mesecev", "vec_kot_24_mesecev"),)
brezposelnost.iskanje <- brezposelnost.iskanje%>%select(-vsi_brezposelni)
brezposelnost.iskanje %>% as_tibble() %>% mutate(manj_kot_en_mesec_ = manj_kot_en_mesec*1000)



#5.tabela-stevilo vkljucenih v izobrazevanje na 1000
izobrazevanje <- read.csv2(file="podatki/stevilo_vkljucenih_v_izobrazevanje_na_1000.csv", header=TRUE, skip = 2,  
                           col.names = c("solsko_leto", "regija", "ucenci", "dijaki", "odrasli_v_osnovni", "odrasli_v_srednji", "studenti"))


#6.tabela-html-delavno sposobni glede na staost
#link <- "podatki/delovno_sposobni_glede_na_aktivnost_po_starosti.htm"
#tabela <- read_html(link) %>% html_node(xpath="//table") %>% html_table(fill=TRUE)
