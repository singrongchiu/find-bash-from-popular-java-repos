import requests
import json
import subprocess

q = "q=language:java&sort=stars&order=desc&per_page=100&page=1&stars%3A>6000"
url = "https://api.github.com/search/repositories?" + q

print(url)

r = requests.get(url)
response = json.loads(r.text) 
urlname_lst = []
urlname_lst = [(e['ssh_url'], e['name'], e['html_url'], e['stargazers_count']) for e in response['items']]

# subprocess.run(["bash", "./find_bash.sh", "%s" % (urlname_lst[0][0]), "%s" % (urlname_lst[0][1]),
#                 "%s" % (urlname_lst[0][2]), "%s" % (urlname_lst[0][3]), "output.txt"])

for tupleUrl in urlname_lst:
    subprocess.run(["bash", "./find_bash.sh", "%s" % (tupleUrl[0]), "%s" % (tupleUrl[1]),
                "%s" % (tupleUrl[2]), "%s" % (tupleUrl[3]), "output.txt"])
