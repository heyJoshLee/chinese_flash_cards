class LoggedInController < ApplicationController
  before_action :check_if_logged_in


  private 

  def check_if_logged_in
    if !logged_in?
      flash[:danger] = "You must be signed in to access that page. Please log in."
      redirect_to sign_in_path
    end
    
  end

end