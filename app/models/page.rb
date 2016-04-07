class Page < ActiveRecord::Base
  @keywords_regex = /^([a-z])(,\s*[a-z]+)*$/i
  
  validates :name, presence: true, length: {minimum: 2, maximum: 25}
  validates :short_name, presence: true, length: {minimum: 2, maximum: 10}
  validates :title, presence: true, uniqueness: true ,length: {minimum: 2, maximum: 25}
  validates :meta_keywords, presence: true, allow_blank: true, format: {:with => @keywords_regex, :message => ': ' + I18n.t('invalKeyWords'), :multiline => true}
  validates :meta_description, presence: false
  validates :index, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  
  scope :ordering,->{order(:index)}
  
end
