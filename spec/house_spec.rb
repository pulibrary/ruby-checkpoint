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
end