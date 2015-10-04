require "rails_helper"

RSpec.describe "routes for Worlds", :type => :routing do
	let (:world1) { FactoryGirl.create(:world) } 

#     Prefix Verb   URI Pattern                Controller#Action
#     worlds GET    /worlds(.:format)          worlds#index
#            POST   /worlds(.:format)          worlds#create
#  new_world GET    /worlds/new(.:format)      worlds#new
# edit_world GET    /worlds/:id/edit(.:format) worlds#edit
#      world GET    /worlds/:id(.:format)      worlds#show
#            PATCH  /worlds/:id(.:format)      worlds#update
#            PUT    /worlds/:id(.:format)      worlds#update
#            DELETE /worlds/:id(.:format)      worlds#destroy

	context "Routing Worlds Controller" do
	  it "routes /worlds" do
	    expect(get("/worlds")).to route_to("worlds#index")
	  end

	  it 'routes /worlds/new' do
	  	expect(get("/worlds/new")).to route_to("worlds#new")
	  end

		it "routes a named route #new" do
	    expect(:get => new_world_path).
	    to route_to(:controller => "worlds", :action => "new")
	  end

	  # it "routes a named route #edit" do
	  #   expect(:get => edit_world_path).
	  #   to route_to(:controller => "worlds", :action => "edit", :id => assigns(:world1).id)
	  # end
	end

end