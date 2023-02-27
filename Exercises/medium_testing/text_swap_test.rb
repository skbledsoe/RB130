require 'minitest/autorun'
require_relative 'text_swap'

class TextTest < Minitest::Test 
  def setup 
    @file = File.open('sample_text.txt', 'r')
    @text = Text.new(@file.read)
  end

  def test_swap
    actual_text = @text.swap('o', 'x')
    expected_text = <<~TEXT.chomp
    Lxrem ipsum dxlxr sit amet, cxnsectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse cxmmxdx sem arcu. Dxnec a nisi elit. Nullam eget nisi cxmmxdx, vxlutpat
    quam a, viverra mauris. Nunc viverra sed massa a cxndimentum. Suspendisse xrnare justx
    nulla, sit amet mxllis erxs sxllicitudin et. Etiam maximus mxlestie erxs, sit amet dictum
    dxlxr xrnare bibendum. Mxrbi ut massa nec lxrem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def test_word_count
    assert_equal 72, @text.word_count
  end

  def teardown
    @file.close
  end
end