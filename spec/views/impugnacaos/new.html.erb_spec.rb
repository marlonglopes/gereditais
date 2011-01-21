require 'spec_helper'

describe "impugnacaos/new.html.erb" do
  before(:each) do
    assign(:impugnacao, stub_model(Impugnacao,
      :edital_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new impugnacao form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => impugnacaos_path, :method => "post" do
      assert_select "input#impugnacao_edital_id", :name => "impugnacao[edital_id]"
      assert_select "input#impugnacao_user_id", :name => "impugnacao[user_id]"
    end
  end
end
