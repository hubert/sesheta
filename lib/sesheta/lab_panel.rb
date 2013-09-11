module Sesheta
  class LabPanel < Hashie::Trash
    property :id, :from => :LabPanelID
    property :name, :from => :PanelName
    property :status, :from => :Status
    property :connection # yes, this is a connection to the db. FML

    def lab_observations
      connection.execute_procedure('phr_GetLabObservations', id).map do |lab_observation|
        LabObservation.new(lab_observation)
      end
    end
  end
end
