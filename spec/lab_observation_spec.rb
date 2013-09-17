require 'spec_helper'

describe Sesheta::LabObservation do
  let(:lab_observation) {
     Sesheta::LabObservation.new(
       "HL7Text"=>"Serum",
       "ObservationValue"=>"wtf",
       "Units"=>"units",
       "ReferenceRange"=>"None",
       "ResultStatus"=>"Final",
       "IsAbnormal"=>true,
       "AbnormalFlags"=>"Abnormal",
       "LabResultId" => 10,
       "LabPanelId" => 5,
       "LabPanelSequence" => 3,
       "LabOrderSequence" => 4
     )
   }

  it 'adds ruby style accessors' do
    expect(lab_observation.hl7_text).to eql('Serum')
    expect(lab_observation.observation_value).to eql('wtf')
    expect(lab_observation.units).to eql('units')
    expect(lab_observation.reference_range).to eql('None')
    expect(lab_observation.result_status).to eql('Final')
    expect(lab_observation.is_abnormal).to eql(true)
    expect(lab_observation.abnormal_flags).to eql('Abnormal')
    expect(lab_observation.lab_result_id).to eql(10)
    expect(lab_observation.lab_panel_id).to eql(5)
    expect(lab_observation.lab_panel_sequence).to eql(3)
    expect(lab_observation.sequence).to eql(4)
  end

  context 'id' do
    it 'can be set using LoincID' do
      expect(Sesheta::LabObservation.new("LoincID" => 22694).loinc_id).to eql(22694)
    end
    
    it 'can be set using LoincId' do
      expect(Sesheta::LabObservation.new("LoincId" => 22694).loinc_id).to eql(22694)
    end
  end

  context 'loinc_id' do
    it 'can be set using LabObservationID' do
      expect(Sesheta::LabObservation.new("LabObservationID" => 22694).id).to eql(22694)
    end
    
    it 'can be set using LabObservationId' do
      expect(Sesheta::LabObservation.new("LabObservationId" => 22694).id).to eql(22694)
    end
  end

  
end
