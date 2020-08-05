class Products < ActiveRecord::Base
  acts_as_ordered_taggable_on :tag
end