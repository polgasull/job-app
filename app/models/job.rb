class Job < ApplicationRecord
  extend Filter

  belongs_to :user
  belongs_to :category
  belongs_to :job_type
  belongs_to :level
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :inscriptions
  mount_uploader :avatar, AvatarUploader

  validates :reference, uniqueness: true

  geocoded_by :location
  after_validation :geocode
  
  scope :search_for, -> (query) { 
    where('LOWER(jobs.title) LIKE :query OR 
          LOWER(jobs.job_author) LIKE :query OR 
          LOWER(jobs.description) LIKE :query OR
          LOWER(jobs.location) LIKE :query', 
          query: "%#{query.downcase}%") 
  }

  scope :search_my_jobs, -> (query) { 
    where('LOWER(jobs.title) LIKE :query OR 
          LOWER(jobs.reference) LIKE :query OR 
          LOWER(jobs.job_author) LIKE :query OR 
          LOWER(jobs.description) LIKE :query OR
          LOWER(jobs.location) LIKE :query', 
          query: "%#{query.downcase}%") 
  }

  scope :by_category, -> (category) {
    joins(:category).
    where('categories.id = ?', category)
  }

  scope :by_job_type, -> (job_type) {
    joins(:job_type).
    where('job_types.id = ?', job_type)
  }

  scope :by_level, -> (level) {
    joins(:level).
    where('levels.id = ?', level)
  }

  scope :my_jobs, -> (current_user_id) {
    where(user_id: current_user_id)
  }

  scope :is_remote, -> (value) {
    where(remote_ok: value)
  }

  def self.not_expired
    where('expiry_date >= ?', Date.today)
  end

  def self.expired
    where('expiry_date < ?', Date.today)
  end

  def is_active?
    expiry_date >= Date.today
  end

  def is_expired?
    expiry_date < Date.today
  end

  def user_creator(current_user_id)
    user_id == current_user_id
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{ |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect{ |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def tag_list 
    self.tags.collect do |tag| 
      tag.name
    end.join(", ")
  end

  def self.order_list(sort_order)
    if sort_order == "newest" || sort_order.blank?
      order(created_at: :desc)
    elsif sort_order == "by_title"
      order(title: :asc)
    else 
      order(created_at: :asc)
    end
  end
end