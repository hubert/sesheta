class Sesheta::LabPanel < Hashie::Trash
  property :id, :from => :LabPanelID
  property :name, :from => :PanelName
  property :status, :from => :Status
end
