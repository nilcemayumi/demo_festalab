class User < ApplicationRecord
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :email, :phone, :cpf, presence: true
  validates_format_of :email, with: EMAIL_REGEX
end
