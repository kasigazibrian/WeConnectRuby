# frozen_string_literal: true

# helper functions for the business controller
module BusinessesControllerConcern
  def search_for_business(business_name, location, category)
    if category.nil? && location.nil?

      return Business.search business_name, fields: [:business_name],
                                            match: :word_middle
    end
    if location && category
      return filter_by_location_category(business_name, location, category)
    end
    return filter_by_category(business_name, category) unless category.nil?

    filter_by_location(business_name, location) unless location.nil?
  end

  def filter_by_category(business_name, category)
    Business.search business_name, fields: %i[business_name],
                                   match: :word_middle,
                                   where: {
                                     category_id: category
                                   }
  end

  def filter_by_location(business_name, location)
    Business.search business_name, fields: %i[business_name],
                                   match: :word_middle,
                                   where: {
                                     business_location: location
                                   }
  end

  def filter_by_location_category(business_name, location, category)
    Business.search business_name, fields: %i[business_name],
                                   match: :word_middle,
                                   where: {
                                     business_location: location,
                                     category_id: category
                                   }
  end

  def fetch_parameters
    {
      category: '',
      location: ''
    }
  end
end
