class Student < ApplicationRecord
  belongs_to :cohort
  validates :name, :email, presence: true
  validate :over_eighteen, :not_weird_name

  def over_eighteen
    if dob && dob.to_date >= 18.years.ago
      self.errors.add(:dob, 'Student must be over eighteen')
    end
  end

  def not_weird_name
    if name == 'Not Matt Lawford'
      self.errors.add(:name, 'Student cannot be named Not Matt Lawford')
    end
  end
end
