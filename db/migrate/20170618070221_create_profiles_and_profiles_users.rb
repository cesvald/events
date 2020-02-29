class CreateProfilesAndProfilesUsers < ActiveRecord::Migration[4.2]
  def change
    
    create_table :profiles do |t|
      t.string :name
    end
    
    create_table :profiles_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :profile, index: true
    end
    
  end
end