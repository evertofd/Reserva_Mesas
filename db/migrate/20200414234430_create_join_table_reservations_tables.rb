class CreateJoinTableReservationsTables < ActiveRecord::Migration[5.1]
  def change
    create_join_table :reservations, :tables do |t|
      # t.index [:reservation_id, :table_id]
      # t.index [:table_id, :reservation_id]
    end
  end
end
