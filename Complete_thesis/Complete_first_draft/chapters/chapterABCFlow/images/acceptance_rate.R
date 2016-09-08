


#ATc_accept <- c(0.25, 0.1, 0.0526315789474, 0.0263157894737, 0.0153846153846, 0.0140845070423, 0.00588235294118, 0.00324675324675, 0.00297619047619, 0.00143266475645, 0.00135317997294, 0.0020202020202)
IPTG_accept <-c(0.333333333333, 0.142857142857, 0.0666666666667, 0.0526315789474, 0.0277777777778, 0.0103092783505, 0.00381679389313, 0.00258397932817, 0.00120048019208, 0.00109170305677 )
#population_Atc <-c(1,2,3,4,5,6,7,8,9,10,11,12)
population_iptg <-c(1,2,3,4,5,6,7,8,9,10)






plot(population_iptg, IPTG_accept, xlim=c(0,11), ylim=c(0,0.4),col='black', pch=20, xlab='Population', ylab='Acceptance rate')
lines(population_iptg, IPTG_accept,col='black')
#points(population_iptg, IPTG_accept, xlim=c(0,10), ylim=c(0,0.4), col='#a50026', pch=20)
#lines(population_iptg, IPTG_accept, col='#a50026')
#legend(7, 0.35, legend=c("ATc induction", "IPTG induction"),
 #      col=c('#006837', "#a50026"), lwd=2, cex=1.2,  box.lty=0)

#abline(h=10, lty=5)
#text(1,12,"Epsilon = 10")
