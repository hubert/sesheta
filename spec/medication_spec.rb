require 'spec_helper'

module Sesheta
  describe Medication do
    it 'adds ruby style accessors' do
      med = Sesheta::Medication.new(
        "MedName" => "Tylenol",
        "Strength"=>"varying",
        "FirstName"=>"mary",
        "LastName"=>"McPoppin",
        "SigProvider"=>"do not show",
        "SigPatient"=>"do not show"
      )

      expect(med.name).to eql('Tylenol')
      expect(med.strength).to eql('varying')
      expect(med.sig_provider).to eql('do not show')
      expect(med.sig_patient).to eql('do not show')
    end
    
    context 'id' do
      it 'can be set using MedId' do
        expect(Medication.new(:MedId => 1).id).to eql(1)
      end

      it 'can be set using MedicationID' do
        expect(Medication.new(:MedicationID => 1).id).to eql(1)
      end
    end

    context 'provider_first_name' do
      it 'can be set using FirstName' do
        expect(Medication.new(:FirstName => 'foo').provider_first_name).to eql('foo')
      end

      it 'can be set using ProviderFirstName' do
        expect(Medication.new(:ProviderFirstName => 'foo').provider_first_name).to eql('foo')
      end
    end

    context 'provider_last_name' do
      it 'can be set using LastName' do
        expect(Medication.new(:LastName => 'foo').provider_last_name).to eql('foo')
      end

      it 'can be set using ProviderLastName' do
        expect(Medication.new(:ProviderLastName => 'foo').provider_last_name).to eql('foo')
      end
    end
  end
end
