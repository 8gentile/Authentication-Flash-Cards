class Prompt
  #user model questions
  def self.question1
    puts "validates :username, :password_digest, :session_token, presence: true"
    puts "validates :password, length: { minimum: 6, allow_nil: true }"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question2
    puts "attr_reader :password"
    puts "has_many :links"
    puts "has_many :comments"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question3
    puts "after_initialize :ensure_session_token"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question4
    puts "def self.find_by_credentials(username, password)"
    puts "  user = User.find_by(username: username)"
    puts "  return nil unless user && user.valid_password?(password)"
    puts "  user"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question5
    puts "def password=(password)"
    puts "  @password = password"
    puts "  self.password_digest = BCrypt::Password.create(password)"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question6
    puts "def valid_password?(password)"
    puts "  BCrypt::Password.new(self.password_digest).is_password?(password)"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question7
    puts "def reset_token!"
    puts "  self.session_token = SecureRandom.urlsafe_base64(16)"
    puts "  self.save!"
    puts "  self.session_token"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question8
    puts "private"
    puts "def ensure_session_token"
    puts "  self.session_token ||= SecureRandom.urlsafe_base64(16)"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end
  #end of user model

  #app controller
  def self.question9
    puts "protect_from_forgery with: :exception"
    puts "helper_method :current_user, :signed_in?"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question10
    puts "private"
    puts "def current_user"
    puts "  @current_user ||= User.find_by_session_token(session[:session_token])"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question11
    puts "def signed_in?"
    puts "  !!current_user"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question12
    puts "def sign_in(user)"
    puts "  @current_user = user"
    puts "  session[:session_token] = user.reset_token!"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question13
    puts "def sign_out"
    puts "  current_user.try(:reset_token!)"
    puts "  session[:session_token] = nil"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question14
    puts "def require_signed_in!"
    puts "  redirect_to new_session_url unless signed_in?"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end
  # end of app controller


  #sessions controller
  def self.question15
    puts "def new"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question16
    puts "def create"
    puts "  user = User.find_by_credentials("
    puts "  params[:user][:username],"
    puts "  params[:user][:password]"
    puts "  )"

    puts "  if user"
    puts "    sign_in(user)"
    puts "    redirect_to links_url"
    puts "  else"
    puts "    flash.now[:errors] = ['Invalid username or password']"
    puts "    render :new"
    puts "  end"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question17
    puts "def destroy"
    puts "  sign_out"
    puts "  redirect_to new_session_url"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  #user controller
  def self.question18
    puts "def new"
    puts "  @user = User.new"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question19
    puts "def create"
    puts "  @user = User.new(user_params)"
    puts "  if @user.save"
    puts "    sign_in(@user)"
    puts "    redirect_to links_url"
    puts "  else"
    puts "    flash.now[:errors] = @user.errors.full_messages"
    puts "    render :new"
    puts "  end"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end

  def self.question20
    puts "private"
    puts "def user_params"
    puts "  params.require(:user).permit(:password, :username)"
    puts "end"
    Prompt.assbar
    Prompt.answer_choices
  end
  
  def self.assbar
    puts "@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$"
    puts "@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$"
    puts "@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$"
  end

  def self.answer_choices
    puts "A) class User < ActiveRecord::Base"
    puts "B) class ApplicationController < ActionController::Base"
    puts "C) class SessionsController < ApplicationController"
    puts "D) class UsersController < ApplicationController"
  end
end
