class ChangeColumnDuration < ActiveRecord::Migration[7.0]
  def up
    change_column :appointments, :duration, :string
  end

  def down
    add_column :appointments, :duration, :integer
  end

end
