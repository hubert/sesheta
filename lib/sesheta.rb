require "sesheta/version"
require 'hashie'

module Sesheta
  autoload :Practice,       'sesheta/practice'
  autoload :Diagnosis,      'sesheta/diagnosis'
  autoload :Medication,     'sesheta/medication'
  autoload :Allergy,        'sesheta/allergy'
  autoload :Immunization,   'sesheta/immunization'
  autoload :LabResult,      'sesheta/lab_result'
  autoload :Prescription,   'sesheta/prescription'
  autoload :LabObservation, 'sesheta/lab_observation'
end
