#!/usr/bin/env python2
import getpass, sys
from Crypto.Cipher import AES
from hashlib import sha256
from ctypes import c_uint64


def decrypt(message):
	def passw_hash_to_AES_key():
		H = sha256(getpass.getpass()).hexdigest()
		this=[]
		that=[]
		for x in range(0, len(H), 2):
			this.append("0x%s%s" % (H[x], H[x+1]))
		that = [chr(int(x, 16)) for x in this]
		return "".join(that)
	iv = message[:AES.block_size]
	message = message[AES.block_size:]
	AKEY = passw_hash_to_AES_key()
    	obj = AES.new(AKEY, AES.MODE_CFB, iv)
    	temp = [chr(x) for x in bytearray(obj.decrypt(message))]
	return temp


def Argv_Bytestr(param):
	this=param.replace("\\x", "").replace("0x", "").replace(",","").replace(" ","")
	bytes = []
	for i in range(0, len(this), 2):
		bytes.append(chr(int(this[i:i+2],16)))
	return ''.join(bytes)


def printer(hexstr):
	hexstr = hexstr.encode('hex')
	return ''.join(["\\x%s%s" % (hexstr[x], hexstr[x+1]) for x in range(0, len(hexstr), 2)])

def exec_sc_hook(sc):
	import ctypes, mmap
	mm = mmap.mmap(
		-1, 
		len(sc), 
		flags=mmap.MAP_SHARED | mmap.MAP_ANONYMOUS, 
		prot=mmap.PROT_WRITE | mmap.PROT_READ | mmap.PROT_EXEC
	)
	mm.write(sc)
	restype = ctypes.c_int64
	argtypes = tuple()
	sc_buf = ctypes.c_int.from_buffer(mm)
	sc_fnptr = ctypes.CFUNCTYPE(restype, *argtypes)(ctypes.addressof(sc_buf))
	sc_fnptr()

	
def main():
	MSG = Argv_Bytestr(sys.argv[1])
	test = "".join(decrypt(MSG))
	print("\nEncrypted:\n%s" % printer(MSG))
	print("\nDecrypted:\n%s" % printer(test))
	exec_sc_hook(test)
	


if __name__=="__main__":
	main()


