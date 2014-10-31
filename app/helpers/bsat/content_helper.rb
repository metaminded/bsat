module Bsat
  module ContentHelper

    def bsat(content)
      bsat_content(content)
      render template: 'layouts/bsat'
    end

    def bsat_content(content = nil, &block)
      content_for(:bsat_content) do
        content_tag(:div, class: 'container-fluid') do
          block_given? ? capture(&block) : content
        end
      end
    end

    def bsat_brand(path: nil, title: nil, &block)
      content_for(:bsat_brand, block_given? ? capture(&block) : title)
      content_for(:bsat_brand_path, path) if path.present?
    end

    def bsat_sidebar_nav(side: :left)
      sidebar_nav = SidebarNav.new(self, options: { side: side })
      yield(sidebar_nav) if block_given?
      content_for("bsat_#{side.to_s}_sidebar_nav_items".to_sym, sidebar_nav.render)
    end

    def bsat_page_title(title = nil, &block)
      content_for(:bsat_page_title, block_given? ? capture(&block) : title)
    end

    def bsat_page_subtitle(subtitle = nil, &block)
      content_for(:bsat_page_subtitle, block_given? ? capture(&block) : subtitle)
    end

    def bsat_page_actions
      page_actions = PageActions.new(self)
      yield(page_actions) if block_given?
      content_for(:bsat_page_actions, page_actions.render(:large))
      content_for(:bsat_small_page_actions, page_actions.render(:small))
    end

    def bsat_navbar(location)
      navbar_items = Navbar.new(self)
      yield(navbar_items) if block_given?

      location = [:left, :right].find(->{:right}){|l| l == location.try(:to_sym)}
      case location
        when :left  then content_for(:bsat_navbar_left_items, navbar_items.render)
        when :right then content_for(:bsat_navbar_right_items, navbar_items.render)
      end
    end

    def bsat_nested_form_fields(f, &block)
      content_tag(:div, class: 'panel panel-default') do
        concat(
          content_tag(:div, class: 'panel-heading') do
            content_tag(:div, f.object.class.model_name.human, class: 'panel-title')
          end
        )
        concat(
          content_tag(:div, class: 'panel-body') do
            yield
          end
        )
        concat(
          content_tag(:div, class: 'panel-footer') do
            f.link_to_remove(class: 'btn btn-default btn-sm') do
              concat(fa_icon(:minus))
              concat(' ')
              concat(t('action.nested_form.remove', klass: f.object.class.model_name.human))
            end
          end
        )
      end
    end
  end
end
