class Todo < ApplicationRecord

  ## Validations
  validates :name, presence: true, length: { maximum: 50 }

  belongs_to :user

  private

  def default_values
    self.status ||= false
    nil                           # required so that TX will not rollback!!!
  end
end
