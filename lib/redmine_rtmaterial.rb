module RedmineMaterial
  module Hooks
    class ViewLayoutsBaseContentHook < Redmine::Hook::ViewListener
      include Redmine::I18n      
      render_on(:view_layouts_base_content, :partial => 'layouts/view_layouts_base_content', :layout => false)
    end
  end
end