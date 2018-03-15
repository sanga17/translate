require_relative 'line_changes'
class TranslateToEnglish
  def initialize
    @input_file
    @out_file
    @new_file
    @folder_path
    @text_file
  end


  # def self.do_conversion
  #   Dir.foreach(FOLDER_PATH) do |filename|
  #     ext = File.extname(filename)
  #     next if filename == '.' || filename == '..'
  #     TranslateToEnglish.create_file(ext,filename)
  #     TranslateToEnglish.file_transfer(@text_file,@out_file)
  #     TranslateToEnglish.close_operation
  #   end
  #   puts "completed"
  # end

  def create_file(ext)
    @text_file = File.new(@input_file)
    @new_file = File.basename(@input_file)
    @out_file = File.new("#{@folder_path}/#{@new_file}", "w+")
  end

  def file_transfer(text_file,out_file)
    line_converted = ""
    text_file.each_line do |line|
      line_modifier = LineModifier.new(line)
      line_converted = line_modifier.line_operations
      out_file.puts (line_converted)
    end
  end

  def take_file_path
    puts "enter file:"
    @input_file = gets.chomp
    puts "enter file path to store resulting file"
    @folder_path = gets.chomp
    ext = File.extname(@input_file)
    conversion_of_file(ext)
  end

  def conversion_of_file(ext)
    create_file(ext)
    file_transfer(@text_file,@out_file)
    puts "the resulting file is converted here:
    #{@folder_path}/#{@new_file}"
    close_operation
  end

  def close_operation
    @text_file.close
    @out_file.close
  end

end
t = TranslateToEnglish.new
t.take_file_path