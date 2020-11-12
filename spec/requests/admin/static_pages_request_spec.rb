require "rails_helper"

RSpec.describe "Admin::StaticPages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/admin/static_pages/home"
      expect(response).to have_http_status(:success)
    end
  end

end
