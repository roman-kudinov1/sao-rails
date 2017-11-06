class AddDefaultValueToProspect < ActiveRecord::Migration[5.1]
	def up
		change_column :prospects, :status, :integer, default: 0
	end

	def down
  		change_column :prospects, :status, :integer, default: nil
	end
end
