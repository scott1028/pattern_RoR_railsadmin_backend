class Book < ActiveRecord::Base
	mount_uploader :cover, AvatarUploader
end
