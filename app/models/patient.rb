class Patient < ActiveRecord::Base
  default_scope { where deleted: false }
  scope :onTreatment, -> { where(status: "treatment") }

  belongs_to :location

  validates :first_name, length: { maximum: 30 }
  validates :middle_name, length: { maximum: 10 }
  validates :last_name, length: { maximum: 30 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, presence: true
  validates :location, presence: true

  validates :status, inclusion: { in: %w(initial referred treatment closed) }
  validates :gender, inclusion: { in: %w(not_available male female) }

  delegate :name, :to => :location, :prefix => true

  before_create do
    self.view_count ||= 0
    self.deleted ||= false
    nil
  end

  after_save do
    # set default medical number
    if self.medical_number.nil? && !self.id.nil?
      self.update_attributes(medical_number: "MR%06d" % self.id)
    end
  end

  def ages
    (Date.today.year - self.birthday.year) if self.birthday
  end

  def full_name
    "#{self.last_name}, #{self.first_name} #{self.middle_name}".strip
  end

end
