class Utils
  def self.modpow(base, exponent, modulus)
    return 0 if modulus == 1
    result = 1
    base = base % modulus
    while exponent > 0
      if exponent % 2 == 1
        result = (result * base) % modulus
      end
      exponent = exponent >> 1
      base = (base * base) % modulus
    end
    result
  end

  # Probabilistic verification for prime

  def self.prime?(n)
    return false if n <= 1 || n == 4
    return true if n <= 3
    k = 25
    while k.positive?
      a = 2 + Random.rand(n - 4)
      return false unless modpow(a, n - 1, n) == 1
      k -= 1
    end
    true
  end

  # Euclidean algorithm

  def self.gcd(a, b)
    while b.positive?
      t = b
      b = a % b
      a = t
    end
    a
  end

  # Extended euclidean algorithm

  def self.extended_gcd(a, b)
    x = 0
    y = 1

    u = 1
    v = 0

    while a != 0
      q = b / a
      r = b % a

      m = x - u * q
      n = y - v * q

      b = a
      a = r

      x = u
      y = v

      u = m
      v = n
    end

    gdc_value = b

    [gdc_value, x, y]
  end
end
