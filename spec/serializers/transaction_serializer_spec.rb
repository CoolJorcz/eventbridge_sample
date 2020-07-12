describe TransactionSerializer do
  let(:transaction) { FactoryBot.create(:transaction) }
  subject { described_class.new(transaction) }

  it "creates the expected hashed fields of the transaction" do
    expected_transaction = {
      id: transaction.id,
      customer_email: transaction.customer_email,
      sale_price: transaction.sale_price,
      book: {
        title: transaction.book.title,
        author: transaction.book.author,
      },
    }

    expect(subject.as_json(include: "**")).to eq(expected_transaction)
  end
end
