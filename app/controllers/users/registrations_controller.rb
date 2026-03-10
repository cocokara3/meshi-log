class Users::RegistrationsController < Devise::RegistrationsController
  before_action :require_non_guest, only: [:destroy]
end