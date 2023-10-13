class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :user_data_treatment, only: %i[create update]
  # GET /users or /users.json
  def index
    @users = User.all.order(:name)
    if params[:query].present?
      query_string = string_treatment(params[:query])
      sql_subquery = <<~SQL
        name LIKE :query
        OR email LIKE :query
        OR phone LIKE :query
        OR cpf LIKE :query
      SQL
      @users = @users.where(sql_subquery, query: "%#{query_string}%").order(:name)
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'Usuário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário deletado.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :phone, :cpf)
  end

  # Exclude from CPF and phone numbers digits that are nor numbers
  def user_data_treatment
    params[:user][:cpf] = params[:user][:cpf].gsub(/\D/, '')
    params[:user][:phone] = params[:user][:phone].gsub(/\D/, '')
  end

  # Check the query string and clean it if user included pontucation on phone and cpf
  def string_treatment(string)
    # exclude all characters that can be on a phone or cpf string
    clean_string = string.gsub(/(\(|\)|-|\.|\s)/, "")
    # checks if there are still non-digit characters and returns the treated or untreated string
    clean_string.match?(/\D/) ? string : clean_string
  end
end
