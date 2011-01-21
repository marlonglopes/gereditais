require 'spec_helper'

describe "impugnations/new.html.erb" do
  before(:each) do
    assign(:impugnation, stub_model(Impugnation,
      :edital_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new impugnation form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => impugnations_path, :method => "post" do
      assert_select "input#impugnation_edital_id", :name => "impugnation[edital_id]"
      assert_select "input#impugnation_user_id", :name => "impugnation[user_id]"
    end
  end
end
