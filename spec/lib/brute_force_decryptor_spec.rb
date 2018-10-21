require 'logger'
require 'key_generator'
require 'brute_force_decryptor'
require 'pollard_rho_decryptor'
require 'rsa_encryptor'
require 'rsa_decryptor'

RSpec.describe BruteForceDecryptor do
  context '#decrypt' do
    context 'when public key has 2**7 key size' do
      it 'decrypt message' do
        public_key, _private_key = KeyGenerator.generate_key(2**7, 2**8)
        message = 'Olá mundo'
        enc_message = RsaEncryptor.new(public_key).encrypt(message)
        private_key = BruteForceDecryptor.new(public_key).decrypt
        dec_message = RsaDecryptor.new(private_key).decrypt(enc_message)
        expect(message).to eq(dec_message)
      end
    end

    context 'when public key has 2**8 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_8.log')
        logger_pollard = create_logger('pollard_rho_8.log')
        for i in 1..25 do
          run_decrypt(2**8, 2**9, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**9 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_9.log')
        logger_pollard = create_logger('pollard_rho_9.log')
        for i in 1..25 do
          run_decrypt(2**9, 2**10, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**10 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_10.log')
        logger_pollard = create_logger('pollard_rho_10.log')
        for i in 1..25 do
          run_decrypt(2**10, 2**11, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**11 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_11.log')
        logger_pollard = create_logger('pollard_rho_11.log')
        for i in 1..25 do
          run_decrypt(2**11, 2**12, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**12 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_12.log')
        logger_pollard = create_logger('pollard_rho_12.log')
        for i in 1..25 do
          run_decrypt(2**12, 2**13, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**13 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_13.log')
        logger_pollard = create_logger('pollard_rho_13.log')
        for i in 1..5 do
          run_decrypt(2**13, 2**14, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**14 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_14.log')
        logger_pollard = create_logger('pollard_rho_14.log')
        for i in 1..5 do
          run_decrypt(2**14, 2**15, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**15 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_15.log')
        logger_pollard = create_logger('pollard_rho_15.log')
        for i in 1..5 do
          run_decrypt(2**15, 2**16, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**16 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_16.log')
        logger_pollard = create_logger('pollard_rho_16.log')
        for i in 1..5 do
          run_decrypt(2**16, 2**17, logger_brute, logger_pollard)
        end
      end
    end

    def run_decrypt(min, max, logger_brute, logger_pollard)
      public_key, private_key = KeyGenerator.generate_key(min, max)
      expect(decrypt_brute(logger_brute, public_key)).to eq(private_key)
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
