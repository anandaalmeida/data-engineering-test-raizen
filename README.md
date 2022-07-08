# Teste de Engenheiro de Dados - Raízen

Este notebook traz uma solução para o teste disponibilizado pela Raízen, com o objetivo de pivotear as seguintes tabelas disponíveis no :

  - Tabela 1) Vendas, pelas distribuidoras¹, dos derivados combustíveis de petróleo por Unidade da Federação e produto - 2000-2020 (m3);
  - Tabela 2) Vendas, pelas distribuidoras¹, de óleo diesel por tipo e Unidade da Federação - 2013-2020 (m3).

Os programas utilizados para o teste foram VBA no Excel e o R Studio, versão 4.2.1.

## VBA no Excel

Verifiquei que, após dois cliques em qualquer célula das colunas dos anos, uma nova planilha é aberta com as informações necessárias em relação aos meses daquele ano. Com isso, criei uma VBA para realizar de maneira automatizada a abertura dos dados no intervalo definido. 

Para a tabela 1, tem-se o intervalo de 2000 a 2020, assim, foram abertas 20 planilhas. Já para a tabela 2, de 2013 a 2020, mais 8 novas. Foram renomeadas de acordo com a base a qual se referem, para a tabela 1 e 2, tem-se as planilhas iniciadas com os nomes "Comb_" e "Diesel_", respectivamente. 

![image](https://user-images.githubusercontent.com/37222393/177814169-770a77e8-ca62-4369-97e0-897c2a6a5013.png)

## R Studio

Após a extração das bases, foram utilizadas algumas bibliotecas disponíveis no R Studio para a elaboração deste teste, sendo elas, readxl, stringr, dplyr, tidyverse, tidyr e lubridate.

Com o código disponibilizado, utilizando o stringr, foram separadas as planilhas de acordo com as iniciais mencionadas no item anterior e compilados todos os anos como data.frame. Feito isso, com a função gather, banco tidyr, pivota-se as colunas referentes aos meses e o resultado são duas novas colunas, "month" e a outra contendo o volume. 

Por fim, foram feitas algumas alterações para classificar as colunas conforme fora solicitado pelo teste.

Abaixo disponibilizo os dados no formato csv:

  - Tabela 1) [Venda-Combustíveis-UF-Produto.csv](https://github.com/anandaalmeida/data-engineering-test-raizen/files/9065396/Venda-Combustiveis-UF-Produto.csv)
  - Tabela 2) [Venda-Diesel-UF-Tipo.csv](https://github.com/anandaalmeida/data-engineering-test-raizen/files/9065398/Venda-Diesel-UF-Tipo.csv)
