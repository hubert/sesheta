class Sesheta::LabObservation < Hashie::WhiteTrash
  property :id, :from => :LabObservationID
  property :id, :from => :LabObservationId
  property :loinc_id, :from => :LoincID
  property :loinc_id, :from => :LoincId
  property :hl7_text, :from => :HL7Text
  property :observation_value, :from => :ObservationValue
  property :units, :from => :Units
  property :reference_range, :from => :ReferenceRange
  property :result_status, :from => :ResultStatus
  property :is_abnormal, :from => :IsAbnormal
  property :abnormal_flags, :from => :AbnormalFlags

  property :lab_result_id, :from => :LabResultId
  property :lab_panel_id, :from => :LabPanelId
  property :lab_panel_sequence, :from => :LabPanelSequence
  property :sequence, :from => :LabOrderSequence
end
