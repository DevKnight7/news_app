require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    let!(:favorites) { create_list(:favorite, 2, user: user) }

    before do
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns the user favorites as @favorites' do
      expect(assigns(:favorites)).to eq(favorites)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:favorite_params) { attributes_for(:favorite) }

      it 'creates a new favorite' do
        expect do
          post :create, params: { article: favorite_params }
        end.to change(Favorite, :count).by(1)
      end

      it 'redirects to the previous page with a notice message' do
        post :create, params: { article: favorite_params }
        expect(response).to redirect_to(root_url)
        expect(flash[:notice]).to eq('Favorite added successfully')
      end
    end

    context 'with invalid params' do
      let(:favorite_params) { attributes_for(:favorite, title: nil) }

      it 'does not create a new favorite' do
        expect do
          post :create, params: { article: favorite_params }
        end.to_not change(Favorite, :count)
      end

      it 'redirects to the previous page with an alert message' do
        post :create, params: { article: favorite_params }
        expect(response).to redirect_to(root_url)
        expect(flash[:alert]).to eq('Unable to add favorite')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:favorite) { create(:favorite, user: user) }

    it 'destroys the requested favorite' do
      expect do
        delete :destroy, params: { id: favorite.id }
      end.to change(Favorite, :count).by(-1)
    end

    it 'redirects to the favorites list with a notice message' do
      delete :destroy, params: { id: favorite.id }
      expect(response).to redirect_to(favorites_path)
      expect(flash[:notice]).to eq('Favorite removed successfully')
    end
  end
end
