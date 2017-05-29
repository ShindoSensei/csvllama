class MainController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index}
    end
  end

  def import_csv
    require 'csv'
    if params[:file_upload]
      File.foreach(params[:file_upload].path, headers:true) do |csv_line|
        row = CSV.parse(csv_line.gsub('\"', '""')).first #For RubyCSV's inability to recognise escapes
        if row[1] == "Order"
          Order.find_or_create_by(id:row[0]) #Creates new order if non-existent
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
    end
    redirect_to root_path
  end

  def prepare_obj(obj,id,time)
    updates_array = []
    if obj == 'Order'
      updates_array = OrderUpdate.where("order_id = ? AND time_stamp <= ?", id, time).order(:time_stamp)
    elsif obj == 'Invoice'
      updates_array = InvoiceUpdate.where("invoice_id = ? AND time_stamp <= ?", id, time).order(:time_stamp)
    elsif obj == 'Product'
      updates_array = ProductUpdate.where("product_id = ? AND time_stamp <= ?", id, time).order(:time_stamp)
    end
    if updates_array.empty?
      @object_state = {}
    else
      object_changes_array = updates_array.map{|update| update.object_changes}
      @object_state = object_changes_array.reduce(&:merge)
    end
  end

  def search_state
    prepare_obj(params[:object_type],params[:object_id],params[:time_stamp])
    respond_to do |format|
      format.js { render :index}
    end

  end

end
