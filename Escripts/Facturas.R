library(xml2)
library(stringr)

dir <- "C:/Users/equih/1 Nubes/Dropbox/0 Familia EqBz/"
dir_seguro <- "1 - Seguros/2024 Manguito/"
dir_fisio <- "2024 Escudo Familiar Cirujia Honorarios Médicos/Fisioterapia"

xml_files <- list.files(paste0(dir, dir_seguro, dir_fisio), 
                        pattern = "xml$", full.names = TRUE)
xml_txt <- xml2::read_xml(xml_files)
nodos <- xml2::xml_find_all(xml_txt, "..//*")

valores <- data.frame(0)
for (n in nodos)
{
  vals <- data.frame(t(xml2::xml_attrs(n)))
  if (xml_name(n) == "Emisor")
  {
    names(vals) <- paste0("emisor_", names(vals))
    print(xml_name(n))
    print(vals)
  }
  valores <- cbind(valores, vals)
}


