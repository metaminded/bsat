module Bsat
  module ApplicationHelper

    def bsat_content_area_class
      "no-sidebar" if content_for?(:bsat_sidebar_nav_items).blank?
    end

    def bsat_sidebar_nav
      sidebar_nav = SidebarNav.new(self)
      yield sidebar_nav if block_given?
      content_for(:bsat_sidebar_nav_items, sidebar_nav.render)
    end

    def bsat_page_title(title)
      content_for(:bsat_page_title, title)
    end

  end
end
