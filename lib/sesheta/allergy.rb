class Sesheta::Allergy < Hashie::WhiteTrash
  property :phr_user_id, :from => :PhrUserId
  property :patient_id, :from => :PatientId
  property :group_title, :from => :GroupTitle
  property :substance_title, :from => :SubstanceTitle
  property :search_keywords, :from => :SearchKeywords
  property :medication_name, :from => :MedicationName
  property :ndc, :from => :NDC
  property :severity_title, :from => :SeverityTitle
  property :reaction_title, :from => :ReactionTitle
  property :reaction_group_title, :from => :ReactionGroupTitle
  property :is_active, :from => :IsActive
  property :adverse_event_date,
    :from => :AdverseEventDate,
    :with => lambda { |prop| (prop.nil? || prop.empty?) ? nil : Date.parse(prop) }

  # needed to support data returned by Phr::User.allergies_by_visit
  property :date_of_service, from: :TranscriptDOS, with: ->(prop) { prop.to_date }
  property :days_apart, from: :DaysApart
end
