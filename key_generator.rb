class KeyGenerator
  def self.generate_example_key
    p = 11
    q = 13
    e = 17
    n = p * q
    d = 353
    [[e, n], [d, n]]
  end

  def self.generate_key
    p = random_prime(except: nil)
    q = random_prime(except: p)
    phi_pq = (p - 1) * (q - 1)
    e = determine_e(phi_pq)
    n = p * q
    d = determine_d(e, phi_pq)
    [[e, n], [d, n]]
  end

  private

  PRIME_MIN = 128
  PRIME_MAX = 256

  def self.random_prime(except: nil)
    n = PRIME_MIN + Random.rand(PRIME_MAX - PRIME_MIN)
    while true
      while n < PRIME_MAX
        n = n + 1
        next if n.even?
        next if !except.nil? && except == n
        return n if prime?(n)
      end
      n = PRIME_MIN
    end
  end

  def self.prime?(n)
    return false if n <= 1 || n == 4
    return true if n <= 3
    k = 25
    while k > 0
      a = 2 + Random.rand(n - 4)
      return false unless ((a ** (n - 1)) % n) == 1
      k = k - 1
    end
    true
  end

  def self.determine_e(phi_pq)
    e = 3 + Random.rand(phi_pq - 3)
    while true
      while e < phi_pq
        e = e + 1
        return e if gcd(e, phi_pq) == 1
      end
      e = 3
    end
  end

  def self.determine_d(e, phi_pq)
    d = extended_gcd(e, phi_pq)[1]
    if d < 0
      # Busca valor positivo congruente a d % phi_pq
      t = 1
      while t % phi_pq != d % phi_pq
        t = t + 1
      end
      d = t
    end
    d
  end

  # Euclidean algorithm

  def self.gcd(a, b)
    while b > 0
      t = b
      b = a % b
      a = t
    end
    a
  end

  # Extended Euclidean algorithm

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
