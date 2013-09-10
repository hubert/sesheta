require 'spec_helper'

describe Sesheta::Diagnosis do
  it 'adds ruby style accessors' do
    now = Time.now
    diagnosis = Sesheta::Diagnosis.new(
      "ICD"=>"642.13",
      "DxName"=>"Hypertension secondary",
      "FirstName"=>"Mary",
      "LastName"=>"McPoppin",
      "id"=>77458,
      "StartDate"=> now,
      "StopDate"=> now
    )
     
    expect(diagnosis.icd).to eql('642.13')
    expect(diagnosis.dx_name).to eql('Hypertension secondary')
    expect(diagnosis.first_name).to eql('Mary')
    expect(diagnosis.last_name).to eql('McPoppin')
    expect(diagnosis.id).to eql(77458)
    expect(diagnosis.start_date).to eql(now)
    expect(diagnosis.stop_date).to eql(now)
  end
end
