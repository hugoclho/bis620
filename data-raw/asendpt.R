## code to prepare `asendpt` dataset goes here

asendpt <- read_sas(file.path("data-raw/asendpt.sas7bdat"))

usethis::use_data(asendpt, overwrite = TRUE)
