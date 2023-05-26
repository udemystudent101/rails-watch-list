class Bookmark < ApplicationRecord
  # attr_reader :movie_id, :list_id

  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6 }

  private

  # def to_label
  #   Movie.find(self.movie).poster_url
  # end


end
