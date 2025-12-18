#!/bin/bash
#Description:名单的格式是：
#1 曾小贤
#2 胡一菲
#3 关谷神奇
#4 唐悠悠
#5 陈美嘉
#6 吕子乔
line=`cat name.txt|wc -l`
num=`shuf -i 1-$line -n 1`#在名单内生成一个随机序号，每一行对应一个人
for (( i=3;i>=1;i-- ))
do
        echo "$(tput setaf 2)倒计时：$i$(tput sgr0)"
        sleep 1
done
echo "$(tput setaf 3)幸运儿：`awk -v num="$num" 'NR==num{print $2}' name.txt`$(tput sgr0)"
