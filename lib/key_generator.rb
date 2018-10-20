# frozen_string_literal: true

require_relative 'utils'

class KeyGenerator
  def self.generate_key
    p = random_prime(except: nil)
    q = random_prime(except: p)
    phi_pq = (p - 1) * (q - 1)
    e = determine_e(phi_pq)
    n = p * q
    d = determine_d(e, phi_pq)
    [[e, n], [d, n]]
  end

  PRIME_MIN = 128
  PRIME_MAX = 256

  def self.random_prime(except: nil)
    n = PRIME_MIN + Random.rand(PRIME_MAX - PRIME_MIN)
    loop do
      while n < PRIME_MAX
        n += 1
        next if n.even?
        next if !except.nil? && except == n
        return n if Utils.prime?(n)
      end
      n = PRIME_MIN
    end
  end

  def self.determine_e(phi_pq)
    e = 3 + Random.rand(phi_pq - 3)
    loop do
      while e < phi_pq
        e += 1
        return e if Utils.gcd(e, phi_pq) == 1
      end
      e = 3
    end
  end

  def self.determine_d(e, phi_pq)
    d = Utils.extended_gcd(e, phi_pq)[1]
    if d.negative?
      # Busca valor positivo congruente a d % phi_pq
      t = 1
      while t % phi_pq != d % phi_pq
        t += 1
      end
      d = t
    end
    d
  end
end
