module Bsat
  class PageActions < ViewHelper

    def initialize(helper)
      super(helper)
      @large_actions = []
      @small_actions = []
    end

    def render
      @content << content_tag(:div) do
        concat(content_tag(:div, @large_actions.join(' ').html_safe, class: 'large'))
        concat(
          content_tag(:div, class: 'small') do
            content_tag(:div, class: 'btn-group pull-right') do
              concat(
                content_tag(:button, class: 'btn btn-default dropdown-toggle', type: 'button', data: {toggle: 'dropdown'}) do
                  concat(fa_icon('cog'))
                  concat(content_tag(:span, nil, class: 'caret'))
                end
              )

              concat(
                content_tag(:ul, class: 'dropdown-menu', role: 'menu') do
                  @small_actions.join.html_safe
                end
              )
            end
          end
        )
      end
    end

    def add(label, path, icon: nil, link_to_options: {})
      add_large_actions(label, path, icon, link_to_options)
      add_small_actions(label, path, icon, link_to_options)
    end

  private

    def add_large_actions(label, path, icon, link_to_options)
      @large_actions << link_to(path, link_to_options.reverse_merge(class: 'btn btn-default')) do
        concat(fa_icon(icon)) if icon.present?
        concat(label)
      end
    end

    def add_small_actions(label, path, icon, link_to_options)
      @small_actions << content_tag(:li) do
        link_to(path, link_to_options) do
          concat(fa_icon(icon)) if icon.present?
          concat(label)
        end
      end
    end

  end
end
