# frozen_string_literal: true

class AddDefaultValueToTaskStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :status, :boolean, default: false
  end
end
