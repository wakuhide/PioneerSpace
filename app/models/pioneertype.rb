class Pioneertype < ActiveRecord::Base

  has_many :pioneertype_images
  has_many :comments
  has_many :likes, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :pioneertype_images, reject_if: :image_blank?
  acts_as_taggable

    def image_blank?(attributed)
      attributed['image'].blank?
    end

    def fetch_sub_image(num)
      pioneertype_images.sub[num]
    end

    def fetch_main_image
      pioneertype_images.main[0]
    end
end
