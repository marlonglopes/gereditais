require 'spec_helper'

describe "impugnations/edit.html.erb" do
  before(:each) do
    @impugnation = assign(:impugnation, stub_model(Impugnation,
      :new_record? => false,
      :edital_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit impugnation form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => impugnation_path(@impugnation), :method => "post" do
      assert_select "input#impugnation_edital_id", :name => "impugnation[edital_id]"
      assert_select "input#impugnation_user_id", :name => "impugnation[user_id]"
    end
  end
end
