class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, :description, :rating, :total_gross, :cast, :director, :duration, presence: true
  validates :description, length: {minimum: 100}
  validates :total_gross, numericality: {greater_than_or_equal_to: 0}
  RATINGS = %w(G PG PG-13 R NC-17 X)
  validates :rating, inclusion: { in: RATINGS }

  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|png|jpg|jpeg)\z/i,
    message: "Must be a GIF, PNG, JPG, or JPEG file!"
  }

  def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
  end

  def self.hits
    where('total_gross >= 300000000').order(total_gross: :desc)
  end

  def self.flops
    where('total_gross < 50000000').order(total_gross: :asc)
  end

  def self.recently_added
    order('created_at desc').limit(20)
  end

  def flop?
    total_gross.blank? || total_gross < 50000000
  end

  def average_stars
    reviews.average(:stars)
  end
end
