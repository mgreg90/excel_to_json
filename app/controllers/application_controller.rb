class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def not_found
    flash[:alert] = "Page not found!"
    redirect_to new_excel_path
  end
  
  def valid_id?(id)
    id.to_i.to_s == id.to_s
  end

end
