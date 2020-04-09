class ReservationsController < ApplicationController
  before_action :spaces, only: [:new, :create]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create

    #@reservation = Reservation.new(reservation_params)
    @reservations = Reservation.where(start_date: reservation_params[:start_date], end_date: reservation_params[:end_date])
    @tables = Table.joins(:space).where("spaces.slug IN (?)", @space)
    array_table = @tables.map { |table| table.id }
    array_reservation = @reservations.map { |reservation| reservation.table_id}
    array_available = array_table - array_reservation

    number_table = reservation_params[:quantity].to_i / 4 == 0 ? 1 : reservation_params[:quantity].to_i / 4



    @reservation = Reservation.new(
       quantity: reservation_params[:quantity],
       telephone: reservation_params[:telephone],
       commentary: reservation_params[:commentary],
       #start_date: (Time.current +1.hour).to_s,
       start_date: reservation_params[:start_date],
       #end_date: (Time.current +2.hour).to_s,
       end_date: reservation_params[:end_date],
       table_id: 3
       #table_id: array_available[0].to_i

     )
     byebug


    # if reservation_params[:quantity].to_i  <= 4 && array_available.length > 0
    #   @reservation = Reservation.new(
    #     quantity: reservation_params[:quantity],
    #     telephone: reservation_params[:telephone],
    #     commentary: reservation_params[:commentary],
    #     start_date: "2020-04-09 00:43 AM",
    #     #start_date: reservation_params[:start_date],
    #     end_date: "2020-04-09 02:43 AM",
    #     #end_date: reservation_params[:end_date],
    #     table_id: array_available[0]
    #   )
    # byebug
    # @reservation.save
    # else
    #   if reservation_params[:quantity].to_i > 4 && array_available.length > 2 && number_table < array_available.length
    #     number_table.times do |i|
    #       table_actual = array_available[i]
    #       @reservation = Reservation.new(
    #         quantity: reservation_params[:quantity],
    #         telephone: reservation_params[:telephone],
    #         commentary: reservation_params[:commentary],
    #         start_date: "2020-04-09 00:43 AM",
    #         #start_date: reservation_params[:start_date],
    #         end_date: "2020-04-09 02:43 AM",
    #         #end_date: reservation_params[:end_date],
    #         table_id: table_actual
    #       ).save
    #
    #     end
    #   else
    #     #aqui le mando la respuesta de error al usuario en la vista.
    #   end
    #
    # end
  end

  def spaces
    @space = params[:format]
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :quantity, :telephone, :commentary, :space)
  end
end
