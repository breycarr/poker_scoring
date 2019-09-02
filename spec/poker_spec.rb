require 'poker'

describe Card do
    let(:subject) { Card.new("2S") }
    it "has a rank" do
        expect(subject.rank).to eq("2")
    end
    it "has a suit" do
        expect(subject.suit).to eq("S")
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
        let(:subject) { PokerHand.new("TD 9S QS AH TH") }

        it "identifies a pair of cards" do
            expect(subject.pair?).to eq(true)
        end
    end

    describe "#two_pair?" do
        let(:subject) { PokerHand.new("TD 9S AS AH TH") }

        it "identifies a two pair hand" do
            expect(subject.two_pair?).to eq(true)
        end
    end

    describe "#three_kind?" do
        let(:subject) { PokerHand.new("TD TS QS AH TH") }

        it "identifies a three of a kind" do
            expect(subject.three_kind?).to eq(true)
        end
    end

    describe "#flush?" do
        let(:subject) { PokerHand.new("1D TD 8D AD QD") }

        it "identifies a full house" do
            expect(subject.flush?).to eq(true)
        end
    end

    describe "#full_house?" do
        let(:subject) { PokerHand.new("TD TS TC AH AS") }

        it "identifies a full house" do
            expect(subject.full_house?).to eq(true)
        end
    end

    describe "#four_kind?" do
        let(:subject) { PokerHand.new("TD TS TC AH TH") }

        it "identifies a four of a kind" do
            expect(subject.four_kind?).to eq(true)
        end
    end

end
