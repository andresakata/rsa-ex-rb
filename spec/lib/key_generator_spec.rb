require 'logger'
require 'key_generator'

RSpec.describe KeyGenerator do
  describe '#generate_key' do
    context 'when prime min and max values are 2**8 and 2**9' do
      it 'generates key' do
        logger = create_logger('key_8.log')
        for i in 1..25 do
          generate_key(logger, 2**8, 2**9)
        end
      end
    end

    context 'when prime min and max values are 2**9 and 2**10' do
      it 'generates key' do
        logger = create_logger('key_9.log')
        for i in 1..25 do
          generate_key(logger, 2**9, 2**10)
        end
      end
    end

    context 'when prime min and max values are 2**10 and 2**11' do
      it 'generates key' do
        logger = create_logger('key_10.log')
        for i in 1..25 do
          generate_key(logger, 2**10, 2**11)
        end
      end
    end

    context 'when prime min and max values are 2**11 and 2**12' do
      it 'generates key' do
        logger = create_logger('key_11.log')
        for i in 1..25 do
          generate_key(logger, 2**11, 2**12)
        end
      end
    end

    context 'when prime min and max values are 2*12 and 2**13' do
      it 'generates key' do
        logger = create_logger('key_12.log')
        for i in 1..25 do
          generate_key(logger, 2**12, 2**13)
        end
      end
    end

    context 'when prime min and max values are 2*13 and 2**14' do
      it 'generates key' do
        logger = create_logger('key_13.log')
        for i in 1..2 do
          generate_key(logger, 2**13, 2**14)
        end
      end
    end

    context 'when prime min and max values are 2*14 and 2**15' do
      it 'generates key' do
        logger = create_logger('key_14.log')
        for i in 1..2 do
          generate_key(logger, 2**14, 2**15)
        end
      end
    end

    context 'when prime min and max values are 2*15 and 2**16' do
      it 'generates key' do
        logger = create_logger('key_15.log')
        for i in 1..2 do
          generate_key(logger, 2**15, 2**16)
        end
      end
    end

    def generate_key(logger, min, max)
      run_and_log(logger) { KeyGenerator.generate_key(min, max) }
    end
  end
end
