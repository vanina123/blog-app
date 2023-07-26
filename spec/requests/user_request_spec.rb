require 'rails_helper'

describe 'UserController', type: :request do
  describe 'GET #index' do
    it 'renders the index template' do
      get '/user'
      expect(response).to be_successful
      expect(response).to render_template('user/index')
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get '/user/1'
      expect(response).to be_successful
      expect(response).to render_template('user/show')
      expect(response.body).to include('Here is a given user')
    end
  end
end
