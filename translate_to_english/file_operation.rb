FOLDER_PATH = '/home/wgbl/Sangmesh_assignment/sanga'
OP_FOLDER_PATH = '/home/wgbl/Sangmesh_assignment/sanga1'
class FileOperation
  def self.do_conversion
    Dir.foreach(FOLDER_PATH) do |filename|
      ext = File.extname(filename)
      puts "file #{filename} - ext #{ext}"
      next if filename == '.' || filename == '..'.
        puts "if #{ext.include?(".xlsx")}"
        if ext.include?(".txt")
          excel = Roo::Excelx.new("#{FOLDER_PATH}/#{filename}")
          puts "inside xslx - #{filename}"
          new_file = File.basename(filename, ".*")
          puts "filename #{new_file}"
          out_file = File.new("#{OP_FOLDER_PATH}/#{new_file}.csv", "w+")
          1.upto(excel.last_row) do |line|
            line_converted = line.gsub!('ā','a')
            out_file.puts(CSV.generate_line excel.row(line_converted))
          end
          out_file.close
      end
    end
  end
end
FileOperation.do_conversion