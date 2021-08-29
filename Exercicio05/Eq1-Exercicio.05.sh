#!/bin/bash
#==========================================================================================+
#                                                                                          |
# UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ - UTFPR                                       |
# CAMPI - Santa Helena - Paraná Brasil                                                     |
#                                                                                          |
# DISCIPLINA = Laboratório de Sistemas Operacionais                                        |
# TRABALHO AVALIATIVO - SHELL NÚMERO = 05                                                  |
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
# 3 - Construir um script de Autidotira de Redes do seu equipamento, através dos seguintes |
#     comandos: ip add show; route; netstat -atup; traceroute; mtr; e tcpdump              |
# 4 - Bole um relatório gerencial mostrando detalhadamente e de forma que ao ver o rela-   |
#     tório seja bem instrutivo e funcional, bem como mostre a estatística do uso da sua   |
#     rede;                                                                                |
# 5 - Mostrar também as principais funiconalidades do computador que está sendo analisado; |
# 6 - Mostrar em formato de relatório:                                                     |
#     * Tamanho da memória do seu computador e quanto está sendo usado;                    |
#     * Quandidade de Discos existentes, e o percentual de utilização;                     |
#     * Quantidade de Volumes montados na sua máquina com o seu uso total;                 |
#     * Mostrar qual é o usuário que está gerando o relatório;                             |
#     * O nome deste relatório deve ser: Relatorio_auditoria-MeuDesktop.txt                |
#     * Você deve enviar de alguma forma este arquivo para o ambiente Windows e fazer a    |
#       estatística dos ambientes operacionais que existem.                                |
#                                                                                          |
#     -------------------------------------------------------------------------------      |
#      VALOR DO EXERCÍCIO = Nota até 2,0 (dois pontos)                                     |
#     -------------------------------------------------------------------------------      |
#==========================================================================================+

OUT_FILE=Relatorio_auditoria-MeuDesktop.txt

functionToInstallRequiredPackages() {
    REQUIRED_PKG=$1
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
        echo Checking for $REQUIRED_PKG: $PKG_OK
    if [ "" = "$PKG_OK" ]; then
        echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
        sudo apt-get --yes install $REQUIRED_PKG
    fi
}

MEMBERS=(
    [1]="Danrlei Vieira da Silva de Souza"
    [2]="Jean Carlos da Silva" 
    [3]="Jecé Xavier Pereira Neto"
    [4]="Vagner Humberto Wentz"
)

MEMBERS_COURSES=(
    [1]="Ciências da Computação - UTFPR/MD"
    [2]="Ciências da Computação - UTFPR/SH"
    [3]="Ciências da Computação - UTFPR/SH" 
    [4]="Ciências da Computação - UTFPR/MD"
)

echo -e -ne '\e[1;32m|||||||                     (33%)\r\e[0m'
sleep 1
echo -ne -e '\e[1;32m||||||||||||||             (66%)\r\e[0m'
sleep 1
echo -ne -e '\e[1;32m||||||||||||||||||||||||||   (100%)\r\e[0m'
echo -ne '\n'

echo -e "\e[1;32m+------------------------------------+----------------------------------+\e[0m"
echo -e "\e[1;32m|               NOME                 |               CURSO              |\e[0m"
echo -e "\e[1;32m+------------------------------------+----------------------------------+\e[0m"
echo -e "\e[1;32m|${MEMBERS[1]}    |${MEMBERS_COURSES[1]} |\e[0m"
echo -e "\e[1;32m|${MEMBERS[2]}                |${MEMBERS_COURSES[2]} |\e[0m"
echo -e "\e[1;32m|${MEMBERS[3]}            |${MEMBERS_COURSES[3]} |\e[0m"
echo -e "\e[1;32m|${MEMBERS[4]}               |${MEMBERS_COURSES[4]} |\e[0m"
echo -e "\e[1;32m+------------------------------------+----------------------------------+\e[0m"

echo ""
echo ""

sleep 2

IP_DISPLAY="$(hostname -I | cut -d' ' -f1)"

echo -e "\e[1;32m+------------------------------------+\e[0m"
echo -e "\e[1;32m|            IP DA MÁQUINA           |\e[0m"
echo -e "\e[1;32m+------------------------------------+\e[0m"
echo -e "\e[1;32m|            $IP_DISPLAY          |\e[0m"
echo -e "\e[1;32m+------------------------------------+\e[0m"

echo ""
echo ""

sleep 2

echo "+--------------------------------------------------------------------+"
echo "|                     KERNEL IP ROUTING TABLE                        |"
echo "+--------------------------------------------------------------------+"
route | awk '{if (NR!=1 && NR!=3) {print "|"$1"\t\t\t"$2"\t\t\t"$3}}'
echo "+--------------------------------------------------------------------+"

echo -e "\e[1;31mESTE PROCESSO PODE LEVAR ALGUNS SEGUNDOS A MAIS, ENTÃO AGUARDE \e[0m"

sleep 2

netstat -atup | awk 'BEGIN{FS="\t"} {if (NR!=1)} {print $1"\t\t\t"$4"\t\t\t"$6}'

functionToInstallRequiredPackages "traceroute"
functionToInstallRequiredPackages "mtr"

TRACEROUTE_HOST=app.rocketseat.com.br
ip addr show
netstat -atup
traceroute $TRACEROUTE_HOST
mtr $TRACEROUTE_HOST

echo "Internet? $(ping -c 1 app.rocketseat.com.br > /dev/null || echo "Não" && echo "Sim")"
echo "Uptime: $(uptime)"
echo "Uso de rede em 2s:"

DISTRO=$(cat /etc/*-release | grep '^NAME=' | sed 's;NAME=\(.*\);\1;g' | tr -d "\n")
VERSAO=$(cat /etc/*-release | grep '^VERSION_ID=' | sed 's;VERSION_ID="\(.*\)";\1;g' | tr -d "\n")
KERNEL="$(uname -s) $(uname -r)"
HOSTNAME="$(hostname)"
echo -e "\e[1;31m+------------------------------------+-------------------------------+-----------------------+\e[0m"
echo -e "\e[1;40m|            DISTRUBIÇÃO             |            VERSÃO             |         KERNEL        |\e[0m"
echo -e "\e[1;31m+------------------------------------+-------------------------------+-----------------------+\e[0m"
echo -e "\e[1;32m|           $DISTRO                 |             $VERSAO             | $KERNEL|\e[0m"
echo "+------------------------------------+-------------------------------+-----------------------+"
echo -e "\e[1;32m|                                      HOSTNAME                                              |\e[0m"
echo "+--------------------------------------------------------------------------------------------+"
echo -e "\e[1;32m|                                      $HOSTNAME                                                |\e[0m"
echo "+--------------------------------------------------------------------------------------------+"
echo "BogoMIPS"
# https://www.blogporta80.com.br/2019/06/29/artigos-o-que-e-bogomips/
cat /proc/cpuinfo | grep bogomips | awk '{print "\t" $3}'
echo "Flags da CPU: $(cat /proc/cpuinfo | grep flags | head -n 1 | sed 's;^.*:\ ;;')"

echo "Memória RAM usada \t Memória RAM livre" > $OUT_FILE
echo "$(free -m | awk 'NR == 2{ print $3 "\t"  $2 "M" }')" > $OUT_FILE
lsblk -il | awk 'NR > 1 {print "/dev/" $1 " " $4}' >> $OUT_FILE
df -T | awk 'NR > 1 {print $1 "\t " $2 " " ($4/1000) "MB / " (($4 + $5)/1000) "MB" }' >> $OUT_FILE
echo "Logado com $(whoami)" >> $OUT_FILE

