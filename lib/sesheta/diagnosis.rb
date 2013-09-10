class Sesheta::Diagnosis < Hashie::Trash
  property :icd, :from => :ICD
  property :dx_name, :from => :DxName
  property :first_name, :from => :FirstName
  property :last_name, :from => :LastName
  property :id
  property :start_date, :from => :StartDate
  property :stop_date, :from => :StopDate
end
