class Post < ActiveRecord::Base
belongs_to :user		
  has_attached_file :image, 
  	styles: {  thumb:  "300x300>" },
  	storage: :s3, s3_credentials: {
  		bucket: 'fitstekinstagramay',
  		access_key_id: Rails.application.secrets.s3_access_key,
		  secret_access_key: Rails.application.secrets.s3_secret_key
  	}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :likes
  has_and_belongs_to_many :tags
  def tag_names
  	# tags.map(&:name).join(', ')
  end

  def tag_names=(tag_list)
  	tag_list.split(',').each do |tag|
  		tags << Tag.find_or_create_by(name: tag)
  	end
  end

end

