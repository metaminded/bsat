module Bsat
  module ApplicationHelper

    def bsat_content_area_class
      "no-sidebar" if content_for?(:bsat_sidebar_nav_items).blank?
    end

  end
end
