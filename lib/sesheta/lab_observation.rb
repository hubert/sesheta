class Sesheta::LabObservation < Hashie::Trash
  property :id, :from => :LabObservationID
  property :loinc_id, :from => :LoincID
  property :hl7_text, :from => :HL7Text
  property :observation_value, :from => :ObservationValue
  property :units, :from => :Units
  property :reference_range, :from => :ReferenceRange
  property :result_status, :from => :ResultStatus
  property :is_abnormal, :from => :IsAbnormal
  property :abnormal_flags, :from => :AbnormalFlags
end
