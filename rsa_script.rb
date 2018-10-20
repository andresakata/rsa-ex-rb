# frozen_string_literal: true

require_relative 'lib/rsa_encryptor'
require_relative 'lib/rsa_decryptor'
require_relative 'lib/key_generator'
require_relative 'lib/brutal_force_decryptor'
require_relative 'lib/pollard_rho_decryptor'

public_key, private_key = KeyGenerator.generate_key

file = File.read('file')
p file

p '-- Encrypting using public key'
c = RsaEncryptor.new(public_key).encrypt(file)
p c

p '-- Decrypting using private key'
m = RsaDecryptor.new(private_key).decrypt(c)
p m

brutal_force_decryptor = BrutalForceDecryptor.new(public_key)

p '-- Brutal force (1)'
forced_private_key = brutal_force_decryptor.decrypt_1
forced_m = RsaDecryptor.new(forced_private_key).decrypt(c)
p forced_m

p '-- Brutal force (2)'
forced_private_key_2 = brutal_force_decryptor.decrypt_2
forced_m_2 = RsaDecryptor.new(forced_private_key_2).decrypt(c)
p forced_m_2

p '-- Pollard rho'
pollard_private_key = PollardRhoDecryptor.new(public_key).decrypt
pollard_m = RsaDecryptor.new(pollard_private_key).decrypt(c)
p pollard_m
