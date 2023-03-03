class DisplayMesssages

    # Empty Message Method
    def not_displaying
        ""
    end

    # Lost Pet Message Method
    def display_lost
        "Recently lost pet"
    end

    # Found Pet Message Method
    def display_found
        "Recently found pet"
    end

    # Add pet's name, breed and location into messages to display
    def initialize(name, breed, location)
    # Name, Breed or Location can't be empty when report a lost or found pet
    raise ArgumentError if name.empty? || breed.empty? || locaiton.empty?
    @name = name
    @breed = breed
    @locaiton = locaiton
    end

    # Read input
    attr_reader :name
    attr_reader :breed
    attr_reader :locaiton

    # For writer method
    attr_writer :name
    attr_writer :breed
    attr_writer :locaiton

    # Lost/Found pet messsage with name, location and breed
    # Still working on it
    def lost_pet
        "Recently lost $name, at $location, and it is a $breed", @name, @location, @breed)
    end

    def found_pet
        "Recently found $name, at $location, and it is a $breed", @name, @location, @breed)
    end


end
