class AddLocationProfiles < ActiveRecord::Migration
  def up
    Profile.create(name:"admin_ashram")
    Profile.create(name:"admin_morada")
  end
  
  def down
    Profile.where(name:"admin_ashram").first.destroy
    Profile.where(name:"admin_morada").first.destroy
  end
end
