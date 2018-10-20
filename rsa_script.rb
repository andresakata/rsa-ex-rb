# frozen_string_literal: true

require_relative 'lib/rsa_encryptor'
require_relative 'lib/rsa_decryptor'
require_relative 'lib/key_generator'
require_relative 'lib/brutal_force_decryptor'
require_relative 'lib/pollard_rho_decryptor'

public_key, private_key = KeyGenerator.generate_key

p '-- Encrypting using public key'
c = RsaEncryptor.new(public_key).encrypt(File.read('file'))
p c

p '-- Decrypting using private key'
m = RsaDecryptor.new(private_key).decrypt(c)
p m

p '-- Brutal force'
forced_private_key = BrutalForceDecryptor.decrypt(public_key)
forced_m = RsaDecryptor.new(forced_private_key).decrypt(c)
p forced_m

p '-- Pollard rho'
pollard_private_key = PollardRhoDecryptor.new(public_key).decrypt
pollard_m = RsaDecryptor.new(pollard_private_key).decrypt(c)
p pollard_m
