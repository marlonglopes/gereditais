require 'spec_helper'

describe "impugnacaos/edit.html.erb" do
  before(:each) do
    @impugnacao = assign(:impugnacao, stub_model(Impugnacao,
      :new_record? => false,
      :edital_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit impugnacao form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => impugnacao_path(@impugnacao), :method => "post" do
      assert_select "input#impugnacao_edital_id", :name => "impugnacao[edital_id]"
      assert_select "input#impugnacao_user_id", :name => "impugnacao[user_id]"
    end
  end
end
