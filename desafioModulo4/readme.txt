# Desafio de Projeto - Modelagem e Transformação de Dados com DAX no Power BI

## Descrição do Projeto

Este projeto tem como objetivo a criação de um modelo de dados em **esquema estrela** no Power BI utilizando a tabela **Financial Sample** como fonte principal. A partir dela, foram geradas tabelas dimensão e fato, aplicando técnicas de transformação de dados e cálculo de métricas utilizando **DAX**. O modelo foi estruturado para fornecer insights claros e organizados sobre vendas, descontos, produtos e outras métricas relevantes.

---

## Arquivos do Repositório

- **`projeto.pbix`**: Arquivo do Power BI contendo o modelo de dados completo.
- **`esquema_estrela.png`**: Imagem do esquema estrela utilizado no projeto.
- **`README.md`**: Documento descritivo do projeto (este arquivo).

---

## Processo de Construção do Modelo

### 1. **Análise Inicial da Tabela Fonte**

A tabela **Financial Sample** foi analisada para identificar colunas relevantes e entender quais poderiam ser utilizadas para criar as tabelas dimensão e fato do modelo.

### 2. **Criação das Tabelas no Esquema Estrela**

Baseado na análise, o modelo foi dividido nas seguintes tabelas:

- **Financials\_origem**: Backup da tabela original para garantir segurança dos dados.

- **D\_Produtos**:

  - Campos: `ID_produto`, `Produto`, `Média de Unidades Vendidas`, `Média do Valor de Vendas`, `Mediana do Valor de Vendas`, `Valor Máximo de Venda`, `Valor Mínimo de Venda`.
  - Objetivo: Resumir informações agregadas por produto.

- **D\_Produtos\_Detalhes**:

  - Campos: `ID_produtos`, `Discount Band`, `Sale Price`, `Units Sold`, `Manufacturing Price`.
  - Objetivo: Fornecer detalhes adicionais sobre os produtos vendidos.

- **D\_Descontos**:

  - Campos: `ID_produto`, `Discount`, `Discount Band`.
  - Objetivo: Centralizar dados sobre descontos aplicados.

- **D\_Detalhes**:

  - Campos: Informações adicionais não contempladas em outras tabelas (ex.: detalhes do segmento, localidade).

- **D\_Calendário**:

  - Criada com DAX usando a função `CALENDAR()`.
  - Objetivo: Gerenciar análises temporais.

- **F\_Vendas**:

  - Campos: `SK_ID`, `ID_Produto`, `Produto`, `Units Sold`, `Sales Price`, `Discount Band`, `Segment`, `Country`, `Sellers`, `Profit`, `Date`.
  - Objetivo: Centralizar os dados de vendas para análise.

### 3. **Configuração de Relacionamentos**

As tabelas foram conectadas com base em chaves primárias e estrangeiras, formando um esquema estrela otimizado para consultas e visualizações no Power BI.

### 4. **Criação da Tabela de Datas com ADDCOLUMNS**

A tabela de datas foi criada com a seguinte fórmula DAX, incluindo colunas personalizadas:

```DAX
D_Calendário = 
ADDCOLUMNS(
    CALENDAR(DATE(2020, 1, 1), DATE(2023, 12, 31)),
    "Ano", YEAR([Date]),
    "Mês", FORMAT([Date], "MMMM"),
    "Número do Mês", MONTH([Date]),
    "Trimestre", "Q" & QUARTER([Date]),
    "Semana", WEEKNUM([Date]),
    "Dia da Semana", FORMAT([Date], "dddd"),
    "Chave_Data", FORMAT([Date], "YYYYMMDD")
)
```

---

## Funcionalidades Implementadas

- **Hierarquia de Datas**:

  - Níveis: Ano, Trimestre, Mês e Dia.
  - Criada manualmente para melhor controle e personalização.

- **Funções DAX Utilizadas**:

  - `CALENDAR`, `ADDCOLUMNS`, `YEAR`, `MONTH`, `FORMAT`, `QUARTER`, `WEEKNUM`.

- **Estrutura de Modelo**:

  - Modelo em Esquema Estrela que garante performance e facilita análises complexas.

---

## Conclusão

Este projeto demonstra a construção de um modelo de dados eficiente e otimizado no Power BI utilizando técnicas de modelagem em esquema estrela e transformações com DAX. Com esta abordagem, é possível realizar análises aprofundadas e obter insights valiosos de forma organizada e escalável.

Se este projeto foi útil para você, não esqueça de dar uma estrela no repositório e compartilhar com outros entusiastas de dados!

