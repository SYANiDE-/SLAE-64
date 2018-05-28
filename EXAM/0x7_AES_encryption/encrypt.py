#!/usr/bin/env python2
import getpass, sys
from Crypto import Random
from Crypto.Cipher import AES
from hashlib import sha256


def encrypt(message):
	temp = []
	temp2 = []
	def passw_hash_to_AES_key():
		H = sha256(getpass.getpass()).hexdigest()
		this=[]
		that=[]
		for x in range(0, len(H), 2):
			this.append("0x%s%s" % (H[x], H[x+1]))
		that = [chr(int(x, 16)) for x in this]
		return "".join(that)
	iv = Random.new().read(AES.block_size)
	iv_array = [ x.encode('hex') for x in "%s" % iv]
	AKEY = passw_hash_to_AES_key()
    	obj = AES.new(AKEY, AES.MODE_CFB, iv)
    	temp = [chr(x) for x in bytearray(obj.encrypt(message))]
	[temp2.append(chr(int(x, 16))) for x in iv_array]
	[temp2.append(x) for x in temp]
	return temp2


def Argv_Bytestr(param):
	this=param.replace("\\x", "").replace("0x", "").replace(",","").replace(" ","")
	bytes = []
	for i in range(0, len(this), 2):
		bytes.append(chr(int(this[i:i+2],16)))
	return ''.join(bytes)


def printer(hexstr):
	hexstr = hexstr.encode('hex')
	return ''.join(["\\x%s%s" % (hexstr[x], hexstr[x+1]) for x in range(0, len(hexstr), 2)])

	
def main():
	MSG = Argv_Bytestr(sys.argv[1])
	test = ''.join(encrypt(MSG))
	print("\nDecrypted:\n%s" % printer(MSG))
	print("\nEncrypted:\n%s" % printer(test))


if __name__=="__main__":
	main()
