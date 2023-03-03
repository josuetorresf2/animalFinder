# frozen_string_literal: true

class FindersReflex < ApplicationReflex
  def add(name)
    Finder.create(name: name)
  end

end
