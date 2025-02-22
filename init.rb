# encoding: utf-8


require 'redmine'

begin
  require 'config/initializers/session_store.rb'
  rescue LoadError
end

def init
  Dir::foreach(File.join(File.dirname(__FILE__), 'lib')) do |file|
    next unless /\.rb$/ =~ file
    require_dependency file
  end
end

if Rails::VERSION::MAJOR >= 5
  ActiveSupport::Reloader.to_prepare do
    init
  end
elsif Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    init
  end
else
  Dispatcher.to_prepare :redmine_rtmaterial do
    init
  end
end

Rails.application.config.to_prepare do
  RedmineRtmaterial.apply_patch
end

# for redmine 5
Rails.application.config.after_initialize do
  RedmineRtmaterial.apply_patch
end

Redmine::Plugin.register :redmine_rtmaterial do
  name 'Redmine RTMaterial'
  author 'Frederic Aoustin'
  description 'The redmine_rtmaterial: select color for theme rtmaterial'
  version '0.2.0'
  url 'https://github.com/fraoustin/redmine_rtmaterial'
  author_url 'https://github.com/fraoustin'
  requires_redmine :version_or_higher => '2.3.0'

  settings :default => {
    'default_colors' => "",
    'change_icon' => true,
  }, :partial => 'settings/rtmaterial'
end
