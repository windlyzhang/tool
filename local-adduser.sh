#!/bin/bash

rootpwd="xxxxxx"

users=("xiaoming" "xiaowang" "xiaobai")


for user in ${users[@]} ; do
    echo "------------"

expect << EOF
    #spawn su root -c "adduser ${user};echo ${user}123 |passwd ${user} --stdin"
    spawn su root -c "sed -i '/^${user} ALL=/d' /etc/sudoers;sed -i '/^root/a${user} ALL=\(ALL\) ALL' /etc/sudoers"
    expect {
        "*assword:*" { send "${rootpwd}\n";}
    }
    expect eof
EOF

done
