class Sesheta::Medication < Hashie::Trash
  property :name, :from => :MedName
  property :strength, :from => :Strength
  property :id, :from => :MedId
  property :first_name, :from => :FirstName
  property :last_name, :from => :LastName
  property :sig_provider, :from => :SigProvider
  property :sig_patient, :from => :SigPatient
end
