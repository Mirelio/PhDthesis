


ATc_accept <- c(0.25, 0.111111111111, 0.0555555555556, 0.0263157894737, 0.0166666666667, 0.00847457627119, 0.00325732899023, 0.00227790432802)
IPTG_accept <-c(0.333333333333, 0.166666666667, 0.0625, 0.0526315789474, 0.0263157894737, 0.0217391304348, 0.008, 0.00787401574803)
population_Atc <-c(1,2,3,4,5,6,7,8)
population_iptg <-c(1,2,3,4,5,6,7,8)






plot(population_Atc, ATc_accept, xlim=c(0,10), ylim=c(0,0.4),col='#006837', pch=20, xlab='Population', ylab='Acceptance rate')
lines(population_Atc, ATc_accept,col='#006837')
points(population_iptg, IPTG_accept, xlim=c(0,10), ylim=c(0,0.4), col='#a50026', pch=20)
lines(population_iptg, IPTG_accept, col='#a50026')
legend(7, 0.35, legend=c("ATc induction", "IPTG induction"),
       col=c('#006837', "#a50026"), lwd=2, cex=1.2,  box.lty=0)

#abline(h=10, lty=5)
#text(1,12,"Epsilon = 10")
