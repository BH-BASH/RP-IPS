#!/bin/bash

##tool-info
echo "FG03RP-IPS-mkd-Edition.ver-1.0.1"
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

##ディレクトリ/記録用調査ファイル作成
echo "端末のユーザー名を入力してください"
read user_name
echo "自由にディレクトリ名を決められます。決めますか？"
echo "(1:OK"
echo "(2:NO"

read $num_read

if [ $num_read = 1 ] ; then
   echo "1を選択しました。"
   echo "任意の親ディレクトリ名を入力してください"
   read mkder_free_name
   mkdir -p /home/$user_name/$mkder_free_name/FG03IPS/IP-Data/$IP_main/
   echo "ディレクトリ作成ができました"
   echo "作成したディレクトリの使用可能な権限を変更します"
   chown -R $user_name:$user_name /home/$user_name/$mkder_free_name/FG03IPS/IP-Data/$IP_main/
   echo "ディレクトリが消せない場合は以下のコマンドで消してください"
   echo "sudo rm -Ri [ディレクトリ名]"
   echo "調査記録用ファイルを作成します"
   cd  /home/$user_name/$mkder_free_name/FG03IPS/IP-Data/$IP_main/ && touch $IP_main.txt
   
   ##調査用&追記コマンド実行
   nslookup $IP_main && ipcount $IP_main - $IP_subnet && whois $IP_main && ipfetch $IP_main && whois $IP_main >> /home/$user_name/$mkder_free_name/FG03IPS/IP-Data/$IP_main/$IP_main.txt

   echo "記録が完了しました"
   echo "終了します"
   exit 1


elif [ $num_read = 2 ] ; then
   echo "2を選択しました。"
   echo "通常作成します"    
   mkdir -p /home/$user_name/FG/FG03IPS/IP-Data/$IP_main/
   echo "ディレクトリ作成ができました"
   echo "作成したディレクトリの使用可能な権限を変更します"
   chown -R $user_name:$user_name /home/$user_name/FG/FG03IPS/IP-Data/$IP_main/
   echo "ディレクトリが消せない場合は以下のコマンドで消してください"
   echo "sudo rm -Ri [ディレクトリ名]"
   echo "調査記録用ファイルを作成します"
   cd  /home/$user_name/FG/FG03IPS/IP-Data/$IP_main/ && touch $IP_main.txt
   
   ##調査用&追記コマンド実行
   nslookup $IP_main && ipcount $IP_main - $IP_subnet && whois $IP_main && ipfetch $IP_main && whois $IP_main >> /home/$user_name/FG/FG03IPS/IP-Data/$IP_main/$IP_main.txt

   echo "記録が完了しました"
   echo "終了します"
   exit 2

else
   echo "選択肢が間違っています"
   echo "調査が失敗しました"
   echo "終了します"

fi
##調査用&追記コマンド実行

##nslookup $IP_main && ipcount $IP_main - $IP_subnet && whois $IP_main && ipfetch $IP_main && whois $IP_main >> /home/$user_name/$mkder_free_name/FG03IPS/IP-Data/$IP_main/$IP_main.txt

##whois $IP_main | nslookup $IP_main | ipcount $IP_main - $IP_subnet

