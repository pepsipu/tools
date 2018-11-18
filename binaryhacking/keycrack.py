import random
import sys
import time

def check_key(key):
	char_sum = 0
	for c in key:
		char_sum += ord(c)
	return char_sum

key = ""
for x in "<<<keycrack>>>\n":
	print(x, end="")
	sys.stdout.flush()
	time.sleep(.08)

for x in "made by sammy hajhamid":
	print(x, end="")
	sys.stdout.flush()
	time.sleep(.05)
print("\r")
print("Input the hex value of the program you are cracking.")
hexvalue = int(input())

while True:
	key += random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_")
	s = check_key(key)
	if s > hexvalue:
		key = ""
	elif s == hexvalue:
		print("Key Found: ", key)
