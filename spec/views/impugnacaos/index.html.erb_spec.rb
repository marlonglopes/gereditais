require 'spec_helper'

describe "impugnacaos/index.html.erb" do
  before(:each) do
    assign(:impugnacaos, [
      stub_model(Impugnacao,
        :edital_id => 1,
        :user_id => 1
      ),
      stub_model(Impugnacao,
        :edital_id => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of impugnacaos" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
