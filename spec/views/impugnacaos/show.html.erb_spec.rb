require 'spec_helper'

describe "impugnacaos/show.html.erb" do
  before(:each) do
    @impugnacao = assign(:impugnacao, stub_model(Impugnacao,
      :edital_id => 1,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
