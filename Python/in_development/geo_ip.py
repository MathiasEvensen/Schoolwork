from ip2geotools.databases.noncommercial import DbIpCity
import urllib.request, re


dataip = re.search('"([0-9.]*)"', urllib.request.urlopen("http://ip.jsontest.com/").read().decode('utf-8')).group(1)
response = DbIpCity.get(dataip, api_key='free')

print(response.to_csv(', '))

