module Sesheta
  class Medication < Hashie::Trash
    property :name, :from => :MedName
    property :strength, :from => :Strength
    property :id, :from => :MedId
    property :first_name, :from => :FirstName
    property :last_name, :from => :LastName
    property :sig_provider, :from => :SigProvider
    property :sig_patient, :from => :SigPatient
    property :connection

    def prescriptions
      connection.execute_procedure('phr_GetPrescriptions', id).map do |prescription|
        Prescription.new(prescription)
      end
    end
  end
end
