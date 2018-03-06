class Project < ApplicationRecord
    has_many :todos, inverse_of: :project
    
    accepts_nested_attributes_for :todos, reject_if: proc { |attributes| attributes[:title].blank? }, allow_destroy: true
end
