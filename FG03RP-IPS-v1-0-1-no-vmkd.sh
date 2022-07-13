#!/bin/bash

##tool-info
echo "FG03RP-IPS-Edition.ver-1.0.0"
echo "Tool-Ver:1.0.1"
echo "Coder:BH-BaSH"
echo "TW:BH_BASH_BPS"
echo "sushi.ski:BaSH_HSS"
echo "GitHub:BH-BASH"
echo "このツールはIPアドレスの調査の為に使うツールです"

##現在時刻
echo "現在時刻"
today=`date`
echo $today

##IP入力/確認用出力
echo "調査対象のIPアドレスを入力してください"
read IP_main
echo "調査対象IPアドレス: $IP_main"

echo "次に調査対象のサブネットを入力してください"
read IP_subnet
echo "調査対象サブネットIP: $IP_subnet"

##調査用コマンド実行

nslookup $IP_main && ipcalc $IP_main && ipcount $IP_main - $IP_subnet && whois $IP_main && fping $IP_main $IP_subnet