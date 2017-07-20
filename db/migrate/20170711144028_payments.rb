class Payments < ActiveRecord::Migration
 
  def change
    change_table :payments do |t|
      t.references :payable, polymorphic: true, index: true
    end
  end
end

