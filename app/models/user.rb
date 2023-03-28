class User < ApplicationRecord
  has_secure_password
  has_many :capitalizacions
  has_many :ivas
  has_many :ahorro_seguridad_socials
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
  validates :nombre, presence: true, uniqueness: true, format: {
    with: /\A[a-z-A-Z]+\z/,
    message: :invalid
  }
  before_save :downcase_attributes

  def downcase_attributes 
    self.email = email.downcase
  end
end
