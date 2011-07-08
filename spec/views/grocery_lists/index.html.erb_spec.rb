require 'spec_helper'

describe "grocery_lists/index.html.erb" do
  before(:each) do
    assign(:grocery_lists, [
      stub_model(GroceryList,
        :name => "Name"
      ),
      stub_model(GroceryList,
        :name => "Name"
      )
    ])
  end

  it "renders a list of grocery_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
