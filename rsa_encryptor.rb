class RsaEncryptor
  def initialize(public_key)
    @public_key = public_key
  end

  def encrypt(message)
    encrypted_message = []
    message.bytes.each do |m|
      encrypted_message << encrypt_num(m)
    end
    encrypted_message
  end

  def encrypt_num(num)
    (num ** @public_key[0]) % @public_key[1]
  end
end
