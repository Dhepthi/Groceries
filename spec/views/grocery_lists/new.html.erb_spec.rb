require 'spec_helper'

describe "grocery_lists/new.html.erb" do
  before(:each) do
    assign(:grocery_list, stub_model(GroceryList,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new grocery_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => grocery_lists_path, :method => "post" do
      assert_select "input#grocery_list_name", :name => "grocery_list[name]"
    end
  end
end
