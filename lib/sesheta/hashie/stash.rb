module Hashie

  # WhiteTrash is a Trash that uses its properties as a white list
  # but ignores properties that are not defined, rather than
  # throwing a no method error
  class WhiteTrash < Trash
  
    def property_exists?(property)
     self.class.property?(property.to_sym) 
    end
  end
end
