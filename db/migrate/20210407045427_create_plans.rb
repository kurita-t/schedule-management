class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :site_name, null: false
      t.string :place
      t.integer :period
      t.datetime :start_time
      t.string :number_of_people
      t.text :belongings
      t.integer :phone_number
      t.string :car
      t.integer :prefecture_id
      t.references :user, null: false, foregin_key: true
      t.timestamps
    end
  end
end
