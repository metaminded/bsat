module Bsat
  class PageActions < ViewHelper

    def initialize(helper)
      super(helper)
      @large_actions = []
      @small_actions = []
    end

    def render(type)
      if (type == :large)
        @large_actions.join('').html_safe
      elsif (type == :small)
        @small_actions.join.html_safe
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
        if label.present?
          concat(' ') if icon.present?
          concat(
            content_tag(:span, label)
          )
        end
      end
    end

    def add_small_actions(label, path, icon, link_to_options)
      @small_actions << content_tag(:li) do
        link_to(path, link_to_options.except(:class)) do
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

  end
end
