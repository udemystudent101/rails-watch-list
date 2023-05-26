class Movie < ApplicationRecord

  before_destroy :check_children

  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  private

  def to_img
    image_tag(self.poster_url)
  end

  def check_children
    self.bookmarks.empty?
  end
end
