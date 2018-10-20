# frozen_string_literal: true

require_relative 'utils'

class PollardRhoDecryptor
  def initialize(public_key)
    @public_key = public_key
  end

  def decrypt
    p = factorize(@public_key[1])
    q = @public_key[1] / p
    d = KeyGenerator.determine_d(@public_key[0], (p - 1) * (q - 1))
    [d, @public_key[1]]
  end

  private

  def factorize(number)
    x_fixed = 2
    cycle_size = 2
    x = 2
    factor = 1

    while factor == 1
      count = 1
      while count <= cycle_size && factor <= 1
        x = (x * x + 1) % number
        factor = Utils.gcd(x - x_fixed, number)
        count += 1
      end
      cycle_size *= 2
      x_fixed = x
    end

    factor
  end
end
