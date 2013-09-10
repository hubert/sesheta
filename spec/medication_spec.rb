require 'spec_helper'

describe Sesheta::Medication do
  it 'adds ruby style accessors' do
    med = Sesheta::Medication.new(
      "MedName" => "Tylenol",
      "Strength"=>"varying",
      "MedId"=>125011,
      "FirstName"=>"mary",
      "LastName"=>"McPoppin",
      "SigProvider"=>"do not show",
      "SigPatient"=>"do not show"
    )

    expect(med.name).to eql('Tylenol')
    expect(med.strength).to eql('varying')
    expect(med.id).to eql(125011)
    expect(med.first_name).to eql('mary')
    expect(med.last_name).to eql('McPoppin')
    expect(med.sig_provider).to eql('do not show')
    expect(med.sig_patient).to eql('do not show')
  end
end
