module Sesheta
  class Visit < Hashie::WhiteTrash
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
    property :lab_results

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

    def lab_results
      return self[:lab_results] if self[:lab_results]

      # this procedure returns a 3 member array 
      lab_results, lab_panels, lab_observations = connection.execute_procedure(
        'phr_LabResultGetByTranscriptId',
        user_id,
        patient_id,
        id
      )
      
      lab_panels.map! { |lp| LabPanel.new(lp) }
      lab_observations.map! { |lo| LabObservation.new(lo) }
      lab_results.map! { |lr| LabResult.new(lr) }

      # populate lab observations of lab panels
      lab_panels.each do |panel|
        panel.lab_observations = lab_observations.select do |obs|
          obs.lab_panel_id == panel.id
        end
      end

      self[:lab_results] = lab_results.each { |lab_result|
        lab_result.lab_panels = lab_panels.select do |panel|
          panel.lab_result_id == lab_result.id
        end
      }
    end
  end
end
