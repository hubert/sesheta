class Sesheta::Diagnosis < Hashie::Trash
  property :icd, :from => :ICD
  property :dx_name, :from => :DxName
  property :id
  property :start_date, :from => :StartDate
  property :stop_date, :from => :StopDate

  # these are here to support the legacy system for now
  # where diagnoses and diagnoses by visit return different structured data
  property :provider_first_name, from: :ProviderFirstName
  property :provider_first_name, :from => :FirstName
  property :provider_last_name, from: :ProviderLastName
  property :provider_last_name, :from => :LastName
  property :active, from: :Active
  property :days_apart, from: :DaysApart
  property :date_of_service, from: :TranscriptDOS, with: ->(prop) { prop.to_date }
end
