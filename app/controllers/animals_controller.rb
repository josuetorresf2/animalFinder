class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show edit update destroy ]
  #before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /animals or /animals.json
  def index
    @animals = Animal.all
    @all_species = Animal.get_possible_species
    @all_sizes = Animal.get_possible_sizes
    @all_lost = Animal.get_possible_lost
    @all_found = Animal.get_possible_found

    # If user has specified 1 or more ratings, then update session ratings
    unless params[:species].nil?
      @filtered_species = params[:species]
      session[:filtered_species] = @filtered_species
    end

    # If the user has specified a sorting mechanism, update session sorting mechanism
    if params[:sorting_mechanism].nil?
      # If user didn't specify a sorting mechanism, then we're going to sort by the
      # sorting mechanism in our sessions
    else
      session[:sorting_mechanism] = params[:sorting_mechanism]
    end

    # Remember user filter and sort
    if params[:sorting_mechanism].nil? && params[:species].nil? && session[:filtered_species]
      @filtered_species = session[:filtered_species]
      @sorting_mechanism = session[:sorting_mechanism]
      flash.keep
      redirect_to animals_path({order_by: @sorting_mechanism, species: @filtered_species})
    end

    # Filter movies based on rating if our sessions hash has any ratings in it
    if session[:filtered_species]
      @animals = @animals.select{ |animal| session[:filtered_species].include? animal.species }
    end
    


    # FILTER FOR SIZES
    unless params[:sizes].nil?
      @filtered_sizes = params[:sizes]
      session[:filtered_sizes] = @filtered_sizes
    end

    # If the user has specified a sorting mechanism, update session sorting mechanism
    if params[:sorting_mechanism].nil?
      # If user didn't specify a sorting mechanism, then we're going to sort by the
      # sorting mechanism in our sessions
    else
      session[:sorting_mechanism] = params[:sorting_mechanism]
    end

    # Remember user filter and sort
    if params[:sorting_mechanism].nil? && params[:sizes].nil? && session[:filtered_sizes]
      @filtered_sizes = session[:filtered_sizes]
      @sorting_mechanism = session[:sorting_mechanism]
      flash.keep
      redirect_to animals_path({order_by: @sorting_mechanism, sizes: @filtered_sizes})
    end

    # Filter movies based on rating if our sessions hash has any ratings in it
    if session[:filtered_sizes]
      @animals = @animals.select{ |animal| session[:filtered_sizes].include? animal.size }
    end
  

    # FILTER FOR LOST ANIMAL
    unless params[:lost].nil?
      @filtered_lost = params[:lost]
      session[:filtered_lost] = @filtered_lost
    end

    # If the user has specified a sorting mechanism, update session sorting mechanism
    if params[:sorting_mechanism].nil?
      # If user didn't specify a sorting mechanism, then we're going to sort by the
      # sorting mechanism in our sessions
    else
      session[:sorting_mechanism] = params[:sorting_mechanism]
    end

    # Remember user filter and sort
    if params[:sorting_mechanism].nil? && params[:lost].nil? && session[:filtered_lost]
      @filtered_lost = session[:filtered_lost]
      @sorting_mechanism = session[:sorting_mechanism]
      flash.keep
      redirect_to animals_path({order_by: @sorting_mechanism, lost: @filtered_lost})
    end

    # Filter movies based on rating if our sessions hash has any ratings in it
    if session[:filtered_lost]
      @animals = @animals.select{ |animal| session[:filtered_lost].include? animal.lost}
    end
  

    # FILTER FOR FOUND ANIMAL
    unless params[:found].nil?
      @filtered_found = params[:lost]
      session[:filtered_found] = @filtered_found
    end

    # If the user has specified a sorting mechanism, update session sorting mechanism
    if params[:sorting_mechanism].nil?
      # If user didn't specify a sorting mechanism, then we're going to sort by the
      # sorting mechanism in our sessions
    else
      session[:sorting_mechanism] = params[:sorting_mechanism]
    end

    # Remember user filter and sort
    if params[:sorting_mechanism].nil? && params[:found].nil? && session[:filtered_found]
      @filtered_found = session[:filtered_found]
      @sorting_mechanism = session[:sorting_mechanism]
      flash.keep
      redirect_to animals_path({order_by: @sorting_mechanism, found: @filtered_found})
    end

    # Filter movies based on rating if our sessions hash has any ratings in it
    if session[:filtered_found]
      @animals = @animals.select{ |animal| session[:filtered_found].include? animal.found}
    end
    
  end
  

  # GET /animals/1 or /animals/1.json
  def show
    #id = params[:id]
    #@animal = Animal.find(id)
  end

  # GET /animals/new
  def new
    #@animal = Animal.new
    @animal = current_user.animals.build
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals or /animals.json
  def create
    #@animal = Animal.new(animal_params)
    @animal = current_user.animals.build(animal_params)
    respond_to do |format|
      if @animal.save
        format.html { redirect_to animal_url(@animal), notice: "Animal was successfully created." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animal_url(@animal), notice: "Animal was successfully updated." }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /animals/1 or /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      if user_signed_in?
        format.html { redirect_to current_user, notice: "Animal was successfully removed." }
        format.json { head :no_content }
      else
        format.html { redirect_to animals_url, notice: "Animal was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def correct_user
    @animal = current_user.animals.find_by(id: params[:id])
    redirect_to animals_path, notice: "Not Authorized to Edit this Animal" if @animal.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:species, :breed, :size, :color, :image, :longitude, :latitude, :location, :lost, :found, :user_id, :user_name)
    end
end

