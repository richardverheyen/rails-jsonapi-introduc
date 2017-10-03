class CreateUserTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :tagline
      t.string :image
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
