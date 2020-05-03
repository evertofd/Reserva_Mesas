class MenuController < ApplicationController
  skip_authorization_check only: [:index, :bebidas, :comida]
  def index
  end

  def bebidas
  end

  def comida
  end
end
