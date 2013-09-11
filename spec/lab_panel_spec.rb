require 'spec_helper'

describe Sesheta::LabPanel do
  let(:lab_panel) {
    Sesheta::LabPanel.new( "LabPanelID"=>5887, "PanelName"=>"Cryoglobulin", "Status"=>"Final") 
  }

  it 'adds ruby style accessors' do
    expect(lab_panel.id).to eql(5887)
    expect(lab_panel.name).to eql('Cryoglobulin')
    expect(lab_panel.status).to eql('Final')
  end
end
