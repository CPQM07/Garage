class GarageList < ApplicationRecord
  has_many :lab_tasks, dependent: :destroy
  validates :title, presence: true

  def check_list!
    _all_complete = lab_tasks.map(&:complete).all?
    update(all_complete: _all_complete)
  end
end
