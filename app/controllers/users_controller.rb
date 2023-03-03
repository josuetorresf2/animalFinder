class UsersController < ApplicationController



    # def create
    #     #@animal = Animal.new(animal_params)
    #     @user = User.new(user_params)
    #     respond_to do |format|
    #         if @user.save
    #         format.html { redirect_to user_url(@user), notice: "User was successfully created." }
    #         format.json { render :show, status: :created, location: @user }
    #         else
    #         format.html { render :new, status: :unprocessable_entity }
    #         format.json { render json: @user.errors, status: :unprocessable_entity }
    #         end
    #     end
    def index

      @users = User.all

    end
    

    def show
      @user = current_user
      id = params[:id]

      @animals = @user.animals
        #@user = User.find(params[:id])
    end

    # def update
    #     respond_to do |format|
    #       if @user.update(user_params)
    #         format.html { redirect_to user_url(@user), notice: "Profile was successfully updated." }
    #         format.json { render :show, status: :ok, location: @user }
    #       else
    #         format.html { render :edit, status: :unprocessable_entity }
    #         format.json { render json: @user.errors, status: :unprocessable_entity }
    #       end
    #     end
        
    #   end

    #   def edit
    #     respond_to do |format|
    #       if @user.update(user_params)
    #         format.html { redirect_to user_url(@user), notice: "Profile was successfully updated." }
    #         format.json { render :show, status: :ok, location: @user }
    #       else
    #         format.html { render :edit, status: :unprocessable_entity }
    #         format.json { render json: @user.errors, status: :unprocessable_entity }
    #       end
    #     end
    #   end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      # def user_params
      #   params.require(:user).permit(:name, :email, :password)
      # end
end
