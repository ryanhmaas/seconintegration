class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :account
  has_many :invoices, :dependent => :delete_all
  accepts_nested_attributes_for :invoices

  validates :password, :password_confirmation, presence: true, on: :create

  def display_name
    email
  end
end
