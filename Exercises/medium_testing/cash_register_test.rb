require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup 
    @register = CashRegister.new(25)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 50

    start_amount = @register.total_money
    @register.accept_money(@transaction)
    end_amount = @register.total_money

    assert_equal start_amount + 50, end_amount
  end

  def test_change
    @transaction.amount_paid = 55

    assert_equal 5, @register.change(@transaction)
  end

  def test_give_receipt
    cost = 25
    transaction = Transaction.new(cost)

    assert_output("You've paid $#{cost}.\n") {@register.give_receipt(transaction)}
  end
end 