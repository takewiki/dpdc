#' 获取单个变更的概念
#'
#' @param model 模型
#' @param x 数值
#'
#' @return 返回值
#'
#' @examples log.fit();
log_fit<- function(model,x){
  yp <-predict(model,data.frame(Fincome=x));
  res <- exp(yp)/(1+exp(yp))
  return(res);
}

#' 获取多个变量的概率值
#'
#' @param model 模型
#' @param data  数据
#'
#' @return 返回值
#' @export
#'
#' @examples log.fits();
log_fits <- function(model,data){
  res<-lapply(data,function(i){
    log_fit(model,i)
  })
  res <- unlist(res);
  res <- round(res,4)
  names(res)<-data;
  return(res);
}