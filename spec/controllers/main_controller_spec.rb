require 'spec_helper'
  describe 'GET #index' do
    it "should render the index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #import_csv" do
    before :each do
        file = fixture_file_upload('files/test.csv', 'text/csv')
        post :import_csv, params: { file_upload: { csv: file } }
    end
    it "should upload CSV and update corresponding database" do
      expect(Order.count).to eq(2)
      expect(Invoice.count).to eq(1)
      expect(Product.count).to eq(2)
      expect(OrderUpdate.count).to eq(3)
      expect(InvoiceUpdate.count).to eq(2)
      expect(ProductUpdate.count).to eq(2)
    end
    # it "Should redirect to root_path after upload" do
        # response.should redirect_to '/'
    # end
  end
  #
  # describe "POST #search_state" do
  #   before :each do
  #     post :search_state
  #   end
  #   it "should return the correct object state" do
  #
  #   end
  #
  # end
