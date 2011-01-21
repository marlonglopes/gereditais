require 'spec_helper'

describe "microposts/edit.html.erb" do
  before(:each) do
    @micropost = assign(:micropost, stub_model(Micropost,
      :new_record? => false,
      :post => "MyText"
    ))
  end

  it "renders the edit micropost form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => micropost_path(@micropost), :method => "post" do
      assert_select "textarea#micropost_post", :name => "micropost[post]"
    end
  end
end
