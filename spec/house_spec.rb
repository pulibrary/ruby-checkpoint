require './spec/spec_helper.rb'
require_relative '../house.rb'

def test_rand_rhyme_behavior(random_rhyme)
    # random_rhyme should be an array of each line of the rhyme
    expect(random_rhyme.length).to eq 12

    # check that class fulfills 'same random order on each line' requirement
    prev_line = ""
    random_rhyme.each do |line|
        expect(line).to start_with "This is"
        if !prev_line.empty?
            expect(line).to include(prev_line)
        end
        prev_line = line.clone.delete_prefix("This is ")
    end

    # check all lines of the rhyme are included in the final line (11)
    File.readlines('house_components.txt').each do |line|
        expect(random_rhyme[11]).to include(line.chomp)
    end
end

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
        test_rand_rhyme_behavior(random_rhyme)
    end

    it 'returns a semi-random rhyme with the house that jack built last' do
        house = House.new('house_components.txt')
        semi_random_rhyme = house.semi_random_rhyme
        test_rand_rhyme_behavior(semi_random_rhyme)

        semi_random_rhyme.each do |line|
            expect(line.chomp).to end_with("the house that Jack built.")
        end
    end
end