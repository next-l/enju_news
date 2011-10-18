class NewsPost < ActiveRecord::Base
  scope :published, :conditions => ['draft IS false']
  default_scope order('id DESC')
  belongs_to :user
  belongs_to :required_role, :class_name => 'Role', :foreign_key => 'required_role_id', :validate => true

  validates_presence_of :title, :user_id, :url, :start_date
  validates_associated :user

  acts_as_list

  def self.per_page
    10
  end
end
