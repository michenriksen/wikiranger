module Wikiranger
  module Util
    HUMAN_PREFIXES = %w(TB GB MB KB B).freeze

    def self.expand_cidr(cidr)
      IPAddr.new(cidr).to_range.map(&:to_s)[1..-2]
    end

    def self.number_to_human_size(number)
      s = number.to_f
      i = HUMAN_PREFIXES.length - 1
      while s > 512 && i > 0
        i -= 1
        s /= 1024
      end
      ((s > 9 || s.modulo(1) < 0.1 ? "%d" : "%.1f") % s) + HUMAN_PREFIXES[i]
    end
  end
end