# frozen_string_literal: true

require_relative 'utils'

class BrutalForceDecryptor
  def self.decrypt(public_key)
    should_break = false
    for i in 0..KeyGenerator::PRIME_MAX do
      next unless i.odd? && Utils.prime?(i)
      for j in 0..KeyGenerator::PRIME_MAX do
        next unless i.odd? && Utils.prime?(j)
        if i * j == public_key[1]
          should_break = true
          break
        end
      end
      break if should_break
    end
    [
      KeyGenerator.determine_d(public_key[0], (i - 1) * (j - 1)),
      public_key[1]
    ]
  end
end
