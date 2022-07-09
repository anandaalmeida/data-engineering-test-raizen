# Teste de Engenheiro de Dados - Raízen

Este notebook traz uma solução para o teste proposto pela Raízen, com o objetivo de pivotear as seguintes tabelas:

  - Tabela 1) Vendas, pelas distribuidoras¹, dos derivados combustíveis de petróleo por Unidade da Federação e produto - 2000-2020 (m3);
  - Tabela 2) Vendas, pelas distribuidoras¹, de óleo diesel por tipo e Unidade da Federação - 2013-2020 (m3).

Os programas utilizados para o teste foram `VBA` no Excel e o `R Studio`, versão 4.2.1.

## VBA no Excel

Verifiquei que, após dois cliques em qualquer célula das colunas dos anos, uma nova planilha é aberta com as informações necessárias em relação aos meses daquele ano. Com isso, criei uma VBA para realizar de maneira automatizada a abertura dos dados no intervalo definido. 

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/37222393/178124899-83a33a68-0437-4fd5-ab03-2a227935c7ff.gif)

Para a tabela 1, tem-se o intervalo de 2000 a 2020, assim, foram abertas 20 planilhas. Já para a tabela 2, de 2013 a 2020, mais 8 novas. Foram renomeadas de acordo com a base a qual se referem, para a tabela 1 e 2, tem-se as planilhas iniciadas com os nomes "Comb_" e "Diesel_", respectivamente. 

![image](https://user-images.githubusercontent.com/37222393/177814169-770a77e8-ca62-4369-97e0-897c2a6a5013.png)

## R Studio

Após a extração das bases, foram utilizadas algumas bibliotecas disponíveis no R Studio para a elaboração deste teste, sendo elas, `readxl`, `stringr`, `dplyr` e `tidyr`.

Detalhando o código disponibilizado em R, utilizando as bibliotecas `readxl` e `stringr`, foram separadas as planilhas de acordo com as iniciais renomeadas em VBA e, para cada tabela, foram compilados todos os anos como um único banco de dados. Feito isso, com a função ***gather***, banco `tidyr`, pivotei as colunas referentes aos meses e o resultado são duas novas colunas, "month" e "volume" contendo o volume.

![image](https://user-images.githubusercontent.com/37222393/178125013-58351464-cbf7-4390-a752-6dcd7a44b00b.png)

Para a classificação de data solicitada pelo teste, utilizei a função ***mutate***, banco `dplyr`, para alterar a coluna "month". O que era "Jan", alterei para "01" e assim por diante. Então, ainda utilizando a mesma função, ***mutate***, criei a nova coluna, "year_month", onde fiz a concatenação da coluna "ANO" com "month". Para finalizar as solicitações do teste, inclui a coluna "created_at", que informa a data e a hora que a extração foi realizada.  

![image](https://user-images.githubusercontent.com/37222393/178125248-ff93dc28-40d1-4ce5-9430-c15b40a5072f.png)

Por fim, com a função ***select***, banco `dplyr`, selecionei apenas as colunas de interesse do teste, renomeei para melhor identificação e realizei a exportação com a função ***readr::write_excel_cs***, banco `readxl`.

![image](https://user-images.githubusercontent.com/37222393/178125257-353482f6-0c8c-468f-89c6-3599249fa912.png)

Abaixo disponibilizo os dados no formato `csv`:

  - Tabela 1) [Venda-Combustíveis-UF-Produto.csv](https://github.com/anandaalmeida/data-engineering-test-raizen/files/9065396/Venda-Combustiveis-UF-Produto.csv)
  - Tabela 2) [Venda-Diesel-UF-Tipo.csv](https://github.com/anandaalmeida/data-engineering-test-raizen/files/9065398/Venda-Diesel-UF-Tipo.csv)
