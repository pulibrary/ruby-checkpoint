class House
    attr_reader :file

    def initialize(file)
        @file = file
    end

    def rhyme
        File.read(file)
    end

    def random_rhyme
        lines_array = File.readlines(file)
        indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].shuffle

        rhyme = ""
        past_line = ""
        indexes.each do |index|
            rhyme << "This is " + lines_array[index]

            # need to add a period somewhere
            # can probably combine these two into if and else
            if past_line.empty?
                rhyme << "."
            end

            if !past_line.empty?
                rhyme << " " + past_line + "\n"
            end

            past_line = rhyme.copy.delete_prefix("This is ")
        end

        return rhyme
    end
end