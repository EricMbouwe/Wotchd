require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    context 'if the user doesnt exist' do
      it 'action show is not a success' do
        begin
          get show :show, id: 2
        rescue StandardError
          ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(:show)
      end
    end
  end
end
