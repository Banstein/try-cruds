require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let!(:posts) { [
      Post.create!(title: "Post 1", content: "Content 1"),
      Post.create!(title: "Post 2", content: "Content 2"),
      Post.create!(title: "Post 3", content: "Content 3")
    ] }
    
    before { get '/api/v1/posts' }
    
    it 'returns all posts' do
      expect(json.size).to eq(3)
      posts.each_with_index do |post, index|
        expect(json[index]['title']).to eq(post.title)
        expect(json[index]['content']).to eq(post.content)
      end
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
