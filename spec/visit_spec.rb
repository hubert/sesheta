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

  describe 'lab_results' do
    it 'returns lab result with associated lab panels and observations' do
      lab_data = [
        [{'LabResultId' => 1}],
        [{'LabPanelId' => 2, 'LabResultId' => 1}],
        [{'LabObservationId' => 3, 'LabPanelId' => 2}]
      ]
      connection = double('connection', :execute_procedure => lab_data)
      lab_result = Sesheta::Visit.new(:connection => connection).lab_results.first
      lab_panel = lab_result.lab_panels.first
      lab_obs = lab_panel.lab_observations.first
  
      expect(lab_result.id).to eql(1)
      expect(lab_panel.id).to eql(2)
      expect(lab_panel.lab_result_id).to eql(1)
      expect(lab_obs.id).to eql(3)
      expect(lab_obs.lab_panel_id).to eql(2)
    end
  end
end
