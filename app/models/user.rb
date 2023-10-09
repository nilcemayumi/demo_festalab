class User < ApplicationRecord
  require 'cpf_cnpj'

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :email, :phone, :cpf, presence: true
  validates_format_of :email, with: EMAIL_REGEX
  validates :cpf, uniqueness: { message: 'CPF já cadastrado' }
  validate :validate_cpf

  def validate_cpf
    errors.add(:cpf, 'CPF inválido') unless CPF.valid?(cpf)
  end
end
