class AddInformationToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :country, :string
    add_column :guests, :city, :string
    add_column :guests, :phone_number, :string
    add_column :guests, :mobile_number, :string
    add_column :guests, :identification, :string
    add_column :guests, :civil_status, :string
    add_column :guests, :profession, :string
    add_column :guests, :nationality, :string
    add_column :guests, :health_condition, :text
    add_column :guests, :receive_drug, :text
    add_column :guests, :symptoms, :text
    add_column :guests, :contact_name, :string
    add_column :guests, :contact_kin, :string
    add_column :guests, :contact_number, :string
    add_column :guests, :hotel, :string
    add_column :guests, :local_number, :string
    add_column :guests, :comments, :text
  end
end
