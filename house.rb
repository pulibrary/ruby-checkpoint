class House
    attr_reader :file

    def initialize(file)
        @file = file
    end

    def rhyme
        File.read(file)
    end

    def random_rhyme
        lines_array = File.readlines(file).map(&:chomp)
        indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].shuffle
        rhyme = []
        indexes.each_with_index do |val, index|
            if index == 0
                # first line: no need to append previous rhyme
                rhyme[index] = "This is " + lines_array[val] + ".\n"
            else
                # subsequent lines: append previous rhyme
                rhyme[index] = "This is " + lines_array[val] + " " + rhyme[index - 1].delete_prefix("This is ")
            end
        end
        return rhyme
    end
end