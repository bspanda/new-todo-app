class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_display_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_display_string
  end

  def create
    user_name = params[:name]
    user_email = params[:email]
    user_pass = params[:password]
    new_user = User.create!(
      name: user_name,
      email: user_email,
      password: user_pass,
    )
    response_text = "hay, the new user is  : #{new_user.id}"
    render plain: response_text
  end

  def login
    user_email = params[:email]
    user_pass = params[:password]
    user = User.find_by(email: user_email, password: user_pass)
    render plain: user.present?
  end
end
