class LabTask < ApplicationRecord
  belongs_to :garage_list
  validates :title, presence: true

  after_save :all_task_complete?

  def all_task_complete?
    garage_list.check_list!
  end
end
