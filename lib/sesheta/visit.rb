module Sesheta
  class Visit < Hashie::Trash
    property :id, :from => :TranscriptID
    property :date_of_service, from: :TranscriptDOS, with: ->(prop) { prop.to_date }
    property :provider_first_name, from: :ProviderFirstName
    property :provider_last_name, from: :ProviderLastName
    property :signed_by_provider_id, from: :SignedByProviderID
    property :signed_date, from: :SignedDate, with: ->(prop) { prop && prop.to_date }

    property :connection
    property :user_id
    property :patient_id
    property :diagnoses
    property :medications
    property :allergies

    def diagnoses
      self[:diagnoses] || 
      self[:diagnoses] = connection.execute_procedure(
        'phr_DiagnosisGetByTranscriptId',
        user_id,
        patient_id,
        id
      ).map { |diagnosis| Diagnosis.new(diagnosis) }
    end

    def medications
      self[:medications] || 
      self[:medications] = connection.execute_procedure(
        'phr_MedicationGetByTranscriptId',
        user_id,
        patient_id,
        id
      ).map { |medication| Medication.new(medication.merge(connection: connection)) }
    end

    def allergies
      self[:allergies] || 
      self[:allergies] = connection.execute_procedure(
        'phr_AllergyGetByTranscriptId',
        user_id,
        patient_id,
        id
      ).map { |allergy| Allergy.new(allergy) }
    end
  end
end
