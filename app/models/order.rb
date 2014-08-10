class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  after_create :send_confirmation_email

  def send_confirmation_email
  	OrderMailer.confirmation(self).deliver
  end
end
