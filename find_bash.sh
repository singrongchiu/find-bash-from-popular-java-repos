#! /bin/bash
# ${1} is ssh link to repo, ${2} is repo name, 
# ${3} is http link to repo, ${4} is star count, ${5} is output text file

# output: http_link,SHA,stars,permanent github URL

git clone ${1}

# x=`find ./${2} -name "*.sh"`
x=`find ./${2} -name "*.sh"`
echo "find .sh files:" 
echo $x

cd ${2}
sha=`git log --pretty=format:'%h' -n 1`
sha_long=`git log --pretty=format:'%H' -n 1`
cd ..

shfiles=$(echo $x | tr " " "\n")

full_title_length=${#2}+2

for addr in $shfiles
do
    filepath="${addr:${full_title_length}:}"
    echo "${3},${sha},${4},`${3}+${sha_long}+${filepath}`" >> ${5}
done

rm -rf ${2}

echo "ended"
