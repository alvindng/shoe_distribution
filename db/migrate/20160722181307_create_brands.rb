class CreateBrands < ActiveRecord::Migration
  def change
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.timestamps
    end
  end
end
