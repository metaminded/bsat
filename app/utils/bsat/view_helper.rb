module Bsat

  class ViewHelper

    def initialize(helper)
      @helper  = helper
      @content = "".html_safe
    end

    def render
      @content
    end

  private

    def method_missing(name, *args, &block)
      @helper.send(name, *args, &block)
    end

  end

end
