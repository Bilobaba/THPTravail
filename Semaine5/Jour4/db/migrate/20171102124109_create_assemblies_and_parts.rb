class CreateAssembliesAndParts < ActiveRecord::Migration[5.1]
  def change
    create_table :assemblies_and_parts do |t|

      t.timestamps
    end
  end
end
