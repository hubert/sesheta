class Sesheta::LabResult < Hashie::Trash
  property :id, :from => :LabResultID
  property :report_date, :from => :ReportDate
  property :provider_first_name, :from => :ProviderFirstName
  property :provider_last_name, :from => :ProviderLastName
end
