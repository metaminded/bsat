module Bsat

  class ViewHelper

    attr_reader :helper

    def initialize(helper)
      @helper  = helper
      @content = "".html_safe
    end

    def render
      @content
    end

  protected

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

  private

    def method_missing(name, *args, &block)
      @helper.send(name, *args, &block)
    end

  end

end
