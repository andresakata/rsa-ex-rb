require 'logger'
require 'key_generator'
require 'brute_force_decryptor'
require 'pollard_rho_decryptor'
require 'rsa_encryptor'
require 'rsa_decryptor'

RSpec.describe BruteForceDecryptor do
  # It is testing both BruteForceDecryptor and
  # PollardRhoDecryptor for benchmarking reasons
  describe '#decrypt' do
    context 'when public key has 2**8 key size' do
      it 'decrypt message' do
        public_key, _private_key = KeyGenerator.generate_key(2**8, 2**9)
        message = 'Olá mundo'
        enc_message = RsaEncryptor.new(public_key).encrypt(message)
        private_key = BruteForceDecryptor.new(public_key).decrypt
        dec_message = RsaDecryptor.new(private_key).decrypt(enc_message)
        expect(message).to eq(dec_message)
      end
    end

    context 'when public key has 2**16 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_16.log')
        logger_pollard = create_logger('pollard_rho_16.log')
        for i in 1..25 do
          run_decrypt(2**16, 2**17, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**24 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_24.log')
        logger_pollard = create_logger('pollard_rho_24.log')
        for i in 1..25 do
          run_decrypt(2**24, 2**25, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**32 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_32.log')
        logger_pollard = create_logger('pollard_rho_32.log')
        for i in 1..10 do
          run_decrypt(2**32, 2**33, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**40 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_40.log')
        logger_pollard = create_logger('pollard_rho_40.log')
        for i in 1..10 do
          run_decrypt(2**40, 2**41, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**48 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_48.log')
        logger_pollard = create_logger('pollard_rho_48.log')
        for i in 1..10 do
          run_decrypt(2**48, 2**49, logger_brute, logger_pollard)
        end
      end
    end

    def run_decrypt(min, max, logger_brute, logger_pollard)
      public_key, private_key = KeyGenerator.generate_key(min, max)
      if 2**32 > min
        p "Quebrando chave Brute Force #{min} #{max}"
        expect(decrypt_brute(logger_brute, public_key)).to eq(private_key)
      end
      p "Quebrando chave Pollard #{min} #{max}"
      expect(decrypt_pollard(logger_pollard, public_key)).to eq(private_key)
    end

    def decrypt_brute(logger_brute, public_key)
      run_and_log(logger_brute) { BruteForceDecryptor.new(public_key).decrypt }
    end

    def decrypt_pollard(logger_pollard, public_key)
      run_and_log(logger_pollard) { PollardRhoDecryptor.new(public_key).decrypt }
    end
  end
end
