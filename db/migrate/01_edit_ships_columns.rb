class EditShipsColumns < ActiveRecord::Migration
  def change
    change_column :ships, :lat, :decimal, :precision => 6, :scale => 2
    change_column :ships, :long, :decimal, :precision => 6, :scale => 2
  end
end
