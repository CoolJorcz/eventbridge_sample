require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/transactions", type: :request do
  # Transaction. As you add validations to transaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  describe "GET /index" do
    it "renders a successful response" do
      Transaction.create! valid_attributes
      get transactions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transaction = Transaction.create! valid_attributes
      get transaction_url(transaction)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_transaction_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      transaction = Transaction.create! valid_attributes
      get edit_transaction_url(transaction)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new transaction" do
        expect do
          post transactions_url, params: { transaction: valid_attributes }
        end.to change(Transaction, :count).by(1)
      end

      it "redirects to the created transaction" do
        post transactions_url, params: { transaction: valid_attributes }
        expect(response).to redirect_to(transaction_url(Transaction.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new transaction" do
        expect do
          post transactions_url, params: { transaction: invalid_attributes }
        end.to change(Transaction, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post transactions_url, params: { transaction: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested transaction" do
        transaction = Transaction.create! valid_attributes
        patch transaction_url(transaction), params: { transaction: new_attributes }
        Transaction.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the transaction" do
        transaction = Transaction.create! valid_attributes
        patch transaction_url(transaction), params: { transaction: new_attributes }
        Transaction.reload
        expect(response).to redirect_to(transaction_url(transaction))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        transaction = Transaction.create! valid_attributes
        patch transaction_url(transaction), params: { transaction: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested transaction" do
      transaction = Transaction.create! valid_attributes
      expect do
        delete transaction_url(transaction)
      end.to change(transaction, :count).by(-1)
    end

    it "redirects to the transactions list" do
      transaction = Transaction.create! valid_attributes
      delete transaction_url(transaction)
      expect(response).to redirect_to(transactions_url)
    end
  end
end
