class Specialty < ApplicationRecord
  has_many :doctors, through: :spec_docs
end
