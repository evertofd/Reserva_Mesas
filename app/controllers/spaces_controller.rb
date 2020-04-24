class SpacesController < ApplicationController
load_and_authorize_resource
skip_authorization_check
  def index
      @spaces = Space.all
  end
end
