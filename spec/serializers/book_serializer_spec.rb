describe BookSerializer do
  let(:book){ FactoryBot.create(:book) }
  subject { described_class.new(book) }

  it 'creates the expected hashed fields of the transaction' do
    expected_book = {
      title: book.title,
      author: book.author
    }

    expect(subject.as_json(include: '**')).to eq(expected_book)
  end
end