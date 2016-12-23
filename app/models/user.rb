class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin,:developer]
  
  before_create :set_role

  def is_admin?
    role.eql?('admin')
  end

  def set_role
    self.role = 'developer'
  end
end
