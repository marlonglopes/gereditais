require 'spec_helper'

describe "impugnations/index.html.erb" do
  before(:each) do
    assign(:impugnations, [
      stub_model(Impugnation,
        :edital_id => 1,
        :user_id => 1
      ),
      stub_model(Impugnation,
        :edital_id => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of impugnations" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
