class AddReasonToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :reason, :string, default: "Evento"
  end
end
