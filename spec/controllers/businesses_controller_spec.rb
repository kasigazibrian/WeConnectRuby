# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe BusinessesController, type: :controller do
  describe 'get #index' do
    let!(:user) { create :user }
    let!(:business_list) { create_list :business, 5, user: user }
    it 'returns a response' do
      get :index
      expect(assigns[:businesses]).to eq(business_list)
      expect(response).to have_http_status(200)
    end
  end

  describe 'get #new' do
    it 'redirects a user when not logged in' do
      get :new
      expect(response).to have_http_status(302)
    end
    it 'returns a response when logged in' do
      sign_in create :user
      get :new
      expect(response).to have_http_status(200)
      expect(assigns[:business]).not_to be_nil
    end
  end

  describe 'post #create' do
    it 'redirects a user when not logged in' do
      business_params = (attributes_for :business).except(:deleted_at)
      # binding.pry
      post :create, params: { business: business_params }
      expect(response).to have_http_status(302)
    end

    it 'registers a new business successfully' do
      category = create :category
      business_params = (attributes_for :business).except(:deleted_at)
      business_params[:category_id] = category.id
      sign_in create :user
      post :create, params: { business: business_params }
      expect(flash[:notice]).to eq('Business registered successfully')
    end

    it 'fails to register business with invalid parameters' do
      # remove business category parameter
      business_params = (attributes_for :business)
                        .except(:deleted_at)
      sign_in create :user
      post :create, params: { business: business_params }
      expect(flash[:error]).to eq('Category must exist')
    end
  end
  describe 'get #show' do
    it 'redirects a user when not logged in' do
      business = create :business
      get :show, params: { id: business.id }
      expect(response).to have_http_status(302)
    end

    it 'renders the show template when logged in' do
      business = create :business
      sign_in create :user
      get :show, params: { id: business.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end

    it 'returns flash message when business not found' do
      sign_in create :user
      get :show, params: { id: 2 }
      expect(flash[:error]).to eq('Business not found')
      expect(response).to have_http_status(302)
    end
  end

  describe 'destroy #destroy' do
    it 'redirects a user when not logged in' do
      business = create :business
      delete :destroy, params: { id: business.id }
      expect(response).to have_http_status(302)
    end

    it 'deletes a business' do
      user = create :user
      sign_in user
      business = create :business, user: user
      delete :destroy, params: { id: business.id }
      expect(flash[:notice]).to eq('Business deleted successfully')
    end

    it 'prevents unauthorised user' do
      user = create :user
      sign_in user
      business = create :business
      delete :destroy, params: { id: business.id }
      expect(flash[:error]).to eq('You do not have authorization to perform this action')
    end

    it 'returns error message when business is non existent' do
      user = create :user
      sign_in user
      delete :destroy, params: { id: 2 }
      expect(flash[:error]).to eq('Business  not found')
    end
  end
  describe 'edit #edit' do
    it 'redirects a user when not logged in' do
      business = create :business
      get :edit, params: { id: business.id }
      expect(response).to have_http_status(302)
    end

    it 'renders the edit template when logged in' do
      business = create :business
      sign_in create :user
      get :edit, params: { id: business.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template('businesses/edit')
    end
  end
  describe 'update #update' do
    it 'redirects a user when not logged in' do
      business = create :business
      put :update, params: { id: business.id }
      expect(response).to have_http_status(302)
    end
    it 'updates a business successfully' do
      user = create :user
      sign_in user
      business = create :business, user: user
      business_params = (attributes_for :business).except(:deleted_at)
      put :update, params: { business: business_params, id: business.id }
      expect(flash[:notice]).to eq('Business updated successfully')
    end
  end
end

