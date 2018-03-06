class Todo < ApplicationRecord
  belongs_to :project, inverse_of: :todos
end
