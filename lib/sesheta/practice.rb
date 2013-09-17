class Sesheta::Practice < Hashie::WhiteTrash
  property :id, :from => :ID
  property :name, :from => :Name
  property :phone, :from => :Phone
  property :address1, :from => :Address1
  property :address2, :from => :Address2
  property :address3, :from => :Address3
  property :city, :from => :City
  property :state, :from => :State
  property :area_code, :from => :AreaCode
end
