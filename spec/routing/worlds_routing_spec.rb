require "rails_helper"

RSpec.describe "Routes for Worlds Controller", :type => :routing do
	let (:world1) { FactoryGirl.create(:world) } 


	context "#index" do
	  it "routes /worlds" do
	    expect(get("/worlds")).to route_to("worlds#index")
	  end

	 	it "routes #index" do #routes a named route #index
	    expect(:get => worlds_path).to route_to(:controller => "worlds", :action => "index")
	  end
	end	
	
	context "#show" do
    it "routes /worlds/:id/" do
      expect(:get => "/worlds/#{world1.id}").to route_to("worlds#show", :id => "#{world1.id}")
    end

		it "routes #show" do #routes a named route #show
	    expect(:get => world_path(world1.id)).
	    	to route_to(:controller => "worlds", :action => "show", :id => "#{world1.id}")
	  end
	end

	context "#new" do
	  it 'routes /worlds/new' do
	  	expect(get("/worlds/new")).to route_to("worlds#new")
	  end

		it "routes #new" do #routes a named route #new
	    expect(:get => new_world_path).to route_to(:controller => "worlds", :action => "new")
	  end
	end

	context "#create, method: POST" do
		it 'routes /words' do
			expect(:post => "/worlds").to route_to("worlds#create")
		end

		it 'routes #create' do
			expect(:post => worlds_path).to route_to(:controller => "worlds", :action => "create")
		end
	end

	context "#edit" do
	  it 'routes /worlds/:id/edit' do
	  	expect(:get => "/worlds/#{world1.id}/edit").to route_to("worlds#edit", :id => "#{world1.id}")
	  end

		it "routes #edit" do #routes a named route #edit
	    expect(:get => edit_world_path(world1.id)).
	    	to route_to(:controller => "worlds", :action => "edit", :id => "#{world1.id}")
	  end
	end

	context "#update, method: PUT" do
		it 'routes /worlds/:id #PUT' do
	  	expect(:put => "/worlds/#{world1.id}").to route_to("worlds#update", :id => "#{world1.id}")
	  end

		it "routes #update" do #routes a named route #update
	    expect(:put => world_path(world1.id)).
	    	to route_to(:controller => "worlds", :action => "update", :id => "#{world1.id}")
	  end
	end

	context '#destroy, method: DELETE' do
		it 'routes /worlds/:id' do
			expect(:delete => "/worlds/#{world1.id}").to route_to("worlds#destroy", :id => "#{world1.id}")
		end

		it "routes #destroy" do #routes a named route #destroy
	    expect(:delete => world_path(world1.id)).
	    	to route_to(:controller => "worlds", :action => "destroy", :id => "#{world1.id}")
	  end
	end

end

# ROUTES
#     Prefix Verb   URI Pattern                Controller#Action
#     worlds GET    /worlds(.:format)          worlds#index
#            POST   /worlds(.:format)          worlds#create
#  new_world GET    /worlds/new(.:format)      worlds#new
# edit_world GET    /worlds/:id/edit(.:format) worlds#edit
#      world GET    /worlds/:id(.:format)      worlds#show
#            PATCH  /worlds/:id(.:format)      worlds#update
#            PUT    /worlds/:id(.:format)      worlds#update
#            DELETE /worlds/:id(.:format)      worlds#destroy