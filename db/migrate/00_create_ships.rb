class CreateShips< ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.integer :hour
      t.decimal :lat
      t.decimal :long
      t.integer :wdir
      t.decimal :wspd
      t.decimal :gst
      t.decimal :wvht
      t.decimal :dpd
      t.decimal :pres
      t.decimal :ptdy
      t.decimal :atmp
      t.decimal :wtmp
      t.decimal :dewp
      t.decimal :vis
    end
  end
end
