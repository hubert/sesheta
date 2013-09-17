module Sesheta
  class Medication < Hashie::Trash
    property :name, :from => :MedName
    property :strength, :from => :Strength
    property :sig_provider, :from => :SigProvider
    property :sig_patient, :from => :SigPatient
    property :connection
    property :prescriptions

    # these props have two names depending on which db procedure endpoint you are hitting....
    property :id, :from => :MedId
    property :id, :from => :MedicationID
    property :provider_first_name, :from => :FirstName
    property :provider_first_name, :from => :ProviderFirstName
    property :provider_last_name, :from => :LastName
    property :provider_last_name, :from => :ProviderLastName

    def prescriptions
      self[:prescriptions] || 
      self[:prescriptions] = connection.execute_procedure('phr_GetPrescriptions', id).map do |prescription|
        Prescription.new(prescription)
      end
    end
  end
end
