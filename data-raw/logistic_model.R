library(dpdc)
data('glm_logistics_data1',package = 'dpdc')

log_model <- glm(FHaveCar~Fincome,family = binomial,data=glm_logistics_data1)


Fincome <-1:max(glm_logistics_data1$Fincome);
probability<-log_fits(log_model,Fincome);
par(mfrow=c(1:2))
plot(glm_logistics_data1);
plot(Fincome,probability);
abline(v = as.numeric(names(probability)[probability >0][1]),col='red')
abline(v = as.numeric(names(probability)[probability ==1][1]),col='blue')
