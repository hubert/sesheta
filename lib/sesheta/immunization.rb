class Sesheta::Immunization < Hashie::Trash
  property :date_given, :from => :DateGiven
  property :immunization_type, :from => :ImmType
  property :first_name, :from => :FirstName
  property :last_name, :from => :LastName
end
