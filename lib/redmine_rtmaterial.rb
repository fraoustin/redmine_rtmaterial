require 'redmine_rtmaterial/project_patch'
require 'redmine_rtmaterial/setting_patch'

module RedmineMaterial
  def self.apply_patch
    ::Project.send :include, ProjectPatch
    ::Setting.singleton_class.prepend SettingPatch
  end

  module Hooks
    class ViewLayoutsBaseContentHook < Redmine::Hook::ViewListener
      include Redmine::I18n
      render_on(:view_layouts_base_content, :partial => 'layouts/view_layouts_base_content', :layout => false)
    end
  end
end