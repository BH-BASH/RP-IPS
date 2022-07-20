#!/bin/bash

##tool-info
echo "FG03RP-IPS-Edition.ver-1.0.2"
echo "Tool-Ver:1.0.2"
echo "Coder:BH-BaSH"
echo "TW:BH_BASH_BPS"
echo "sushi.ski:BaSH_HSS"
echo "GitHub:BH-BASH"
echo "このツールはIPアドレスの調査の為に使うツールです"

##現在時刻
echo "現在時刻"
today=`date`
echo $today

##逆引き調査
echo "ホスト名からから逆引きして調査しますか？"
echo "(Y:Yes"
echo "(N:No"
read y_or_n
echo "[$y_or_n]を選択しました"
if [ $y_or_n = Y ] ; then
    echo "ホスト名を入力してください"
    read host_name
    echo "ホスト名:$host_name"
    nslookup $host_name
    echo "逆引きされたIPアドレスを入力してください"
    read IP_main
    echo "調査対象IPアドレス: $IP_main"
    
    echo "次に調査対象のサブネットを入力してください"
    read IP_subnet
    echo "調査対象サブネットIP: $IP_subnet"

    ##調査用コマンド実行

    nslookup $IP_main ; ipcalc $IP_main ; ipcount $IP_main - $IP_subnet ; fping $IP_main $IP_subnet ; ipfetch $IP_main ; whois $IP_main
    echo "調査が完了しました"
    echo "終了します"

elif [ $y_or_n = N ] ; then
    ##IP入力/確認用出力
    echo "調査対象のIPアドレスを入力してください"
    read IP_main
    echo "調査対象IPアドレス: $IP_main"
    
    echo "次に調査対象のサブネットを入力してください"
    read IP_subnet
    echo "調査対象サブネットIP: $IP_subnet"

    ##調査用コマンド実行

    nslookup $IP_main ; ipcalc $IP_main ; ipcount $IP_main - $IP_subnet ; fping $IP_main $IP_subnet ; ipfetch $IP_main ; whois $IP_main
    
    echo "調査が完了しました"
    echo "終了します"
else
    echo "選択肢が間違っています"
    echo "終了します"
fi