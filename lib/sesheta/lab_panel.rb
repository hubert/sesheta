module Sesheta
  class LabPanel < Hashie::WhiteTrash
    property :id, :from => :LabPanelID
    property :id, :from => :LabPanelId
    property :lab_result_id, :from => :LabResultId
    property :sequence, :from => :LabPanelSequence
    property :name, :from => :PanelName
    property :status, :from => :Status
    property :connection # yes, this is a connection to the db. FML
    property :lab_observations

    def lab_observations
      self[:lab_observations] ||
      self[:lab_observations] = connection.execute_procedure('phr_GetLabObservations', id).map do |lab_obs|
        LabObservation.new(lab_obs)
      end
    end
  end
end
