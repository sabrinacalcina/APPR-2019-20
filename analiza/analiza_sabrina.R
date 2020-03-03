source("lib/libraries.r", encoding="UTF-8")

#Regresijska premica za stevilo smrti brezposelnosti v Sloveniji


prileganje <- lm(data = slovenija, brezposelnost ~ leto)

l <- data.frame(leto=seq(2017, 2021, 1))
napoved <- mutate(l, brezposelnost=predict(prileganje, l))


graf_regresija <- ggplot(slovenija, aes(x=leto, y=brezposelnost)) + geom_point() + 
  geom_smooth(method='lm', formula=y ~ poly(x,2,raw=TRUE), fullrange=TRUE, color='green') +
  scale_x_continuous('Leto', breaks = seq(2008, 2020, 1), limits = c(2008,2020))
