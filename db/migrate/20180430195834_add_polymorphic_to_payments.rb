class AddPolymorphicToPayments < ActiveRecord::Migration
  def up
    add_reference :payments, :payable, polymorphic: true, index: true
    Payment.all.each do |p|
      p.payable_id = p.participant_id
      p.payable_type = 'Participant'
      p.save
    end
    remove_column :payments, :participant_id
  end
  
  def down
    add_reference :payments, :participant, index: true
    Payment.where(payable_type: 'Participant').each do |p|
      p.participant_id = p.payable_id
      p.save
    end
    remove_column :payments, :payable_id, :integer
    remove_column :payments, :payable_type, :string
  end
end
