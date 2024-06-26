require './spec/spec_helper.rb'
require_relative '../house.rb'
# require 'byebug'

describe House do
    it 'returns the house that jack built rhyme' do
        rhyme = House.new()
        test_file = File.open('test_text.txt')
        
        expect(rhyme).to match(test_file)
    end
end