module Bsat
  class SidebarNav < ViewHelper

    def back(label, path, link_to_options: {})
      @content << content_tag(:li) do
        link_to path, link_to_options do
          concat(fa_icon('chevron-left'))
          concat(label)
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
          concat(label)
          concat(
            content_tag(:span, class: 'sublevel-indicator') do
              fa_icon('chevron-right')
            end
          ) if has_sublevel.present?
          concat(content_tag(:span, badge, class: 'badge')) if badge.present?
        end
      end
    end

  private

    def active?(active)
      if active.present?
        if active.is_a?(Regexp)
          request.path =~ active
        else
          true
        end
      else
        false
      end
    end

  end
end
