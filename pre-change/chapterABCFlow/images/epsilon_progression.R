
ATc_epsilon <- c(68.47745251, 57.8679862609, 49.2835265802, 41.7978223904, 35.3180173666, 30.4227706464, 26.3459953444, 23.8256874601, 21.6831500945, 19.9485472759)
IPTG_epsilon <-c(64.60678611, 59.0427268608, 54.0599584625, 50.4772129194, 47.5687027846, 45.0386758047,  42.9565751568,  41.2733335703,  39.1936278926)
population_Atc <-c(1,2,3,4,5,6,7,8,9,10)
population_iptg <-c(1,2,3,4,5,6,7,8,9)

plot(population_Atc, ATc_epsilon, xlim=c(0,10), ylim=c(0,80), col='#006837', pch=20, xlab='Population', ylab='Epsilon')
lines(population_Atc, ATc_epsilon, col='#006837')
points(population_iptg, IPTG_epsilon, xlim=c(0,10), ylim=c(0,80), col='#a50026', pch=20)
lines(population_iptg, IPTG_epsilon, col='#a50026')
legend(7, 80, legend=c("ATc induction", "IPTG induction"),
       col=c('#006837', "#a50026"), lwd=2, cex=1.2,  box.lty=0)
#abline(h=10, lty=5)
#text(1,12,"Epsilon = 10")

