class ApplicationController < ActionController::API
  before_action :set_user

  def set_user
    @user = User.find_or_initialize_by mac_address: params[:mac_address]
    @user.save! if @user.new_record?
  end
end
