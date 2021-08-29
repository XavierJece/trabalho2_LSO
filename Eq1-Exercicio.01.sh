#!/bin/bash
#==========================================================================================+
#                                                                                          |
# UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ - UTFPR                                       |
# CAMPI - Santa Helena - Paraná Brasil                                                     |
#                                                                                          |
# DISCIPLINA = Laboratório de Sistemas Operacionais                                        |
# TRABALHO AVALIATIVO - SHELL NÚMERO = 01                                                  |
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
# 4 - Construa um Arquivo denominado Base_Dados.csv, coletando uma listagem completa do    |
# diretório "/etc" ordenado por Data; OBSERVAÇÃO: Sem sair do diretório corrente           |
# 5 - Extrair do Arquivo gerado as seguintes informações:                                  |
#        * Mostrar o nome completo de todos os alunos ordenados por Nome e seu e-mail      |
#          separado por vírgula;                                                           |
#        * Mostrar uma listagem "Somente dos Nomes" dos arquivos existentes no diretório   |
#          ordenado por Data;                                                              |
#        * Mostrar um texto contendo..: Existem neste diretório "X" Arquivos;              |
#        * Mostrar quantos arquivos existem que terminam com a extensão *.conf             |
#                                                                                          |
#     -------------------------------------------------------------------------------      |
#      VALOR DO EXERCÍCIO = Nota até 2,0 (dois pontos)                                     |
#     -------------------------------------------------------------------------------      |
#==========================================================================================+ 



#===================================== Exercicio 1.0 ===================================== +
MEMBERS=(
  "Danrlei Vieira da Silva de Souza"
  "Jean Carlos da Silva"
  "Jecé Xavier Pereira Neto"
  "Vagner Humberto Wentz"
)

MEMBERS_EMAIL=(
  "danrlei_vieira@hotmail.com"
  "jeansilva@alunos.utfpr.edu.br"
  "jece@alunos.utfpr.edu.br"
  "wentz.vagner@gmail.com"
)

echo "MEMBERS: ${MEMBERS[@]}"
echo "MEMBERS_EMAIL: ${MEMBERS_EMAIL[@]}"


#===================================== Exercicio 1.1 ===================================== +
#================= Jeito 1
declare -a MEMBERS_ID

for ((i=0; i<${#MEMBERS[@]}; i++)); do
   MEMBER_NO_WHITESPACE="$(echo -e "${MEMBERS[$i]}" | tr -d '[:space:]')"
    echo "MEMBER $i: ${MEMBER_NO_WHITESPACE}"
   MEMBERS_ID+=("$MEMBER_NO_WHITESPACE")
 done

 echo "MEMBERS_ID: ${MEMBERS_ID[@]}"

#================= Jeito 2
MEMBERS_ID=(
  "1868870"
  "1700731"
  "1979990"
  "1928180"
)

echo "MEMBERS_ID: ${MEMBERS_ID[@]}"

#===================================== Exercicio 1.2 ===================================== +
MEMBERS_COURSES=(
  "Ciência da Computação - UTFPR/MD" 
  "Ciência da Computação - UTFPR/SH" 
  "Ciência da Computação - UTFPR/SH" 
  "Ciência da Computação - UTFPR/MD"
)

echo "MEMBERS_COURSES: ${MEMBERS_COURSES[@]}"

#===================================== Exercicio 1.3 ===================================== +
CURRENT_DIRETORY=$(pwd)

echo "CURRENT_DIRETORY: $CURRENT_DIRETORY"

#===================================== Exercicio 1.4 ===================================== +
LIST_DIRECTORIES_ETC=$(ls -dtlr /etc/*/ | awk '{printf "%s,%s,%s,%s\r", $6, $7, $8, $9}')
echo $LIST_DIRECTORIES_ETC > ./Base_Dados.csv
echo $LIST_DIRECTORIES_ETC

#===================================== Exercicio 1.5 ===================================== +

#================= Lista de Arquivos
echo ""
echo "+============================ Lista de Arquivos =======================+"
LIST_FILES=$(ls -Ltrp /etc | grep -v /)
echo "$LIST_FILES"

#================= Quantidade de Arquivos
echo ""
echo "+========================== Quantidade de Arquivos =======================+"

QTD_FILES=$(ls -Ltrp /etc | grep -v / | wc -l)
echo "Existem neste diretório $QTD_FILES Arquivos"

#================= Quantidade de Arquivos com Extensão .conf
QTD_FILES_CONF=$(ls -Ltrp /etc | grep '.conf$' | wc -l)
echo "Existem neste diretório $QTD_FILES_CONF Arquivos com Extensão .conf"

#================= Fazendo Rodape
echo ""
echo "+=================================== Rodape ==============================+"
for ((i=0; i<${#MEMBERS[@]}; i++)); do
  echo "   ${MEMBERS[$i]}  -  ${MEMBERS_EMAIL[$i]},"
done
echo "+=========================================================================+"