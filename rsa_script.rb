require_relative 'rsa_encryptor'
require_relative 'rsa_decryptor'
require_relative 'key_generator'

public_key, private_key = KeyGenerator.generate_key
c = RsaEncryptor.new(public_key).encrypt(File.read('file'))
p c
m = RsaDecryptor.new(private_key).decrypt(c)
p m