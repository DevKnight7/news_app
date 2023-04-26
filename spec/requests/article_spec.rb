require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'fetches top headlines' do
      allow(RestClient).to receive(:get).and_return(
        double(body: { articles: [{ title: 'test article' }] }.to_json)
      )
      
      get :index
      
      expect(response).to have_http_status(:ok)
      expect(assigns(:articles).size).to eq(1)
      expect(assigns(:articles).first['title']).to eq('test article')
    end
  end

  describe 'GET #show' do
    it 'fetches the article by title' do
      allow(RestClient).to receive(:get).and_return(
        double(body: { articles: [{ title: 'test article' }] }.to_json)
      )

      get :show, params: { title: 'test' }

      expect(response).to have_http_status(:ok)
      expect(assigns(:article)['title']).to eq('test article')
    end
  end

  describe 'GET #search' do
    context 'when a search query is present' do
      it 'fetches articles by search query' do
        allow(RestClient).to receive(:get).and_return(
          double(body: { articles: [{ title: 'test article' }] }.to_json)
        )

        get :search, params: { q: 'test' }

        expect(response).to have_http_status(:ok)
        expect(assigns(:articles).size).to eq(1)
        expect(assigns(:articles).first['title']).to eq('test article')
      end
    end

    context 'when no search query is present' do
      it 'renders the search template with empty articles' do
        get :search

        expect(response).to have_http_status(:ok)
        expect(assigns(:articles)).to be_empty
      end
    end
  end
end

# require 'rails_helper'

# RSpec.describe ArticlesController, type: :controller do
#   describe "GET index" do
#     before do
#       allow(RestClient).to receive(:get).and_return(
#         double(body: {
#           "articles": [
#             {
#               "title": "Test Article 1",
#               "description": "This is a test article",
#               "url": "http://test-article-1.com",
#               "urlToImage": "http://test-article-1.com/image.jpg",
#               "publishedAt": "2023-04-25T00:00:00Z"
#             },
#             {
#               "title": "Test Article 2",
#               "description": "This is another test article",
#               "url": "http://test-article-2.com",
#               "urlToImage": "http://test-article-2.com/image.jpg",
#               "publishedAt": "2023-04-24T00:00:00Z"
#             }
#           ]
#         }.to_json)
#       )
#     end
    
#     it "renders the index template" do
#       get :index
#       expect(response).to render_template(:index)
#     end
    
#     it "assigns @articles" do
#       get :index
#       expect(assigns(:articles)).to_not be_nil
#     end
#   end
  
#   describe "GET show" do
#     before do
#       allow(RestClient).to receive(:get).and_return(
#         double(body: {
#           "articles": [
#             {
#               "title": "Test Article 1",
#               "description": "This is a test article",
#               "url": "http://test-article-1.com",
#               "urlToImage": "http://test-article-1.com/image.jpg",
#               "publishedAt": "2023-04-25T00:00:00Z"
#             },
#             {
#               "title": "Test Article 2",
#               "description": "This is another test article",
#               "url": "http://test-article-2.com",
#               "urlToImage": "http://test-article-2.com/image.jpg",
#               "publishedAt": "2023-04-24T00:00:00Z"
#             }
#           ]
#         }.to_json)
#       )
#     end
    
#     it "renders the show template" do
#       get :show, params: { title: "Test Article 1" }
#       expect(response).to render_template(:show)
#     end
    
#     it "assigns @article" do
#       get :show, params: { title: "Test Article 1" }
#       expect(assigns(:article)).to_not be_nil
#     end
#   end

#   describe 'GET #search' do
#     it 'returns articles from the News API' do
#       # Mock the API response
#       response_body = {
#         'articles': [
#           {
#             'title': 'Test Article',
#             'description': 'This is a test article.'
#           }
#         ]
#       }.to_json

#       stub_request(:get, /newsapi\.org\/v2\/everything/).
#         with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
#         to_return(status: 200, body: response_body, headers: {})

#       # Make the API request
#       get :search, params: { q: 'test' }

#       # Check that the articles were assigned
#       expect(assigns(:articles)).to eq(JSON.parse(response_body)['articles'])

#       # Check the response code and template
#       expect(response).to have_http_status(:ok)
#       expect(response).to render_template(:search)
#     end

#     it 'returns an empty array if the query is blank' do
#       # Make the API request
#       get :search, params: { q: '' }

#       # Check that the articles were assigned
#       expect(assigns(:articles)).to eq([])

#       # Check the response code and template
#       expect(response).to have_http_status(:ok)
#       expect(response).to render_template(:search)
#     end
#   end
# end
#   # describe "GET search" do

#   #   before do
#   #     allow(RestClient).to receive(:get).and_return(
#   #       double(body: {
#   #         "articles": [
#   #           {
#   #             "title": "Test Article 1",
#   #             "description": "This is a test article",
#   #             "url": "http://test-article-1.com",
#   #             "urlToImage": "http://test-article-1.com/image.jpg",
#   #             "publishedAt": "2023-04-25T00:00:00Z"
#   #           },
#   #           {
#   #             "title": "Test Article 2",
#   #             "description": "This is another test article",
#   #             "url": "http://test-article-2.com",
#   #             "urlToImage": "http://test-article-2.com/image.jpg",
#   #             "publishedAt": "2023-04-24T00:00:00Z"
#   #           }
#   #         ]
#   #       }.to
