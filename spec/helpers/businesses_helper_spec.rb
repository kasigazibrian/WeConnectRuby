# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesHelper, type: :helper do
  describe 'businesses helper' do
    it 'should return true if the business id is equal to user id' do
      expect(business_owner(1, 1)).to be true
    end

    it 'should return false if the business id is equal to user id' do
      expect(business_owner(1, 2)).to be false
    end
  end
end
