class MsConverter < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true

end
