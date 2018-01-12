class Author < ApplicationRecord
  has_many :books
  before_create do |author|
    author.api_key = author.generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'MyHashCode')
      break token unless Author.exists?(api_key: token)
    end
  end
end
  