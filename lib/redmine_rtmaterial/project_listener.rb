module RedmineMaterial
  class ProjectListener < Redmine::Hook::ViewListener
    def view_projects_form(context)
      p = context[:project]
      f = context[:form]
      content_tag(:p, f.select(:rtmaterial_color_scheme, ::COLOR_SCHEME.map {|n| [n, n.to_s]}, :include_blank => p.blank_option
#"#{l(:label_global_setting)} (#{Setting.plugin_redmine_rtmaterial['default_colors']})",
      )) +
      content_tag(:p, f.check_box(:rtmaterial_change_icon, :label => :setting_rtmaterial_change_icon))
    end
  end
end
