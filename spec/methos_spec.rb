require '../methods.rb'
RSpec.describe Enumerable do
    describe "#my_each" do
        it "Takes a block as argument" do
            expect([1,2,3].my_each {|x| x}).to eql([1,2,3])
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
    end
end