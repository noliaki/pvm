class AddUserToTeam < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :user, index: true, foreign_key: true
  end
end
