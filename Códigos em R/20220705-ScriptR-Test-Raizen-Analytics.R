##########################
# Bibliotecas utilizadas #
##########################

library(readxl)
library(stringr)
library(dplyr)
library(tidyverse)
library(tidyr)
library(lubridate)

######################
# Separando os dados #
######################

# Diretório
setwd('C://Users//Dell//Desktop//Raizen Analytics')

# Verificando todos os nomes das planilhas
sheet_names <- excel_sheets("vendas-combustiveis-m3.xls") 

# Dadas as planilhas já geradas em VBA, definindo as planilhas para cada banco de dados 
sheet_names_combustivel <- stringr::str_subset(sheet_names, pattern = "Comb_")
sheet_names_diesel <- stringr::str_subset(sheet_names, pattern = "Diesel_")

# Puxando todas as planilhas para uma lista para cada banco
list_all_combustivel <- lapply(sheet_names_combustivel, function(x) {         
  as.data.frame(read_excel("vendas-combustiveis-m3.xls", sheet = x)) } )
list_all_diesel <- lapply(sheet_names_diesel, function(x) {         
  as.data.frame(read_excel("vendas-combustiveis-m3.xls", sheet = x)) } )

#############################################################################################################################
# Vendas, pelas distribuidoras¹, dos derivados combustíveis de petróleo por Unidade da Federação e produto - 2000-2020 (m3) #
#############################################################################################################################

# Compactando todas as planilhas em um data.frame único
compact_all <- as.data.frame(do.call(rbind, list_all_combustivel))

# Removendo a coluna com o TOTAL
compact_all$TOTAL <- NULL

# Pivotando os meses 
compact_all_pivot <- gather(compact_all, key="month", value="volume", 6:length(compact_all))

# Criando a coluna year_month e created_at 
compact_all_pivot <- compact_all_pivot %>% mutate(month = ifelse(month == "Jan", "01",
                                                                      ifelse(month == "Fev", "02",
                                                                             ifelse(month == "Mar", "03",
                                                                                    ifelse(month == "Abr", "04",
                                                                                           ifelse(month == "Mai", "05",
                                                                                                  ifelse(month == "Jun", "06",
                                                                                                         ifelse(month == "Jul", "07",
                                                                                                                ifelse(month == "Ago", "08",
                                                                                                                       ifelse(month == "Set", "09",
                                                                                                                              ifelse(month == "Out", "10",
                                                                                                                                     ifelse(month == "Nov", "11",
                                                                                                                                            ifelse(month == "Dez", "12","Erro")))))))))))),
                                                  created_at = as.POSIXct(Sys.Date(), format = "%m/%d/%Y %H:%M:%S"),
                                                  volume = as.double(volume))

# Acrescentado o ano e alterando a classe para data e renomeando colunas
compact_all_pivot <- compact_all_pivot %>% mutate(year_month = as.Date(paste(ANO,"-", month, "-01", sep = ''),format= "%Y-%m-%d"))

# Finalmente, fazendo a seleção das variáveis e renomeando as colunas para exportar
final <- compact_all_pivot %>% select(year_month, ESTADO, COMBUSTÍVEL, UNIDADE, volume, created_at)
colnames(final) <- c("year_month", "uf", "product", "unit", "volume", "created_at")

# Exportando 
write.csv2(final, "Venda-Combustíveis-UF-Produto.csv", row.names = FALSE)

##################################################################################################
# Vendas, pelas distribuidoras¹, de óleo diesel por tipo e Unidade da Federação - 2013-2020 (m3) #
##################################################################################################

# Compactando todas as planilhas em um data.frame único
compact_all <- as.data.frame(do.call(rbind, list_all_diesel))

# Removendo a coluna com o TOTAL
compact_all$TOTAL <- NULL

# Pivotando os meses 
compact_all_pivot <- gather(compact_all, key="month", value="volume", 6:length(compact_all))

# Criando a coluna year_month e created_at 
compact_all_pivot <- compact_all_pivot %>% mutate(month = ifelse(month == "Jan", "01",
                                                                 ifelse(month == "Fev", "02",
                                                                        ifelse(month == "Mar", "03",
                                                                               ifelse(month == "Abr", "04",
                                                                                      ifelse(month == "Mai", "05",
                                                                                             ifelse(month == "Jun", "06",
                                                                                                    ifelse(month == "Jul", "07",
                                                                                                           ifelse(month == "Ago", "08",
                                                                                                                  ifelse(month == "Set", "09",
                                                                                                                         ifelse(month == "Out", "10",
                                                                                                                                ifelse(month == "Nov", "11",
                                                                                                                                       ifelse(month == "Dez", "12","Erro")))))))))))),
                                                  created_at = as.POSIXct(Sys.Date(), format = "%m/%d/%Y %H:%M:%S"),
                                                  volume = as.double(volume))

# Acrescentado o ano e alterando a classe para data e renomeando colunas
compact_all_pivot <- compact_all_pivot %>% mutate(year_month = as.Date(paste(ANO,"-", month, "-01", sep = ''),format= "%Y-%m-%d"))

# Finalmente, fazendo a seleção das variáveis e renomeando as colunas para exportar
final <- compact_all_pivot %>% select(year_month, ESTADO, COMBUSTÍVEL, UNIDADE, volume, created_at)
colnames(final) <- c("year_month", "uf", "product", "unit", "volume", "created_at")

# Exportando 
write.csv2(final, "Venda-Diesel-UF-Tipo.csv", row.names = FALSE)
