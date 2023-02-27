require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup 
    @transaction = Transaction.new(25)
  end

  def test_prompt_for_payment
    input = StringIO.new("45\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal input.string.gsub("\n", '').to_i, @transaction.amount_paid
  end
end