#!/bin/bash


rootpwd="xxxxxxx"

iplist=("192.168.1.114" "192.168.1.115" \
        "192.168.1.119" "192.168.1.120" \
        "192.168.1.121" "192.168.1.122" \
        "192.168.1.123" "192.168.1.124" \
        "192.168.1.125")

users=("xxxx" "yyyy" "zzzz")

for ip in ${iplist[@]} ; do

    for user in ${users[@]} ; do
        echo "------------"
expect << EOF
    spawn ssh  root@${ip} "adduser ${user};echo ${user}123 |passwd ${user} --stdin"
    #spawn ssh root@${ip} "sed -i '/^${user} ALL=/d' /etc/sudoers;sed -i '/^root/a${user} ALL=\(ALL\) ALL' /etc/sudoers"
    expect {
        "(yes/no)*" { send "yes\n"; exp_continue }
        "*assword:*" { send "${rootpwd}\n";}
    }
    expect eof
EOF

   done
done
