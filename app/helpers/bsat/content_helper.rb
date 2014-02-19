module Bsat
  module ContentHelper

    def bsat_brand(title, path: nil)
      content_for(:bsat_brand, title)
      content_for(:bsat_brand_path, path) if path.present?
    end

    def bsat_content(content = nil, &block)
      content_for(:bsat_content) do
        content_tag(:div, class: 'container-fluid') do
          block_given? ? capture(&block) : content
        end
      end
    end

    def bsat_sidebar_nav
      sidebar_nav = SidebarNav.new(self)
      yield(sidebar_nav) if block_given?
      content_for(:bsat_sidebar_nav_items, sidebar_nav.render)
    end

    def bsat_page_title(title)
      content_for(:bsat_page_title, title)
    end

    def bsat_page_actions
      page_actions = PageActions.new(self)
      yield(page_actions) if block_given?
      content_for(:bsat_page_actions, page_actions.render)
    end

  end
end
