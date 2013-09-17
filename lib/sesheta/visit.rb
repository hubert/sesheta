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

    def diagnoses
      self[:diagnoses] || 
      self[:diagnoses] = connection.execute_procedure(
        'phr_DiagnosisGetByTranscriptId',
        user_id,
        patient_id,
        id
      ).map { |diagnosis| Diagnosis.new(diagnosis) }
    end

  end
end
