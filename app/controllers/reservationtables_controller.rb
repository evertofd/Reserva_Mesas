class ReservationtablesController < ApplicationController
  def index

      @reservations = current_user.reservations

  end
end
