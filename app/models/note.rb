class Note < ActiveRecord::Base
validates :title,  :presence => true
validates :content, :presence => true
validates :author,  :presence => true
validates :genre, :presence => true
validates_numericality_of :year, :greater_than => 1, :less_than => 2015

has_many :comments
acts_as_taggable
end
