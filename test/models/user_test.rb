require 'test_helper'

# user model tests
class UserTest < ActiveSupport::TestCase
  test 'should not save user without a name' do
    user = User.new(phone: '1199999999', email: 'john@test.com', cpf: '03293178901')
    assert_not user.save, 'Salvou o usuário sem um nome'
  end

  test 'should not save user without an email' do
    user = User.new(name: 'John Smith', phone: '1199999999', cpf: '03293178901')
    assert_not user.save, 'Salvou o usuário sem um email'
  end

  test 'should not save user without a phone' do
    user = User.new(name: 'John Smith', email: 'john@test.com', cpf: '03293178901')
    assert_not user.save, 'Salvou o usuário sem um telefone'
  end

  test 'should not save user without a cpf' do
    user = User.new(name: 'John Smith', email: 'john@test.com', phone: '1199999999')
    assert_not user.save, 'Salvou o usuário sem um cpf'
  end

  test 'should not save user with invalid name' do
    user = User.new(name: 'Jo', email: 'john@test.com', phone: '1199999999', cpf: '03293178901')
    assert_not user.save, 'Salvou o com um nome inválido'
  end

  test 'should not save user with invalid email' do
    user = User.new(name: 'John Smith', email: 'john.test.com', phone: '1199999999', cpf: '03293178901')
    assert_not user.save, 'Salvou o com um email inválido'
  end

  test 'should not save user with invalid phone' do
    user = User.new(name: 'John Smith', email: 'john@test.com', phone: '99999999', cpf: '03293178901')
    assert_not user.save, 'Salvou o com um telefone inválido'
  end

  test 'should not save user with invalid cpf' do
    user = User.new(name: 'John Smith', email: 'john@test.com', phone: '1199999999', cpf: '11111111111')
    assert_not user.save, 'Salvou o com um cpf inválido'
  end

  test 'should not save user with the same cpf' do
    User.create(name: 'John Smith', email: 'john@test.com', phone: '1199999999', cpf: '03293178901')
    user = User.new(name: 'Jean Doe', email: 'jean@test.com', phone: '1155555555', cpf: '03293178901')
    assert_not user.save, 'Salvou usuário com CPF já cadastrado'
  end
end
