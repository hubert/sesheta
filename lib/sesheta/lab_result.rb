module Sesheta
  class LabResult < Hashie::Trash
    property :id, :from => :LabResultID
    property :id, :from => :LabResultId
    property :report_date, :from => :ReportDate
    property :provider_first_name, :from => :ProviderFirstName
    property :provider_last_name, :from => :ProviderLastName
    property :connection # yes, this is a connection to the db. FML
    property :lab_panels

    property :date_of_service, from: :TranscriptDOS, with: ->(prop) { prop.to_date }
    property :date_of_service, from: :TranscriptDos, with: ->(prop) { prop.to_date }
    property :days_apart, from: :DaysApart

    def lab_panels
      self[:lab_panels] || 
      self[:lab_panels] = connection.execute_procedure('phr_GetLabPanels', id).map do |lab_panel|
        LabPanel.new(lab_panel.merge(:connection => connection))
      end
    end
  end
end
