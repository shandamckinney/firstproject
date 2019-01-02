require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #index' do
    it 'renders index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    before do
      sign_in@user
    end
    it 'renders new page' do
      get :new, params: {id: @product}
      expect(response).to be_ok
    end
  end
  
end
