require 'spec_helper'

describe "microposts/index.html.erb" do
  before(:each) do
    assign(:microposts, [
      stub_model(Micropost,
        :post => "MyText"
      ),
      stub_model(Micropost,
        :post => "MyText"
      )
    ])
  end

  it "renders a list of microposts" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
