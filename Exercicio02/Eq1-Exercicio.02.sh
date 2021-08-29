#!/bin/bash
#==========================================================================================+
#                                                                                          |
# UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ - UTFPR                                       |
# CAMPI - Santa Helena - Paraná Brasil                                                     |
#                                                                                          |
# DISCIPLINA = Laboratório de Sistemas Operacionais                                        |
# TRABALHO AVALIATIVO - SHELL NÚMERO = 02                                                  |
# PROFESSOR: Euclides Peres Farias Junior                                                  |
# ALUNOS - Campus - RA                                                                     |
#   Danrlei Vieira da Silva de Souza    - Medineira     -   1868870                        |
#   Jean Carlos da Silva                - Santa Helena  -   1700731                        |
#   Jecé Xavier Pereira Neto            - Santa Helena  -   1979990                        |
#   Vagner Humberto Wentz               - Medineira     -   1928180                        |
#                                                                                          |
# Criar um Shell Script que faça o seguine:                                                |
#                                                                                          |
# 0 - Você deve capturar a Variável criada no shell 01, contendo os nomes e e-mail dos     |
# alunos e mostrar neste shell;                                                            |
# 1 - Você deve avaliar o arquivo Relatorio-Redes-Internet.txt que o Professor disponi-    |
#     lizou e fazer as seguintes construções:                                              |
# 2 - Criar um relatório que deva mostrar de forma gerencial em formato de formulário      |
#        * Mostrar em colunas somente os endereços IPs que aparecem neste relatório;       |
#        * Mostrar ao lado dos endereços IPs, o campo de Horário, somente o  horário       |
#          mostrado em HH:MM:SS                                                            |
#        * Mostrar em outra coluna somente as portas de comunicação que operou             |
#        (vocês devem consultar na Internet o uso do programa tcpdump para saber           |
#         como e onde está as portas de comunicação.                                       |
#        * Ao final do relatório, você deve separar por traços "---------"                 |
#        * Mostrar o total de linhas lidas, da seguinte forma:                             |
#          Foram lidas ........................................: [ XX ] Linhas do arquivo. |
#        * Mostrar o Total de IPs apresentados no relatório ...: [ YY ] IPs lidos.         |
#        * Mostrar a quantidade de portas apresentadas ........: [ ZZ ].                   |
#   OBSERVAÇÃO IMPORTANTE: No seu filtro, deve evitar a duplicidade de IP e de Portas      |
#                          para gerar e mostrar no total pedido.                           |
#                                                                                          |
#     -------------------------------------------------------------------------------      |
#      VALOR DO EXERCÍCIO = Nota até 2,0 (dois pontos)                                     |
#     -------------------------------------------------------------------------------      |
#==========================================================================================+



#===================================== Exercicio 2.0 ===================================== +
#===================================== Exercicio 2.1 ===================================== +
#===================================== Exercicio 2.2 ===================================== +

# Busca o horario e o ip e realoca para o arquivo ips
awk '{printf "%s \t%s\n", $1, $5}' Relatorio-Redes-Internet.txt | sed 's/\.[0-9]\{6\}//g' | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | sed 's/\(\.\([a-z\-]\)\+\)*//g' | egrep  '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]*\:' | sed 's/\.[0-9]*\://g' > ips

# Obtem as portas e move para o arquivos ports
awk '{printf "%s\n" $5}' Relatorio-Redes-Internet.txt | sed 's/\.[0-9]\{6\}//g' | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | sed 's/\(\.\([a-z\-]\)\+\)*//g' | egrep  '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]*\:' | egrep -oh '\.[0-9]*\:' > ports

# Faz uma trativa do arquivo ports
sed -i 's/[\.\:]//g' ports

# Reorganiza a coluna ports junto com os ips
paste ips ports > Relatorio-Final

# Forma, como solicitado, para separar
echo "--------" >> Relatorio-Final

# Realiza a contagem de linhas 
LINHAS=`cat Relatorio-Final | wc -l`
IPS_UNICOS=`cat Relatorio-Final | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -k 2 --unique | wc -l`
PORTAS_UNICAS=`cat Relatorio-Final | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -k 3 --unique | wc -l`

# Insere valores no Relatorio-Final
echo "Foram lidas ........................................:[ $LINHAS ] Linhas do arquivo" >> Relatorio-Final
echo "Mostrar o Total de IPs apresentados no relatório ...:[ $IPS_UNICOS ] IPs lidos." >> Relatorio-Final
echo "Mostrar a quantidade de portas apresentadas ........:[ $PORTAS_UNICAS ]" >> Relatorio-Final

# Remoção dos arquivos 
rm ips ports

# Limpando variaveis que foram utilizadas
unset LINHAS IPS_UNICOS PORTAS_UNICAS

# Relatorio Final
cat Relatorio-Final