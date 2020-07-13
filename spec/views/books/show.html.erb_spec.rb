require "rails_helper"

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
                            title: "MyText",
                            author: "Author",
                          ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Author/)
  end
end
