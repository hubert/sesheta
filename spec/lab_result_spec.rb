require 'spec_helper'

module Sesheta
  describe LabResult do
    it 'adds ruby style accessors' do
      now = Time.now
      lab_result = Sesheta::LabResult.new(
        "LabResultID"=>3947,
        "ReportDate"=> now,
        "ProviderFirstName"=>"Homer",
        "ProviderLastName"=>"Simpson",
        "DaysApart" => 10
      )
      
      expect(lab_result.id).to eql(3947)
      expect(lab_result.report_date).to eql(now)
      expect(lab_result.provider_first_name).to eql('Homer')
      expect(lab_result.provider_last_name).to eql('Simpson')
      expect(lab_result.days_apart).to eql(10)
    end

    describe '#lab_panels' do
      it 'returns prescriptions property value if previously set' do
        lab_panels = [double('lab_panel')]
        lab_result = LabResult.new(:lab_panels => lab_panels)
        expect(lab_result.lab_panels).to eql(lab_panels)
      end

      it 'executes stored procedure with id if prescriptions property not set' do
        connection = double('connection')
        lab_result = LabResult.new(:id => 1, :connection => connection)
        connection.should_receive(:execute_procedure).with('phr_GetLabPanels', 1).and_return([])
        lab_result.lab_panels
      end
    end
    
    describe '#date_of_service' do
      it 'can be set via TranscriptDOS' do
        date_of_service = LabResult.new("TranscriptDOS"=> Time.parse('2012-12-15 00:00:00 UTC')).date_of_service
        expect(date_of_service).to eql(Date.parse('2012-12-15'))
      end
  
      it 'can be set via TranscriptDos' do
        date_of_service = LabResult.new("TranscriptDos"=> Time.parse('2012-12-15 00:00:00 UTC')).date_of_service
        expect(date_of_service).to eql(Date.parse('2012-12-15'))
      end
    end
  end
end
