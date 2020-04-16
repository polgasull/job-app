class CreateUserTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_types do |t|
      t.string :name
      t.string :internal_name

      t.timestamps
    end
  end
end