class Animal < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    
    def self.get_possible_species
	    return %w[Dog Cat Hamster Snake Bird Bunny]
  end

  def self.get_possible_sizes
    return %w[Tiny Small Medium Large Huge GiganticGodzilla]
  end

  def self.get_possible_lost
    return %w[Lost]
  end
  def self.get_possible_found
    return %w[Found]
  end
end
#Animal.new.image.attached? # => false
