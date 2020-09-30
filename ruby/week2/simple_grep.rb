
def simple_grep(filename, search_string)
    File.foreach(filename) do |line|
        puts "#{$.}: #{line}" if line =~ Regexp.new(search_string)
    end
end


simple_grep("test_file.txt", "for")