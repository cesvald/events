class AddLocationProfiles < ActiveRecord::Migration
  def up
    Profile.create(name:"hoster_ashram")
    Profile.create(name:"hoster_morada")
  end
  
  def down
    Profile.where(name:"hoster_ashram").first.destroy
    Profile.where(name:"hoster_morada").first.destroy
  end
end
