require 'methods'

RSpec.describe Enumerable do
    describe "#my_each" do
        it "Takes a block as argument" do
            expect([1,2,3].my_each {|x| x}).to eql([1,2,3])
        end
        it "Takes an empty array and returns empty array" do
            expect([].my_each{|x| x}).to eql([])
        end
        it " Accepts Range" do
            expect((1..5).my_each{|x| x}).to eql([1,2,3,4,5])
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

    describe '#my_any?' do
        it "Returns true if any element have length 4 or more" do
            expect(%w[ant bear cat].my_any? { |word| word.length >=4  }).to eql(true)
        end
        it "Returns true if any element have length 10 or more" do
            expect(%w[antsdfassfas bear cat].my_any? { |word| word.length >=10  }).to eql(true)
        end
        it "Returns true if any element is nil" do
            expect(["antsdfassfas", "bear", nil].my_any? { |x| x == nil  }).to eql(false)
        end
        it "Returns true if any element is nil" do
            expect(%w[nil bear 12].my_any? { |x| x == nil  }).to eql(false)
        end
        it "Returns true beacause ever returns a value other than false or nil" do
            expect(%w[false false nil].my_any? { |x| x }).to eql(true)
        end
        it "Returns false because none word has less than 1 char" do
            expect(%w[ant bear cat].my_any? { |word| word.length <2}).to eql(false)
        end
    end
    describe '#my_none?' do
        it "Returns true because the strings never have more than 4 letters" do
            expect(%w[asd ads kjl ela].my_none?{|word| word.length >= 4}).to eql(true)
        end
        it "Returns false because one of the strings has more than 4 letters" do
            expect(%w[asd adss kjl ela].my_none?{|word| word.length >= 4}).to eql(false)
        end
        it "Returns true because the items are not false" do
            expect(%w[asd ads kjl ela].my_none?{|x| x == false }).to eql(true)
        end
        it "Returns false because the items are not false" do
            expect(%w[asd ads kjl ela 0].my_none?{|x| x == false }).to eql(true)
        end
    end
    describe '#my_count' do
        it "Returns the count of the elements of an array" do
            expect([1,2,3].my_count).to eql(3)
        end
        it "Returns the count of the elements in the array that matches the argument" do
            expect([1,2,3].my_count(2)).to eql(1)
        end
        it "Returns the count or the elements that the block returns true" do
            expect([1,2,3,4,5,6].my_count{|x| x.even?}).to eql(3)
        end
    end
    describe '#my_map' do
        it "Returns the power of numbers 1 to 4" do
            expect((1..4).my_map { |i| i*i } ).to eql([1, 4, 9, 16])
        end
        it "Returns numbers 1 to 3 multiplied by 2" do
            expect((1..3).my_map { |i| i*2 } ).to eql([2,4,6])
        end
        it "Returns the power of numbers 1 to 4 taking an array" do
            expect([1,2,3,4].my_map { |i| i*i } ).to eql([1, 4, 9, 16])
        end
        it "Returns numbers 1 to 3 multiplied by 2 taking an array" do
            expect([1,2,3].my_map { |i| i*2 } ).to eql([2,4,6])
        end
        it "test my map with empty array" do
            expect([].my_map { |i| i*2 } ).to eql([])
        end
        it "with one element range" do
            expect((1..1).my_map { |i| i*2 } ).to eql([2])
        end
    end
    
end