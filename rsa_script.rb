# frozen_string_literal: true

require_relative 'lib/rsa_encryptor'
require_relative 'lib/rsa_decryptor'
require_relative 'lib/key_generator'
require_relative 'lib/brutal_force_decryptor'
require_relative 'lib/pollard_rho_decryptor'

public_key, private_key = KeyGenerator.generate_key(2**7, 2**8)

file = File.read('file')
puts file

puts '-- Encrypting using public key'
c = RsaEncryptor.new(public_key).encrypt(file)
p c

puts '-- Decrypting using private key'
puts RsaDecryptor.new(private_key).decrypt(c)

puts '-- Brutal force'
puts RsaDecryptor.new(BrutalForceDecryptor.new(public_key).decrypt).decrypt(c)

puts '-- Pollard rho'
puts RsaDecryptor.new(PollardRhoDecryptor.new(public_key).decrypt).decrypt(c)