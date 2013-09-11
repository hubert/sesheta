require 'spec_helper'

describe Sesheta::Prescription do
  let(:now) { Time.now }
  let(:prescription) { 
    Sesheta::Prescription.new(
      "Quantity"=>"",
      "Refills"=>"0",
      "RefillAsNeeded"=>false,
      "DOS"=> now,
      "FirstName"=>"mary",
      "LastName"=>"McPoppin",
      "SigProvider"=>"only provider",
      "SigPatient"=>"only patient",
      "WasEPrescribed"=>0
    )
  }

  it 'provides ruby style accessors' do
    expect(prescription.quantity).to eql(0)    
    expect(prescription.refills).to eql(0)    
    expect(prescription.refill_as_needed).to eql(false)    
    expect(prescription.date_of_service).to eql(now.to_date)
    expect(prescription.first_name).to eql('mary')    
    expect(prescription.last_name).to eql('McPoppin')    
    expect(prescription.sig_provider).to eql('only provider')    
    expect(prescription.sig_patient).to eql('only patient')    
    expect(prescription.e_prescribed).to eql(false)  
  end
end
