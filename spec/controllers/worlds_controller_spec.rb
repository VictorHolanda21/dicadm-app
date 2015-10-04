require 'rails_helper'

if defined?(ActionController::UrlGenerationError)
  ExpectedRoutingError = ActionController::UrlGenerationError
else
  ExpectedRoutingError = ActionController::RoutingError
end


RSpec.describe WorldsController, type: :controller do
	let (:world1) { FactoryGirl.create(:world) } 

  describe "#index" do
  	before(:each) {get :index}
  	render_views

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "returns http success" do
      get :show, :id => world1.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
    	get :show, :id => world1.id
      expect(response).to render_template("show")
    end

    it "requires the :id parameter" do
      expect { get :show }.to raise_error(ExpectedRoutingError)
    end
  end

  describe "#new" do
  	before(:each) {get :new}
  	render_views

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
  end

  describe "#edit" do
    it "returns http success" do
      get :edit, :id => world1.id
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
    	get :edit, :id => world1.id
      expect(response).to render_template("edit")
    end

    it "requires the :id parameter" do
      expect { get :edit }.to raise_error(ExpectedRoutingError)
    end
  end


  describe "#update" do
    # it "responds to PUT" do
    #   put :update, :id => world1
    #   expect(response.body).to eq "update called"
    # end

    it "requires the :id parameter" do
      expect { put :update }.to raise_error(ExpectedRoutingError)
    end

  end

  describe "#destroy" do
    # it "responds to DELETE" do
    #   delete :destroy, :id => world1
    #   expect(response.body).to eq "destroy called"
    # end

    it "requires the :id parameter" do
      expect { delete :destroy }.to raise_error(ExpectedRoutingError)
    end
  end

end
