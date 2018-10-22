# frozen_string_literal: true

class RsaDecryptor
  def initialize(private_key)
    @private_key = private_key
  end

  def decrypt(encrypted_message)
    message = []
    encrypted_message.each do |c|
      message << decrypt_num(c)
    end
    message.pack("C*").force_encoding('utf-8')
  end

  def decrypt_num(num)
    Utils.modpow(num, @private_key[0], @private_key[1])
  end
end
