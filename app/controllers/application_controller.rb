class ApplicationController < ActionController::API
  before_action :set_user

  def set_user
    @user = User.find_by! mac_address: params[:mac_address]
  end
end
