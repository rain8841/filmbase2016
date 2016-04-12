class Attachment < ActiveRecord::Base
  @c_type = %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)
  belongs_to :user
  
  has_attached_file :document
  validates_attachment :document, presense: true, :content_type => {:content_type => @c_type}, size: { in: 0..10.megabytes }
  validates :position, presence: true, uniqueness: {scope: :user}, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
  
  scope :ordering, ->{ order(:position) }
  scope :full, ->{includes(:user)}
  
  before_validation :set_default_position


  def set_default_position
    if self.user
      self.position ||= self.user.attachments.maximum(:position).to_i + 1
    end
    true
  end
  
end
