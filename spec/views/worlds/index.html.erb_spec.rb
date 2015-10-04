require 'rails_helper'

RSpec.describe "worlds/index.html.erb", type: :view do
  it "renders the HTML template" do
    render

    expect(rendered).to match /worlds/
  end
end
