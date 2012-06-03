class NewsPost < ActiveRecord::Base
  attr_accessible :title, :body
  scope :published, where(:draft => false)
  default_scope order('news_posts.id DESC')
  belongs_to :user
  belongs_to :required_role, :class_name => 'Role', :foreign_key => 'required_role_id', :validate => true

  validates_presence_of :title, :body, :user_id
  validates_associated :user

  acts_as_list

  def self.per_page
    10
  end
end
