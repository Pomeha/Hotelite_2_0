class AddAasmStateToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :aasm_state, :string
  end
end
