require 'spec_helper'

describe Sesheta::LabResult do
  it 'adds ruby style accessors' do
    now = Time.now
    lab_result = Sesheta::LabResult.new(
      "LabResultID"=>3947,
      "ReportDate"=> now,
      "ProviderFirstName"=>"Homer",
      "ProviderLastName"=>"Simpson"
    )
    
    expect(lab_result.id).to eql(3947)
    expect(lab_result.report_date).to eql(now)
    expect(lab_result.provider_first_name).to eql('Homer')
    expect(lab_result.provider_last_name).to eql('Simpson')
  end
end
