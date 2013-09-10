require 'spec_helper'

describe Sesheta::Practice do
  let(:practice) {
    Sesheta::Practice.new(
      "Name"=>"Holistic Lunacy",
      "ID"=>7781,
      "Phone"=>"(775) 123-1235",
      "Address1"=>"123 Mohn Stweet",
      "Address2"=>"Suite A",
      "Address3"=>nil,
      "City"=>"Reno",
      "State"=>"NV",
      "AreaCode"=>"89509"
    )
  }

  it 'adds ruby style accessors' do
    expect(practice.name).to eql 'Holistic Lunacy'
    expect(practice.id).to eql 7781
    expect(practice.address1).to eql('123 Mohn Stweet')
    expect(practice.address2).to eql('Suite A')
    expect(practice.address3).to be_nil
    expect(practice.city).to eql 'Reno'
    expect(practice.state).to eql 'NV'
    expect(practice.area_code).to eql '89509'
  end
end
