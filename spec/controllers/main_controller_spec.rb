require 'spec_helper'

RSpec.describe MainController, type: :controller do

  before :each do
    file = fixture_file_upload('files/test.csv', 'text/csv')
    post :import_csv, params: { file_upload: file }
  end

  describe 'GET #index' do
    it "should render the index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #import_csv" do
    it "should upload CSV and update corresponding database" do
      expect(Order.count).to eq(2)
      expect(Invoice.count).to eq(1)
      expect(Product.count).to eq(2)
      expect(OrderUpdate.count).to eq(3)
      expect(InvoiceUpdate.count).to eq(2)
      expect(ProductUpdate.count).to eq(2)
    end

    it "should redirect to root_path after upload" do
      expect(response).to redirect_to('/')
    end
  end

  describe "prepare_obj" do
    it "should return the correct object state for order id 1 at time 1484733173" do
      expect(controller.prepare_obj('Order',1,1484733173)).to eq({"customer_name"=>"Jack", "customer_address"=>"Trade St.", "status"=>"paid", "ship_date"=>"2017-01-18", "shipping_provider"=>"DHL"})
    end

    it "should return empty object for order id 1 at time 1484722542" do
      expect(controller.prepare_obj('Order',1,1484722542)).to eq({})
    end

    it "should return correct object state for id 1 at time 1484731400" do
      expect(controller.prepare_obj('Order',1,1484731400)).to eq({"customer_name"=>"Jack", "customer_address"=>"Trade St.", "status"=>"unpaid"})
    end
  end

  describe "POST #search_state" do
    it "should respond with javascript" do
      post :search_state, format: :js
      expect(response).to render_template("index")
    end
  end
end
