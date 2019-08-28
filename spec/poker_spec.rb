require 'poker'

describe PokerHand, "#compare_with" do
        it "shows a higher pair wins" do
            hand = PokerHand.new("TD 9S QS AH TH")
            opponent = PokerHand.new("5D 5S QC 9H AD")
            
            expect(hand.compare_with(opponent)).to eq(1)
        end
    
end
