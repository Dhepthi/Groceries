require 'spec_helper'

describe "grocery_lists/show.html.erb" do
  before(:each) do
    @grocery_list = assign(:grocery_list, stub_model(GroceryList,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
