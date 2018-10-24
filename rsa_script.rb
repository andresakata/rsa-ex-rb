# frozen_string_literal: true

require_relative 'lib/rsa_encryptor'
require_relative 'lib/rsa_decryptor'
require_relative 'lib/key_generator'
require_relative 'lib/brute_force_decryptor'
require_relative 'lib/pollard_rho_decryptor'

public_key, private_key = KeyGenerator.generate_key(2**24, 2**25)

file = File.read('file')
puts file

puts '-- Encrypting using public key'
c = RsaEncryptor.new(public_key).encrypt(file)
p c

puts '-- Decrypting using private key'
puts RsaDecryptor.new(private_key).decrypt(c)

puts '-- Pollard Rho'
puts RsaDecryptor.new(PollardRhoDecryptor.new(public_key).decrypt).decrypt(c)

puts '-- Brute Force'
puts RsaDecryptor.new(BruteForceDecryptor.new(public_key).decrypt).decrypt(c)