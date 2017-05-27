class MainController < ApplicationController
# before_action :prepare_search_form, only: [:index]

  def index
    #Display homepage
  end

  def import
    require 'csv'
    File.foreach(params[:file].path, headers:true) do |csv_line|
      row = CSV.parse(csv_line.gsub('\"', '""')).first #For RubyCSV's inability to recognise escapes
      if row[1] == "Order"
        Order.find_or_create_by(id:row[0])  #Creates new order if non-existent
          OrderUpdate.create(
            order_id: row[0],
            time_stamp: row[2],
            object_changes: JSON.parse(row[3])
          )
      elsif row[1] == "Invoice"
        Invoice.find_or_create_by(id:row[0])
          InvoiceUpdate.create(
            invoice_id: row[0],
            time_stamp: row[2],
            object_changes: JSON.parse(row[3])
          )
      elsif row[1] == "Product"
        Product.find_or_create_by(id:row[0])
          ProductUpdate.create(
          product_id: row[0],
          time_stamp: row[2],
          object_changes: JSON.parse(row[3])
          )
      end
    end
        # ObjectStateForm.new(object_state_params).save
        # redirect_to object_states_path
        # redirect_to root_url, notice: "Products imported."
  end

  def search

  end

  private

  def object_state_params
    # params.require(:file_upload).permit(:csv)
  end

  def prepare_search_form
    # search_params = params[:search_form].present? ? params[:search_form].permit(:object_id, :object_type, :timestamp) : {}
    # @search_form = SearchForm.new(search_params)
  end
end
