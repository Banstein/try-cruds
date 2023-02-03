require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let!(:posts) do 
      [
        { title: 'Post 1', content: 'Post 1 content' },
        { title: 'Post 2', content: 'Post 2 content' }
      ]
    end

    before do
      allow(Post).to receive(:all).and_return(posts)
      get '/api/v1/posts'
    end
    
    it 'returns all posts' do
      expect(json.size).to eq(2)
    end

    it 'returns the correct posts data' do
      expect(json[0]).to include('title' => 'Post 1', 'content' => 'Post 1 content')
      expect(json[1]).to include('title' => 'Post 2', 'content' => 'Post 2 content')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
