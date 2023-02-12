class RtmaterialAddChangeIconToProject < ActiveRecord::Migration[4.2]

  def self.up
    rename_column :projects, :rtmaterial_style, :rtmaterial_color_scheme
    add_column :projects, :rtmaterial_change_icon, :bool
  end

  # method called when installing the plugin
  def self.down
    rename_column :projects, :rtmaterial_color_scheme, :rtmaterial_style
    remove_column :projects, :rtmaterial_change_icon, :bool
  end

end
