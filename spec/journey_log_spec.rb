require 'journey_log'

describe Journey_log do
  let(:journey){ double :journey } 
  let(:station){ double :station }
  let(:journey_class){double :journey_class, new: journey}

#   it "should start a new journey with an entry station" do

#     expect(journey.start)
end