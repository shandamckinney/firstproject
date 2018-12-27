require 'rails_helper'

describe UsersController, type: :controller do
  @user = FactoryBot.create(:user)

    describe 'GET #show' do
      context 'when a user is logged in' do
        before do
          sign_in user
        end

        it "loads correct user details" do
          get :show, params: {id: user.id}
          expect(response).to be_ok
          expect(assigns(:user)).to eq user
        end
      end



  end
end
