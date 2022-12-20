class Task < ApplicationRecord
	audited
	before_create :generate_token

  belongs_to :user, optional: true

  default_scope {where(delist: false)}

  enum status: { pending: false, completed: true } 
  
  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Task.exists?(token: random_token)
    end
  end
end
