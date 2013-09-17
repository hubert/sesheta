class Sesheta::Prescription < Hashie::WhiteTrash
  property :quantity, :from => :Quantity, :with => lambda { |prop| prop.to_i }
  property :refills, :from => :Refills, :with => lambda { |prop| prop.to_i }
  property :refill_as_needed, :from => :RefillAsNeeded
  property :date_of_service, :from => :DOS, :with => lambda { |prop| prop.to_date }
  property :first_name, :from => :FirstName
  property :last_name, :from => :LastName
  property :sig_provider, :from => :SigProvider
  property :sig_patient, :from => :SigPatient
  property :e_prescribed, :from => :WasEPrescribed, :with => lambda { |prop| prop == 0 ? false : true }
end
