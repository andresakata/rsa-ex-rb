require 'logger'
require 'key_generator'

RSpec.describe KeyGenerator do
  describe '#generate_key' do
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
        for i in 1..25 do
          generate_key(logger, 2**13, 2**14)
        end
      end
    end

    def create_logger(file_name)
      Logger.new(
        File.open(
          'log/' + file_name,
          File::WRONLY | File::APPEND | File::CREAT
        )
      )
    end

    def generate_key(logger, min, max)
      GC.start
      init_time = Time.now
      KeyGenerator.generate_key(min, max)
      end_time = Time.now
      logger.info(end_time - init_time)
    end
  end
end
