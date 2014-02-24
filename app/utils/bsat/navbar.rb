module Bsat
  class Navbar < ViewHelper

    def link(label, path, icon: nil, badge: nil, active: nil, link_to_options: {})
      @content << content_tag(:li, class: (active?(active) ? 'active' : nil)) do
        link_to(path, link_to_options) do
          concat(fa_icon(icon)) if icon.present?
          if label.present?
            concat(' ') if icon.present?
            concat(
              content_tag(:span, label)
            )
          end
          if badge.present?
            concat(' ')
            concat(content_tag(:span, badge, class: 'badge'))
          end
        end
      end
    end

    def dropdown(label, icon: nil)
      dropdown = NavbarDropdown.new(label, icon, helper)
      yield(dropdown) if block_given?
      @content << dropdown.render
    end

  end


  class NavbarDropdown < ViewHelper

    def initialize(label, icon, helper)
      super(helper)
      @label = label
      @icon  = icon
    end

    def link(label, path, icon: nil, link_to_options: {})
      @content << content_tag(:li) do
        link_to(path, link_to_options) do
          concat(fa_icon(icon)) if icon.present?
          if label.present?
            concat(' ') if icon.present?
            concat(
              content_tag(:span, label)
            )
          end
        end
      end
    end

    def divider
      @content << content_tag(:li, nil, class: 'divider')
    end

    def render
      content_tag(:li, class: 'dropdown') do
        concat(
          link_to('#', class: 'dropdown-toggle', data: {toggle: 'dropdown'}) do
            concat(fa_icon(@icon)) if @icon.present?
            if @label.present?
              concat(' ') if @icon.present?
              concat(
                content_tag(:span, @label)
              )
            end
            concat(content_tag(:b, nil, class: 'caret'))
          end
        )

        concat(
          content_tag(:ul, @content, class: 'dropdown-menu')
        )
      end
    end

  end
end
