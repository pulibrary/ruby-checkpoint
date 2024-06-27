class House
    attr_reader :file

    def initialize(file)
        @file = file
    end

    def rhyme
        File.read(file)
    end
end