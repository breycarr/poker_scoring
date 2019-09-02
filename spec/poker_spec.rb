require 'poker'

describe Card do
    let(:subject) { Card.new("2S") }
    it "has a suit" do
        expect(subject.suit).to eq("S")
    end

    it "has a rank" do
        expect(subject.rank).to eq("2")
    end

    it "can treat the rank as a value" do
        expect(subject.value).to eq(2)
    end
    
    it "can provide a face card with a value" do
        expect(Card.new("TS").value).to eq(10)
    end
end

describe PokerHand do
    # describe "#compare_with" do
        # it "shows a higher pair wins" do
        #     hand = PokerHand.new("TD 9S QS AH TH")
        #     p hand
        #     opponent = PokerHand.new("5D 5S QC 9H AD")
            
        #     expect(hand.compare_with(opponent)).to eq(1)
        # end
    # end 

    describe "#pair?" do
        it "identifies a pair of cards" do
            subject = PokerHand.new("TD 9S QS AH TH")
            expect(subject.pair?).to eq(true)
        end
    end

    describe "#two_pair?" do
        it "identifies a two pair hand" do
            subject = PokerHand.new("TD 9S AS AH TH")
            expect(subject.two_pair?).to eq(true)
        end
    end

    describe "#three_kind?" do
        it "identifies a three of a kind" do
            subject = PokerHand.new("TD TS QS AH TH")
            expect(subject.three_kind?).to eq(true)
        end
    end

    describe "#flush?" do
        it "identifies a full house" do
            subject = PokerHand.new("1D TD 8D AD QD")
            expect(subject.flush?).to eq(true)
        end
    end

    describe "#straight?" do
        it "identifies a straight" do
            subject = PokerHand.new("1D 2S 3C 4H 5D")
            expect(subject.straight?).to eq(true)
        end
        it "identifies a straight with including face cards" do
            subject = PokerHand.new("8D 9S TC JH QD")
            expect(subject.straight?).to eq(true)
        end
    end

    describe "#full_house?" do
        it "identifies a full house" do
            subject = PokerHand.new("TD TS TC AH AS")
            expect(subject.full_house?).to eq(true)
        end
    end

    describe "#four_kind?" do
        it "identifies a four of a kind" do
            subject = PokerHand.new("TD TS TC AH TH")
            expect(subject.four_kind?).to eq(true)
        end
    end

    describe "#straight_flush" do
        it "identifies a straight flush" do
            subject = PokerHand.new("1D 2D 3D 4D 5D")
            expect(subject.straight_flush?).to eq(true)
        end
    end

end
