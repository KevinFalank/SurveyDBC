class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :answer
      t.belongs_to :participant

      t.timestamps
    end
  end
end
