require 'methods'

RSpec.describe Enumerable do
    describe "#my_each" do
        it "Takes a block as argument" do
            expect([1,2,3].my_each {|x| x}).to eql([1,2,3])
        end
        it "Takes an empty array and returns empty array" do
            expect([].my_each{|x| x}).to eql([])
        end
    end
    describe '#my_select' do
        it "Returns all even numbers." do
            expect([1,2,3,4,5].my_select { |num|  num.even?  }).to eql([2,4])
        end
        it "returns are element vogals." do
            a = %w{ a b c d e f }
            expect(a.my_select { |v| v =~ /[aeiou]/ }).to eql(["a", "e"])
        end
        it "takes a range" do
            expect((0..5).select{|x| x==4}).to eql([4])
        end
    end

    describe '#my_any' do
        it "Returns true if any element have length 4 or more" do
        expect(%w[ant bear cat].my_any? { |word| word.length >=4  }).to eql(true)
    end
    it "Returns false because none word has less than 1 char" do
        expect(%w[ant bear cat].my_any? { |word| word.length <2}).to eql(false)
        end
    end
end