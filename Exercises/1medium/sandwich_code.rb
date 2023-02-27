class TextAnalyzer
  def process
    my_file = File.open("text_analyzer.txt")
    yield(my_file.read)
    my_file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs"}
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }
# p my_file