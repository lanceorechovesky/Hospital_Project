class users::registrationsController < Devise::registrationsController
  def edit
    = javascript_include_tag params[:registrations]
  end
end
