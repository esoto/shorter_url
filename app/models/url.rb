class Url < ApplicationRecord
  after_create :clean_urls

  def clean_urls
    shorter_ulr = bijective_encode(id)
    sanitize_long_url = long_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.update(long_url: "http://#{sanitize_long_url}", short_url: "http://localhost:3000/s/#{shorter_ulr}")
  end

  private

  ALPHABET =
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

  def bijective_encode(i)
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def self.bijective_decode(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
end
