require 'spec_helper'

describe Sesheta::Visit do
  it 'has ruby style accessors' do
    visit = Sesheta::Visit.new(
      "TranscriptID"=>183596,
      "TranscriptDOS"=> Time.parse('2013-08-15 12:00:01 UTC'),
      "ProviderFirstName"=>"sqwot",
      "ProviderLastName"=>"taokbycp",
      "SignedByProviderID"=> 10,
      "SignedDate"=> Time.parse('2012-09-29 20:58:15 UTC')
    )

    expect(visit.id).to eql(183596)
    expect(visit.date_of_service).to eql(Date.parse('2013-08-15'))
    expect(visit.provider_first_name).to eql('sqwot')
    expect(visit.provider_last_name).to eql('taokbycp')
    expect(visit.signed_by_provider_id).to eql(10)
    expect(visit.signed_date).to eql(Date.parse('2012-09-29'))
  end
end
