## code to prepare `aeendpt` dataset goes here

aeendpt <- read_sas(file.path("data-raw/aeendpt.sas7bdat"))

usethis::use_data(aeendpt, overwrite = TRUE)
