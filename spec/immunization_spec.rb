require 'spec_helper'

describe Sesheta::Immunization do
  it 'has ruby style accessors' do
    now = Time.now
    immunization = Sesheta::Immunization.new(
      "DateGiven"=> now,
      "ImmType"=>"DTaP-Hib",
      "FirstName"=>"mary",
      "LastName"=>"McPoppin"
    )
    
    expect(immunization.date_given).to eql(now)
    expect(immunization.immunization_type).to eql('DTaP-Hib')
    expect(immunization.first_name).to eql('mary')
    expect(immunization.last_name).to eql('McPoppin')
  end
end
