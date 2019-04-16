library(dpdc);

data('pca_data1');

pca_data2 <-pca_data1[,-1];
rownames(pca_data2) <- pca_data1[,1];
#pca_data2;
pca_cor <-round(cor(pca_data2),3);
pca_cor;
#构建模型
pca_model <- princomp(pca_data2,cor = T);
pca_model;
pca_summary <- summary(pca_model,loadings = T);
#特征值 即贡献
pca_summary$sdev^2;
pca_summary$sd^2/sum(pca_summary$sd^2);
#特征向量即主成分系数
pca_loadings <-loadings(pca_model);
#主成分作碎石图
screeplot(pca_model,type='lines');
#第一第二主成分作图
plot(pca_loadings[,1:2],xlim = c(-0.6,0.5),ylim = c(-0.6,0.5));
text(pca_loadings[,1],pca_loadings[,2],adj=c(-0.8,0.5),cex=1.2);
abline(h=0);abline(v=0);
#计算主成分得分
pca_score <-round(pca_model$scores,3);
pca_score <-addmargins(pca_score);
pca_score <- as.data.frame(pca_score);
#行业按得分进行排名，值越小实力越强
pca_score_sorted <- pca_score[order(pca_score$Sum),]
pca_score_sorted;
