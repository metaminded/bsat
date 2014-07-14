module Bsat
  class SidebarNav < ViewHelper

    def render(plain = false)
      return @content if plain
      content_tag(:ul, class: 'nav nav-stacked nav-pills') { @content }
    end

    def back(label, path, link_to_options: {})
      @content << content_tag(:li) do
        link_to path, link_to_options do
          concat(fa_icon('chevron-left'))
          if label.present?
            concat(' ')
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

    def link(label, path, icon: nil, badge: nil, active: nil, has_sublevel: nil, link_to_options: {})
      @content << content_tag(:li, class: (active?(active) ? 'active' : nil)) do
        link_to path, link_to_options do
          concat(fa_icon(icon)) if icon.present?
          if label.present?
            concat(' ') if icon.present?
            concat(
              content_tag(:span, label)
            )
          end
          concat(
            content_tag(:span, class: 'sublevel-indicator') do
              fa_icon('chevron-right')
            end
          ) if has_sublevel.present?
          concat(content_tag(:span, badge, class: 'badge')) if badge.present?
        end
      end
    end

    def subnav(label, path)
      @content << content_tag(:li, class: 'subnav') do
        subnav = SidebarNav.new(self)
        subnav.back(label, '#', link_to_options: { class: 'subnav-back' })
        yield(subnav)
        content_for(
          "bsat_#{@options[:side]}_sidebar_nav_items".to_sym,
          content_tag(:ul, id: path, class: 'subnav-menu nav nav-stacked nav-pills hidden') { subnav.render(true) }
        )
        link_to("##{path}", class: 'subnav-toggle') do
          concat(
            content_tag(:span, label)
          )
          concat(
            content_tag(:span, class: 'sublevel-indicator') do
              fa_icon('chevron-right')
            end
          )
        end
      end
    end
  end
end
