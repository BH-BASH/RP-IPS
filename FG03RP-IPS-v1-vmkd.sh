#!/bin/bash

##tool-info
echo "FG03RP-IPS-Edition.ver-1.0.0"
echo "Tool-Ver:1.0.0"
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

##ディレクトリ作成
echo "端末のユーザー名を入力してください"
read user_name
echo "任意の親ディレクトリ名を入力してください"
read mkder_free_name
mkdir -p /home/$user_name/$mkder_free_name/FG03IPS/IP-Data/$IP_main/
echo "ディレクトリ作成ができました"
echo "作成したディレクトリの使用可能な権限を変更します"
chown -R $user_name:$user_name /home/$user_name/$mkder_free_name/FG03IPS/IP-Data/$IP_main/
echo "ディレクトリが消せない場合は以下のコマンドで消してください"
echo "sudo rm -Ri [ディレクトリ名]"



##調査用コマンド実行

##whois $IP_main && nslookup $IP_main && ipcount $IP_main - $IP_subnet

whois $IP_main | nslookup $IP_main | ipcount $IP_main - $IP_subnet