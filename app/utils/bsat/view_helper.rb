module Bsat

  class ViewHelper

    attr_reader :helper

    def initialize(helper, options: {})
      @helper  = helper
      @options = options
      @content = "".html_safe
    end

    def render
      @content
    end

  protected

    def active?(active, not_active=nil)
      if not_active.present?
        if not_active.is_a?(Regexp)
          return false if request.path =~ not_active
        else
          raise "give a Regexp for not_active"
        end
      end
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
