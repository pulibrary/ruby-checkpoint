require './spec/spec_helper.rb'
require_relative '../house.rb'
# require 'byebug'

describe House do
    it 'returns the house that jack built rhyme' do
        house = House.new('house.txt')
        rhyme = house.rhyme

        test_file = File.read('test_text.txt')

        expect(rhyme).to match(test_file)
    end

    it 'returns a random version of the the house that jack built rhyme' do
        house = House.new('house_components.txt')
        random_rhyme = house.random_rhyme
        # random_rhyme should be an array of each line/paragraph
        expect(random_rhyme.length).to eq 12

        prev_line = ""
        random_rhyme.each do |line|
            expect(line).to start_with "This is"
            if !prev_line.empty?
                expect(line).to include(prev_line)
            end
            prev_line = line.copy.delete_prefix("This is ")
        end

        
    end
end