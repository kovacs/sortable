require "sortable/version"

module Sortable
  # install the example app view path
  VIEW_PATH = File.join(File.dirname(__FILE__), 'views')
  ActionController::Base.append_view_path(VIEW_PATH) unless ActionController::Base.view_paths.include?(VIEW_PATH)

  if Rails.env == 'test'
    # only load the example files/routes in development mode
    # TODO easy way to load all controller/model paths instead? Don't know off the top of my head but am sure it's easy
    require File.join(File.dirname(__FILE__), 'example', 'controllers', 'cablecar', 'users_controller')
    require File.join(File.dirname(__FILE__), 'example', 'models', 'cablecar', 'user')
    require File.join(File.dirname(__FILE__), 'example', 'models', 'cablecar', 'contact_info')

    # install the routes
    require File.join(File.dirname(__FILE__), 'test', 'example_test_routing')

    VIEW_PATH = File.join(File.dirname(__FILE__), 'example', 'views')
    ActionController::Base.append_view_path(VIEW_PATH) unless ActionController::Base.view_paths.include?(VIEW_PATH)
  end

  require 'sortable/sortable_core'
  require 'sortable/sortable_helper'

  ActionView::Base.send(:include, SortableHelper)
  ActionController::Base.send(:include, Sortable)
end



