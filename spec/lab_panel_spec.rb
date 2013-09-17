require 'spec_helper'

module Sesheta
  describe LabPanel do
    let(:lab_panel) {
      Sesheta::LabPanel.new(
        "PanelName"=>"Cryoglobulin",
        "Status"=>"Final",
        "LabResultId" => 10,
        "LabPanelSequence" => 1
      ) 
    }

    it 'adds ruby style accessors' do
      expect(lab_panel.name).to eql('Cryoglobulin')
      expect(lab_panel.status).to eql('Final')
      expect(lab_panel.lab_result_id).to eql(10)
      expect(lab_panel.sequence).to eql(1)
    end

    describe '#lab_observations' do
      it 'returns prescriptions property value if previously set' do
        lab_observations = [double('lab_observation')]
        lab_panel = LabPanel.new(:lab_observations => lab_observations)
        expect(lab_panel.lab_observations).to eql(lab_observations)
      end

      it 'executes stored procedure with id if prescriptions property not set' do
        connection = double('connection')
        lab_panel = LabPanel.new(:id => 1, :connection => connection)
        connection.should_receive(:execute_procedure).with('phr_GetLabObservations', 1).and_return([])
        lab_panel.lab_observations
      end
    end

    describe '#id' do
      it 'can be set via LabPanelID' do
        expect(Sesheta::LabPanel.new("LabPanelID"=>5887).id).to eql(5887) 
      end
    
      it 'can be set via LabPanelId' do 
        expect(Sesheta::LabPanel.new("LabPanelId"=>5887).id).to eql(5887) 
      end
    end
  end
end
