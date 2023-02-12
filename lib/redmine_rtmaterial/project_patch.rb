module RedmineRtmaterial
  module ProjectPatch
    extend ActiveSupport::Concern

    included do
      safe_attributes :rtmaterial_color_scheme, :rtmaterial_change_icon
    end

   def rtmaterial_current_color_scheme
     rtmaterial_color_scheme.blank? ? Setting.plugin_redmine_rtmaterial['default_colors'] : rtmaterial_color_scheme
   end

   def rtmaterial_current_change_icon
     rtmaterial_change_icon.nil? ? Setting.plugin_redmine_rtmaterial['change_icon'] == "1" : rtmaterial_change_icon
   end

   def color_scheme_options
     ::COLOR_SCHEME.map {|n| [I18n.t("color_scheme_" + n.gsub("-","_")), "color-"+n.to_s]}
   end

   def color_scheme_blank_option
     "#{l(:label_global_setting)} #{I18n.t(Setting.plugin_redmine_rtmaterial['default_colors'].gsub('color','color_scheme').gsub('-','_'))}"
   end

   def change_icon_options
     [[I18n.t("true"),true],[I18n.t("false"),false]]
   end

   def change_icon_blank_option
     "#{l(:label_global_setting)} #{I18n.t(Setting.plugin_redmine_rtmaterial['change_icon'] == "1")}"
   end

  end
end
