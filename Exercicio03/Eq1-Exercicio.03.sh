#!/bin/bash
#==========================================================================================+
#                                                                                          |
# UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ - UTFPR                                       |
# CAMPI - Santa Helena - Paraná Brasil                                                     |
#                                                                                          |
# DISCIPLINA = Laboratório de Sistemas Operacionais                                        |
# TRABALHO AVALIATIVO - SHELL NÚMERO = 03                                                  |
# PROFESSOR: Euclides Peres Farias Junior                                                  |
# ALUNOS - Campus - RA                                                                     |
#   Danrlei Vieira da Silva de Souza    - Medineira     -   1868870                        |
#   Jean Carlos da Silva                - Santa Helena  -   1700731                        |
#   Jecé Xavier Pereira Neto            - Santa Helena  -   1979990                        |
#   Vagner Humberto Wentz               - Medineira     -   1928180                        |
#                                                                                          |
# Criar um Shell Script que faça o seguine:                                                |
#                                                                                          |
# 0 - Contruir uma variável que receba o nome completo de todos os alunos;                 |
# 1 - Construa uma identificação dos Alunos com Nome Completo;                             |
# 2 - Construa uma identificação do Curso que está cursando;                               |
# 3 - Construa uma variável que recebe o nome completo do Diretório Corrente (Pasta atual);|
# 4 - Construa um Arquivo denominado Relatorio-WhatsApp.csv, coletando a listagem completa |
#     contendo somente a lista de uso do WhatsApp do relatório;                            |
# 5 - Mostrar somente os campos: hora; nome; porta destino; sec e seus valores;            |
#     * Criar um relatório contendo estes valores e organizados por tabelas;               |
#     * Criar uma estatística mostrando o seguinte, qual é o total de dados existentes     |
#       neste campo? Você deve fazer uma função utilizando o FOR para que liste somente    |
#       o campo inicial do valor seq (ex.: seq 385610:386990) extrair somente o primeiro   |
#       campo (385610) e somar, depois fazer o mesmo para o segundo campo (386990) e       |
#       descrever o seguinte: Foram encontrados um total de.: sec[ SOMA 1 ]:[ SOMA 2 ]     |
#     * Deve criar o campo: Foram encontrados um total de [ xxxx ] ações no WhatsApp.      |
#                                                                                          |
#     -------------------------------------------------------------------------------      |
#      VALOR DO EXERCÍCIO = Nota até 2,0 (dois pontos)                                     |
#     -------------------------------------------------------------------------------      |
#==========================================================================================+
#===================================== Exercicio 3.0 ===================================== +
${MEMBERS} = @("Danrlei Vieira da Silva de Souza",
	      "Jean Carlos da Silva",
              "Jecé Xavier Pereira Neto",
              "Vagner Humberto Wentz")

echo $MEMBERS

#===================================== Exercicio 3.1 ===================================== +
 ${ID_MEMBERS} = @("1868870 Danrlei Vieira da Silva de Souza", 
                   "1700731 Jean Carlos da Silva", 
                   "1979990 Jecé Xavier Pereira Neto",
                   "1928180 Vagner Humberto Wentz")

ECHO $ID_MEMBERS

#===================================== Exercicio 3.2 ===================================== +
$MEMBERS_COURSES = @("Ciência da Computação - UTFPR/MD", 
                     "Ciência da Computação - UTFPR/SH",
                     "Ciência da Computação - UTFPR/SH",
                     "Ciência da Computação - UTFPR/MD")

ECHO $MEMBERS_COURSES

#===================================== Exercicio 3.3 ===================================== +
$CURRENT_DIRETORY = $(PWD)

ECHO $CURRENT_DIRETORY
#===================================== Exercicio 3.4 ===================================== +

Select-String -Path ".\Relatorio-Redes-Internet.txt" -Pattern "WhatsApp"> 'C:\EXERCICIO3\Relatorio-WhatsApp.csv'

#===================================== Exercicio 3.5 ===================================== +

#Lendo um arquivo txt
$Text = Get-Content -Path C:\EXERCICIO3\Relatorio-Redes-Internet.txt

#Transformando as linhas do arquivo em um array 
$Text.GetType() | Format-Table -AutoSize

#Listando as linhas do arquivo
foreach ($element in $Text) 
{ 
    $element
}