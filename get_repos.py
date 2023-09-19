import requests
import json
import subprocess

q = "q=language:java&sort=stars&order=desc&per_page=100"
url = "https://api.github.com/search/repositories?" + q

print(url)

r = requests.get(url)
response = json.loads(r.text) 
urlname_lst = []
urlname_lst = [(e['ssh_url'], e['name']) for e in response['items']]

for tupleUrl in urlname_lst:
    subprocess.Popen(["bash", "./find_bash.sh", "%s" % (tupleUrl[0]), "%s" % (tupleUrl[1]), "output.txt"])
