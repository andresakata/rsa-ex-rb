require 'logger'
require 'key_generator'

RSpec.describe KeyGenerator do
  describe '#generate_key' do
    context 'when prime min and max values are 2**8 and 2**9' do
      it 'generates key' do
        logger = create_logger('key_8.log')
        for i in 1..20 do
          generate_key(logger, 2**8, 2**9)
        end
      end
    end

    context 'when prime min and max values are 2**16 and 2**17' do
      it 'generates key' do
        logger = create_logger('key_16.log')
        for i in 1..20 do
          generate_key(logger, 2**16, 2**17)
        end
      end
    end

    context 'when prime min and max values are 2**32 and 2**33' do
      it 'generates key' do
        logger = create_logger('key_32.log')
        for i in 1..20 do
          generate_key(logger, 2**32, 2**33)
        end
      end
    end

    context 'when prime min and max values are 2**48 and 2**49' do
      it 'generates key' do
        logger = create_logger('key_48.log')
        for i in 1..20 do
          generate_key(logger, 2**48, 2**49)
        end
      end
    end

    context 'when prime min and max values are 2*64 and 2**65' do
      it 'generates key' do
        logger = create_logger('key_64.log')
        for i in 1..20 do
          generate_key(logger, 2**64, 2**65)
        end
      end
    end

    context 'when prime min and max values are 2*128 and 2**129' do
      it 'generates key' do
        logger = create_logger('key_128.log')
        for i in 1..20 do
          generate_key(logger, 2**128, 2**129)
        end
      end
    end

    context 'when prime min and max values are 2*256 and 2**257' do
      it 'generates key' do
        logger = create_logger('key_256.log')
        for i in 1..20 do
          generate_key(logger, 2**256, 2**257)
        end
      end
    end

    context 'when prime min and max values are 2*512 and 2**513' do
      it 'generates key' do
        logger = create_logger('key_512.log')
        for i in 1..20 do
          generate_key(logger, 2**512, 2**513)
        end
      end
    end

    def generate_key(logger, min, max)
      run_and_log(logger) { KeyGenerator.generate_key(min, max) }
    end
  end
end
