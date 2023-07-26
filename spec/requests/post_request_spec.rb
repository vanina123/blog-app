require 'rails_helper'

describe Post, type: :request do
  describe 'routes' do
    it 'should render the index action correctly' do
      get '/user/:user_id/post'
      expect(response).to be_successful
      expect(response).to render_template('post/index')
      expect(response.body).to include('Here is a list of post for a given user')
    end
  end
  describe 'GET #show' do
    it 'renders the show template' do
      get '/user/:user_id/post/:id'
      expect(response).to be_successful
      expect(response).to render_template('post/show')
      expect(response.body).to include('Here is a given post for a specific user')
    end
  end
end
