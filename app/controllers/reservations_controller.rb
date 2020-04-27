class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorization_check
  # GET /reservations
  # GET /reservations.json
  def index
      @reservations = Reservation.all
    # @reservations = Reservation.where(status: 'process')
    respond_to do |format|
         format.html
         format.pdf { render template: 'reservations/comprobante', pdf: 'comprobante'}
       end

  end

  def bookings
    @reservations = Reservation.all
  end
  # GET /reservations/1
  # GET /reservations/1.json
  def show

  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @space = Space.where(slug: params[:type]).first
  end

  # GET /reservations/1/edit
  def edit
    @space = @reservation.tables.first.space
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    tables_available_total= Table.where(available: true).where(space_id: Space.where(slug: params[:location]).first.id).count
    ######
    cantidad_mesas = ((@reservation.quantity - 2) / 2.to_f).ceil
    if tables_available_total >= 1 && @reservation.quantity <= 4
      tables_availables = Table.where(available: true).where(space_id: Space.where(slug: params[:location]).first.id).limit(1)
      tables_availables.each do |table_available|
        @reservation.tables << table_available
        #table_available.available = 0
        table_available.save
      end
      @reservation.save
      redirect_to reservation_path(@reservation), notice: 'La reserva ha sido realizada'
    elsif @reservation.quantity > 4 && cantidad_mesas <= tables_available_total
      tables_availables = Table.where(available: true).where(space_id: Space.where(slug: params[:location]).first.id).limit(cantidad_mesas.to_i)
      tables_availables.each do |table_available|
        @reservation.tables << table_available
        #table_available.available = 0
        #table_available.save
      end
      @reservation.save
      redirect_to reservation_path(@reservation), notice: 'La reserva ha sido realizada'
    else
      redirect_to spaces_path, alert: 'La reserva no pudo ser realizada'
    end
  end
  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update

    tables_availables = @reservation.tables

    if params[:reservation][:status] == 'process'

      tables_availables.each do |table_available|
        table_available.available = 0
        table_available.save
      end
    else

      tables_availables.each do |table_available|
        table_available.available = 1
        table_available.save
      end
      respond_to do |format|

        if @reservation.update(reservation_params)
          flash.now[:notice] = "La reserva a nombre #{@reservation.title} fue actualizada correctamente"
          format.html { redirect_to @reservation }
          format.json { render :show, status: :ok, location: @reservation }
          format.js
        else
          format.html { render :edit }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
          format.js
        end
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
    params.require(:reservation).permit(:start_date, :quantity, :telephone, :commentary, :status)

  end
end
