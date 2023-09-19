#! /bin/bash
# ${1} is ssh clone link, ${2} is repo name, ${3} is output txt file name

echo ${1}

git clone ${1}

x=`find ./${2} -name "*.sh"`
echo "find .sh files:" 
echo $x

echo "${1} ${2}" >> ${3}
echo $x >> ${3}

rm -rf ${2}

echo "ended"
