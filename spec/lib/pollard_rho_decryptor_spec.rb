require 'logger'
require 'key_generator'
require 'pollard_rho_decryptor'
require 'rsa_encryptor'
require 'rsa_decryptor'

RSpec.describe PollardRhoDecryptor do
  context '#decrypt' do
    context 'when public key has 2**7 key size' do
      it 'decrypt message' do
        public_key, _private_key = KeyGenerator.generate_key(2**7, 2**8)
        message = 'Olá mundo'
        enc_message = RsaEncryptor.new(public_key).encrypt(message)
        private_key = PollardRhoDecryptor.new(public_key).decrypt
        dec_message = RsaDecryptor.new(private_key).decrypt(enc_message)
        expect(message).to eq(dec_message)
      end
    end
  end
end
