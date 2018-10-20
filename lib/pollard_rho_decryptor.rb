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

  def factorize(n)
    return n if n == 1
    return 2 if n % 2 == 0
    x = 2 + Random.rand(n - 2)
    y = x
    c = 1 + Random.rand(n - 1)
    d = 1
    while d == 1
      x = ((x**2 % n) + c + n) % n
      y = ((y**2 % n) + c + n) % n
      y = ((y**2 % n) + c + n) % n
      d = Utils.gcd((x - y).abs, n)
      return factorize(n) if d == n
    end
    d
  end
end
