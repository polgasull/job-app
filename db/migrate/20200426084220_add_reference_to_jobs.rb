class AddReferenceToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :reference, :string
  end
end
