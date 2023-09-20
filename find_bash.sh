#! /bin/bash
# ${1} is ssh link to repo, ${2} is repo name, 
# ${3} is http link to repo, ${4} is star count, ${5} is output text file

# output: http_link,SHA,stars,permanent github URL

git clone ${1}

# find sha values
cd ${2}
sha=`git log --pretty=format:'%h' -n 1`
sha_long=`git log --pretty=format:'%H' -n 1`
cd ..

# find .sh files in repo
x=`find ./${2} -name "*.sh"`
echo "find .sh files:" 
echo $x
# shfiles=$(echo $x | tr " " "\n")
shfiles=(${x// / })

full_title_length=$((${#2}+3))
echo ${full_title_length}

if (( ${#shfiles[@]} )); then
    for addr in ${shfiles[@]}
    do
        filepathvar=`echo "${addr:${full_title_length}}"`
        echo "${3},${sha},${4},${3}/blob/${sha_long}/${filepathvar}" >> ${5}
    done
else
    echo "${3},${sha},${4}," >> ${5}
    echo "this repo has no .sh files!!"
fi

rm -rf ${2}

echo "ended"
