class AddEnableToProjects < ActiveRecord::Migration[8.0]
  def change
  	add_column :projects, :enabled, :boolean, default: true
  end
end

