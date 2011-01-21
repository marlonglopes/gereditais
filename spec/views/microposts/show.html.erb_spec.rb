require 'spec_helper'

describe "microposts/show.html.erb" do
  before(:each) do
    @micropost = assign(:micropost, stub_model(Micropost,
      :post => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
