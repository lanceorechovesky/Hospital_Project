class HomeController < ApplicationController
  def title
    @patient = Patient.all
  end
end
