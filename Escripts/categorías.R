library(stringr)

archivos <- list.files(pattern = "qmd$", recursive = TRUE)


categorias <- data.frame(arch = character(0),cats = character(0))
for (archivo in archivos)
{
  lineas <- readLines(archivo)
  for (linea in lineas) 
    {
        if (str_detect(linea, pattern = "categories\\:\\s\\[")) 
          {
            categorias <- rbind(categorias, 
                                c(arch = archivo,
                                cats = str_extract(
                                  linea, 
                                  pattern = "(?<=\\[)(.*)(?=\\])")))
          }
    }
}

names(categorias) <- c("arch", "cats")
categorias
