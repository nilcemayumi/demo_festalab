class User < ApplicationRecord
  require 'cpf_cnpj'

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :email, :phone, :cpf, presence: true
  validates_format_of :email, with: EMAIL_REGEX
  validates :name, length: { minimum: 3, message: 'Nome inválido' }
  validates :cpf, uniqueness: { message: 'CPF já cadastrado' }
  validates :phone, length: { in: 10..11, message: 'Telefone inválido. Necessário incluir o DDD' }
  validate :validate_cpf

  def validate_cpf
    errors.add(:cpf, 'CPF inválido') unless CPF.valid?(cpf)
  end
end
