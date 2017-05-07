
library("mvtnorm")
set.seed(10)
setA <- rmvnorm(1000,c(0,0),matrix(c(3,0,0,3),2,2))
setB <- rmvnorm(1000,c(3,3),matrix(c(1,0.99,0.99,1),2,2))
setC <- rmvnorm(1000,c(-1,4),matrix(c(1,-0.9,-0.9,1),2,2))
mock.data <- rbind(setA,setB,setC)
plot(mock.data[1:1000,],pch=16,cex=0.5)
points(mock.data[1001:2000,],pch=16,cex=0.5,col="green")
points(mock.data[2001:3000,],pch=16,cex=0.5,col="red")


library("kohonen")
library("fields")
grid <- somgrid(50,50,"rectangular")
cluster <- som(mock.data,grid,rlen = 100,radius=7,alpha=c(0.05,0.01),keep.data=T)
points(cluster$codes,pch=15,col="blue")

plot(cluster, type="dist.neighbours")
plot(jitter(cluster$grid$pts[cluster$unit.classif[1:1000],1]),jitter(cluster$grid$pts[cluster$unit.classif[1:1000],2]),pch=16,col="black")
points(jitter(cluster$grid$pts[cluster$unit.classif[1001:2000],1]),jitter(cluster$grid$pts[cluster$unit.classif[1001:2000],2]),pch=16,col="green")
points(jitter(cluster$grid$pts[cluster$unit.classif[2001:3000],1]),jitter(cluster$grid$pts[cluster$unit.classif[2001:3000],2]),pch=16,col="red")

