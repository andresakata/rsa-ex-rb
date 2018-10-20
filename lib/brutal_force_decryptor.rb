# frozen_string_literal: true

require_relative 'utils'

class BrutalForceDecryptor
  def initialize(public_key)
    @public_key = public_key
  end

  def decrypt_1
    should_break = false
    for i in 0..KeyGenerator::PRIME_MAX do
      next unless i.odd? && Utils.prime?(i)
      for j in 0..KeyGenerator::PRIME_MAX do
        next unless i.odd? && Utils.prime?(j)
        if i * j == @public_key[1]
          should_break = true
          break
        end
      end
      break if should_break
    end
    [
      KeyGenerator.determine_d(@public_key[0], (i - 1) * (j - 1)),
      @public_key[1]
    ]
  end

  def decrypt_2
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
