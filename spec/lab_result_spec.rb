require 'spec_helper'

module Sesheta
  describe LabResult do
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
  end
end
