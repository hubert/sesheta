require 'spec_helper'

describe Sesheta::LabObservation do
  let(:lab_observation) {
     Sesheta::LabObservation.new(
       "LabObservationID"=>22694,
       "LoincID"=>nil,
       "HL7Text"=>"Serum",
       "ObservationValue"=>"wtf",
       "Units"=>"units",
       "ReferenceRange"=>"None",
       "ResultStatus"=>"Final",
       "IsAbnormal"=>true,
       "AbnormalFlags"=>"Abnormal"
     )
   }

  it 'adds ruby style accessors' do
    expect(lab_observation.id).to eql(22694)
    expect(lab_observation.loinc_id).to eql(nil)
    expect(lab_observation.hl7_text).to eql('Serum')
    expect(lab_observation.observation_value).to eql('wtf')
    expect(lab_observation.units).to eql('units')
    expect(lab_observation.reference_range).to eql('None')
    expect(lab_observation.result_status).to eql('Final')
    expect(lab_observation.is_abnormal).to eql(true)
    expect(lab_observation.abnormal_flags).to eql('Abnormal')
  end
end
