## code to prepare `ae` dataset goes here

ae <- read_sas(file.path("data-raw/ae.sas7bdat"))

usethis::use_data(ae, overwrite = TRUE)
