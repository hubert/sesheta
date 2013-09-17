require 'spec_helper'

module Sesheta
  describe Diagnosis do
    it 'adds ruby style accessors' do
      now = Time.now
      diagnosis = Diagnosis.new(
        "ICD"=>"642.13",
        "DxName"=>"Hypertension secondary",
        "id"=>77458,
        "StartDate"=> now,
        "StopDate"=> now,
        "Active" => true,
        "DaysApart" => 10,
        "TranscriptDOS" => Time.parse('2013-05-13 09:00:01 UTC')
      )
       
      expect(diagnosis.icd).to eql('642.13')
      expect(diagnosis.dx_name).to eql('Hypertension secondary')
      expect(diagnosis.id).to eql(77458)
      expect(diagnosis.start_date).to eql(now)
      expect(diagnosis.stop_date).to eql(now)
      expect(diagnosis.active).to eql(true)
      expect(diagnosis.days_apart).to eql(10)
      expect(diagnosis.date_of_service).to eql(Date.parse('2013-05-13'))
    end
    
    context 'provider first name' do
      it 'can be set using ProviderFirstName' do
        expect(Diagnosis.new('ProviderFirstName' => 'foo').provider_first_name).to eql('foo')
      end
      
      it 'can be set using FirstName' do
        expect(Diagnosis.new('FirstName' => 'foo').provider_first_name).to eql('foo')
      end
    end

    context 'provider last name' do
      it 'can be set using ProviderLastName' do
        expect(Diagnosis.new('ProviderLastName' => 'foo').provider_last_name).to eql('foo')
      end
      
      it 'can be set using LastName' do
        expect(Diagnosis.new('LastName' => 'foo').provider_last_name).to eql('foo')
      end
    end
  end
end
