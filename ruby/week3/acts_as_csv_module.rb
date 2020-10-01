module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    class CsvRow
        def method_missing name, *args
            column_name = name.to_s
            @elements[@headers.index(column_name)]
        end

        def initialize(headers, elements)
            @headers = headers
            @elements = elements
        end


    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end

        attr_accessor :headers, :csv_contents
        def initialize
            read
        end

        def each
            @csv_contents.each {|row| yield CsvRow.new(@headers, row)}
        end
    end
end



class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

csv = RubyCsv.new

csv.each {|row| puts row.one}

