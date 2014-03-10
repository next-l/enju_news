class NewsPost < ActiveRecord::Base
  scope :published, -> {where(:draft => false)}
  default_scope {order('news_posts.start_date DESC')}
  belongs_to :user
  belongs_to :required_role, :class_name => 'Role', :foreign_key => 'required_role_id', :validate => true

  validates_presence_of :title, :body, :user_id
  validates_associated :user

  acts_as_list

  searchable do
    text :title, :body
    time :start_date, :end_date
  end

  def self.per_page
    10
  end
end

# == Schema Information
#
# Table name: news_posts
#
#  id               :integer          not null, primary key
#  title            :text
#  body             :text
#  user_id          :integer
#  start_date       :datetime
#  end_date         :datetime
#  required_role_id :integer          default(1), not null
#  note             :text
#  position         :integer
#  draft            :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  url              :string(255)
#

