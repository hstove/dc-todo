class List < ActiveRecord::Base
  validates :name, :presence => true
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  
  has_many :tasks , :dependent => :destroy
  belongs_to :user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def done_tasks
     tasks.where(:done => true, :user_id => self.user_id).order("updated_at DESC")
  end
  
end
