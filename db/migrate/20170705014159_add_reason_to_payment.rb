class AddReasonToPayment < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :reason, :string, default: "Evento"
  end
end
