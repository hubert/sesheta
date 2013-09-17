require 'spec_helper'

describe Sesheta::Allergy do
  it 'adds ruby style accessors' do
    allergy = Sesheta::Allergy.new(
      "PhrUserId"=>29884,
      "PatientId"=>97588,
      "GroupTitle"=>"AllergyGroup",
      "SubstanceTitle"=>"AllergyClass",
      "SearchKeywords"=>"allergy class",
      "MedicationName"=>"ACE Inhibitors",
      "NDC"=>nil,
      "SeverityTitle"=>"Modest",
      "ReactionTitle"=>"Unknown",
      "ReactionGroupTitle"=>"Skin",
      "AdverseEventDate"=> "9/3/2013 7:00:00 AM",
      "IsActive"=>true,
      "TranscriptDOS"=> Time.parse('2012-12-15 00:00:00 UTC'),
      "DaysApart" => 10
    )
    
    expect(allergy.phr_user_id).to eql(29884)
    expect(allergy.patient_id).to eql(97588)
    expect(allergy.group_title).to eql('AllergyGroup')
    expect(allergy.substance_title).to eql('AllergyClass')
    expect(allergy.search_keywords).to eql('allergy class')
    expect(allergy.medication_name).to eql('ACE Inhibitors')
    expect(allergy.ndc).to eql(nil)
    expect(allergy.severity_title).to eql('Modest')
    expect(allergy.reaction_title).to eql('Unknown')
    expect(allergy.reaction_group_title).to eql('Skin')
    expect(allergy.adverse_event_date).to eql(Date.parse("9/3/2013 7:00:00 AM"))
    expect(allergy.is_active).to eql(true)
    expect(allergy.date_of_service).to eql(Date.parse('2012-12-15'))
    expect(allergy.days_apart).to eql(10)
  end
end
