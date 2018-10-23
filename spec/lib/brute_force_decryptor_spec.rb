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
        for i in 1..10 do
          run_decrypt(2**16, 2**17, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**20 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_20.log')
        logger_pollard = create_logger('pollard_rho_20.log')
        for i in 1..10 do
          run_decrypt(2**20, 2**21, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**24 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_24.log')
        logger_pollard = create_logger('pollard_rho_24.log')
        for i in 1..10 do
          run_decrypt(2**24, 2**25, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**26 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_26.log')
        logger_pollard = create_logger('pollard_rho_26.log')
        for i in 1..10 do
          run_decrypt(2**26, 2**27, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**28 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_28.log')
        logger_pollard = create_logger('pollard_rho_28.log')
        for i in 1..10 do
          run_decrypt(2**28, 2**29, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**30 key size' do
      it 'decrypt message' do
        logger_brute = create_logger('brute_force_30.log')
        logger_pollard = create_logger('pollard_rho_30.log')
        for i in 1..10 do
          run_decrypt(2**30, 2**31, logger_brute, logger_pollard)
        end
      end
    end

    context 'when public key has 2**32 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_32.log')
        for i in 1..10 do
          run_decrypt(2**32, 2**33, nil, logger_pollard)
        end
      end
    end

    context 'when public key has 2**34 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_34.log')
        for i in 1..10 do
          run_decrypt(2**34, 2**35, nil, logger_pollard)
        end
      end
    end

    context 'when public key has 2**36 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_36.log')
        for i in 1..10 do
          run_decrypt(2**36, 2**37, nil, logger_pollard)
        end
      end
    end

    context 'when public key has 2**38 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_38.log')
        for i in 1..10 do
          run_decrypt(2**38, 2**39, nil, logger_pollard)
        end
      end
    end

    context 'when public key has 2**40 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_40.log')
        for i in 1..10 do
          run_decrypt(2**40, 2**41, nil, logger_pollard)
        end
      end
    end

    context 'when public key has 2**42 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_42.log')
        for i in 1..5 do
          run_decrypt(2**42, 2**43, nil, logger_pollard)
        end
      end
    end

    context 'when public key has 2**44 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_44.log')
        for i in 1..5 do
          run_decrypt(2**44, 2**45, nil, logger_pollard)
        end
      end
    end

    context 'when public key has 2**46 key size' do
      it 'decrypt message' do
        logger_pollard = create_logger('pollard_rho_46.log')
        for i in 1..5 do
          run_decrypt(2**46, 2**47, nil, logger_pollard)
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
