class Post < ActiveRecord::Base
belongs_to :user		
  has_attached_file :image, 
  	styles: {  thumb:  "300x300>" },
  	storage: :s3, s3_credentials: {
  		bucket: 'instagram_fitsum',
  		access_key_id: Rails.application.secrets.s3_access_key,
		secret_access_key: Rails.application.secrets.s3_secret_key
  	}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

