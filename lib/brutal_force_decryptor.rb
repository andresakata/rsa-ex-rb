# frozen_string_literal: true

require_relative 'utils'

class BrutalForceDecryptor
  def initialize(public_key)
    @public_key = public_key
  end

  def decrypt
    p = 0
    for i in 2..Integer.sqrt(@public_key[1])
      if @public_key[1] % i == 0
        p = i
        break
      end
    end
    q = @public_key[1] / p
    [
      KeyGenerator.determine_d(@public_key[0], (p - 1) * (q - 1)),
      @public_key[1]
    ]
  end
end
