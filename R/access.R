#' @title Get token
#'
#' @return token
#'
#' @export

Token <- function(){
  if (!requireNamespace("digest", quietly = TRUE))install.packages("digest")
  if (!requireNamespace("do", quietly = TRUE))install.packages("do")
  suppressWarnings(suppressPackageStartupMessages(library(digest)))
  suppressWarnings(suppressPackageStartupMessages(library(do)))
  path <- "C:/Windows/System32/wbem/wmic.exe"
  cpu <- system2(path, args = c("cpu", "get","ProcessorId"), stdout = TRUE)
  cpu <- strsplit(cpu, "\n")[[2]][1]
  cpu <- do::Replace0(do::Replace0(cpu, " "), "\r")
  user <- Sys.info()
  user <- do::Replace0(user[names(user) %in% "user"], " ")
  info <- paste0(cpu, user)
  info <- suppressWarnings(digest(info, algo = "md5"))
  message(paste0("\n       你的Token:  ", info))
  message("       请将你的Token发送给作者完成授权！\n ")
  return(info)
}
