module RedmineRtmaterial
  class ProjectListener < Redmine::Hook::ViewListener
    def view_projects_form(context)
      p = context[:project]
      f = context[:form]
      content_tag(:p, f.select(:rtmaterial_color_scheme, p.color_scheme_options, :include_blank => p.color_scheme_blank_option)) +
      content_tag(:p, f.select(:rtmaterial_change_icon, p.change_icon_options, :include_blank => p.change_icon_blank_option))
    end
  end
end
