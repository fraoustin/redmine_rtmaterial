module RedmineMaterial
  module ProjectPatch
    extend ActiveSupport::Concern

    included do
      safe_attributes :rtmaterial_color_scheme, :rtmaterial_change_icon
    end

   def blank_option
     "#{l(:label_global_setting)} (#{Setting.plugin_redmine_rtmaterial['default_colors']})"
   end
  end
end
