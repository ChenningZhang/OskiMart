class ClosedPost < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, PostspicsUploader
	
end
