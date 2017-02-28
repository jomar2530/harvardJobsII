class ApplicantsController < ApplicationController
	before_filter :authorize, only: [:index]
  def index
  end
end
