class AddProductAvailability < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :availability, :string
  end
end
