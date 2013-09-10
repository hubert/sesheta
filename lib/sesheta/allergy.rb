class Sesheta::Allergy < Hashie::Trash
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
  property :adverse_event_date, :from => :AdverseEventDate
  property :is_active, :from => :IsActive
end
