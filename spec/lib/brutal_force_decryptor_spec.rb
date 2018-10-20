require 'logger'
require 'key_generator'
require 'brutal_force_decryptor'
require 'rsa_encryptor'
require 'rsa_decryptor'

RSpec.describe BrutalForceDecryptor do
  context '#decrypt' do
    context 'when public key has 2**7 key size' do
      it 'decrypt message' do
        public_key, _private_key = KeyGenerator.generate_key(2**7, 2**8)
        message = 'Olá mundo'
        enc_message = RsaEncryptor.new(public_key).encrypt(message)
        private_key = BrutalForceDecryptor.new(public_key).decrypt
        dec_message = RsaDecryptor.new(private_key).decrypt(enc_message)
        expect(message).to eq(dec_message)
      end
    end

    context 'when public key has 2**8 key size' do
      it 'decrypt message' do
        logger = create_logger('brutal_force_8.log')
        for i in 1..25 do
          run_decrypt(2**8, 2**9, logger)
        end
      end
    end

    context 'when public key has 2**9 key size' do
      it 'decrypt message' do
        logger = create_logger('brutal_force_9.log')
        for i in 1..25 do
          run_decrypt(2**9, 2**10, logger)
        end
      end
    end

    context 'when public key has 2**10 key size' do
      it 'decrypt message' do
        logger = create_logger('brutal_force_10.log')
        for i in 1..25 do
          run_decrypt(2**10, 2**11, logger)
        end
      end
    end

    context 'when public key has 2**11 key size' do
      it 'decrypt message' do
        logger = create_logger('brutal_force_11.log')
        for i in 1..25 do
          run_decrypt(2**11, 2**12, logger)
        end
      end
    end

    context 'when public key has 2**12 key size' do
      it 'decrypt message' do
        logger = create_logger('brutal_force_12.log')
        for i in 1..25 do
          run_decrypt(2**12, 2**13, logger)
        end
      end
    end

    context 'when public key has 2**13 key size' do
      it 'decrypt message' do
        logger = create_logger('brutal_force_13.log')
        for i in 1..25 do
          run_decrypt(2**13, 2**14, logger)
        end
      end
    end

    #context 'when public key has 2**14 key size' do
    #  it 'decrypt message' do
    #    logger = create_logger('brutal_force_14.log')
    #    for i in 1..25 do
    #      run_decrypt(2**14, 2**15, logger)
    #    end
    #  end
    #end

    #context 'when public key has 2**15 key size' do
    #  it 'decrypt message' do
    #    logger = create_logger('brutal_force_15.log')
    #    for i in 1..25 do
    #      run_decrypt(2**15, 2**16, logger)
    #    end
    #  end
    #end

    def run_decrypt(min, max, logger)
      public_key, private_key = KeyGenerator.generate_key(min, max)
      new_private_key = decrypt(logger, public_key)
      expect(private_key).to eq(new_private_key)
    end

    def decrypt(logger, public_key)
      run_and_log(logger) { BrutalForceDecryptor.new(public_key).decrypt }
    end
  end
end
