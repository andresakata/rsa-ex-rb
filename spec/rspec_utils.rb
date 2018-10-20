module RspecUtils
  def create_logger(file_name)
    Logger.new(
      File.open(
        'log/' + file_name,
        File::WRONLY | File::APPEND | File::CREAT
      )
    )
  end

  def run_and_log(logger)
    init_time = Time.now
    response = yield
    end_time = Time.now
    logger.info("%.10f" % (end_time - init_time))
    response
  end
end