require 'card'

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