class AddAttemptedAndCorrectToCards < ActiveRecord::Migration
  def change
    add_column :cards, :attempted, :integer, default: 0
    add_column :cards, :correct, :integer, default: 0
  end
end
