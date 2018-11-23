

describe 'testing the exchange rates' do

  before(:each) do
    @exchange_rates = ParseJson.new('json_exchange_rates.json')
  end

  it "should check if the type is correct" do
    expect(@exchange_rates.json_file).to be_kind_of(Hash)
  end

  it "should check if base is correct" do
    expect(@exchange_rates.get_base).to eq 'EUR'
  end

  it "should check if key values is correct type and more than 0" do
    @exchange_rates.json_file['rates'].values.each do |value|
      expect(value).to be_kind_of(Float)
      expect(value).to be > 0
    end
  end

  it "should check if base is correct case" do
    @exchange_rates.json_file['rates'].keys.each do |key|
      key == key.upcase
      expect(key.length).to be 3
    end
  end

  it "should check if base is correct type" do
    expect(@exchange_rates.date_validate?).to eq true
  end

  it "checks to see if update has passed 500 days" do
    expect(@exchange_rates.jd_date).to be < 500
  end


end
