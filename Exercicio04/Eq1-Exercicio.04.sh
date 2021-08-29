#!/bin/bash
#==========================================================================================+
#                                                                                          |
# UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ - UTFPR                                       |
# CAMPI - Santa Helena - Paraná Brasil                                                     |
#                                                                                          |
# DISCIPLINA = Laboratório de Sistemas Operacionais                                        |
# TRABALHO AVALIATIVO - SHELL NÚMERO = 04                                                  |
# PROFESSOR: Euclides Peres Farias Junior                                                  |
# ALUNOS - Campus - RA                                                                     |
#   Danrlei Vieira da Silva de Souza    - Medineira     -   1868870                        |
#   Jean Carlos da Silva                - Santa Helena  -   1700731                        |
#   Jecé Xavier Pereira Neto            - Santa Helena  -   1979990                        |
#   Vagner Humberto Wentz               - Medineira     -   1928180                        |
#                                                                                          |
#                     AMBIENTE WINDOWS                                                     |
#                                                                                          |
# Criar um Shell em POWERSHELL Script que faça o seguine:                                  |
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
#      ATENÇÃO - PARA POWERSHELL OS ALUNOS DEVEM BUSCAR A MAIOR PARTE POSSÍVEL DOS COMANDOS|
#                QUE PODEM AUXILIAR NA PRODUÇÃO DO RELATÓRIO QUE FOI SOLICITADO.           |
#==========================================================================================+



#===================================== Exercicio 4.0 ===================================== +

$MEMBERS= "Danrlei Vieira da Silva de Souza, Jean Carlos da Silva, Jecé Xavier Pereira Neto, Vagner Humberto Wentz"

# Para imprimir o valor da variavel #####
$MEMBERS

#===================================== Exercicio 4.1 ===================================== +

$MEMBERS_ID = "1868870, 1700731, 1979990, 1928180"

# Para imprimir o valor da variavel #####
$MEMBERS_ID

#===================================== Exercicio 4.2 ===================================== +

$MEMBERS_COURSES = "Ciência da Computação - UTFPR/MD, Ciência da Computação - UTFPR/SH,  Ciência da Computação - UTFPR/SH, Ciência da Computação - UTFPR/MD"

# Para imprimir o valor da variavel #####
$MEMBERS_COURSES

#===================================== Exercicio 4.3 ===================================== +
echo "===================================================================================================="
echo "  Auditoria "
echo "===================================================================================================="
echo " IP "
$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select IPV4Address
echo $ipV4
echo "===================================================================================================="
echo " Route "
$route = Get-NetRoute
echo $route
echo "===================================================================================================="
echo  " Traceroute "
echo "===================================================================================================="
echo "comando nao encontrado"
echo "===================================================================================================="
echo " Conexões TCP "
$tcp = Get-NetTCPConnection -State Listen
echo $tcp
echo "===================================================================================================="
echo " Equivalente a MTR "
echo "===================================================================================================="
echo "comando nao encontrado"
echo "===================================================================================================="
echo "TCPDUMP "
echo "===================================================================================================="
echo "comando nao encontrado"
echo "===================================================================================================="


#===================================== Exercicio 4.4 ===================================== +
echo "===================================================================================================="
echo = " Relatorio de uso "
echo "===================================================================================================="
echo "===================================================================================================="
echo " configuração do IP da máquina "
echo "====================================================================================================" 
Get-NetIpConfiguration
echo "===================================================================================================="
echo "===================================================================================================="
echo " Informações do sistema "
echo "===================================================================================================="
Get-CimInstance Win32_OperatingSystem | select *
echo "===================================================================================================="
echo "===================================================================================================="
echo " Estatistica da rede"
Get-NetAdapterStatistics
echo "===================================================================================================="      

#===================================== Exercicio 4.5 ===================================== +

echo "===================================================================================================="
echo "FUNCIONALIDADES: "
echo "===================================================================================================="
(Get-WmiObject Win32_OperatingSystem).CSName
echo "===================================================================================================="
(Get-WmiObject Win32_OperatingSystem).OSArchitecture
echo "===================================================================================================="
(Get-WMIObject win32_operatingsystem).caption
echo "===================================================================================================="
(Get-CimInstance Win32_OperatingSystem) | more
echo "===================================================================================================="

#===================================== Exercicio 4.6 ===================================== +
echo "===================================================================================================="
echo "Gerando relatorio"
echo "===================================================================================================="
Get-CimInstance Win32_OperatingSystem | select * | Out-File -FilePath .\Relatorio_auditoria-MeuDesktop.txt
Get-Content -Path .\Relatorio_auditoria-MeuDesktop.txt
echo "===================================================================================================="