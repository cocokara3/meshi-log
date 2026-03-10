class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def require_non_guest
    if current_user&.guest?
      redirect_to root_path, alert: 'ゲストユーザーはこの操作はできません'
    end
  end
end