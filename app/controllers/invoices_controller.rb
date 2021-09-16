class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit update destroy]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.includes(:payment_term).all
  end

  # GET /invoices/1 or /invoices/1.json
  def show; end

  # GET /invoices/new
  def new
    @invoice = Invoice.new(
      sender_address: SenderAddress.new,
      client_address: ClientAddress.new,
      line_items: [LineItem.new]
    )

    return unless htmx_request?

    render partial: 'form', locals: {invoice: @invoice}, layout: false and return
  end

  # GET /invoices/1/edit
  def edit
    @invoice.sender_address = SenderAddress.new if @invoice.sender_address.nil?
    @invoice.client_address = ClientAddress.new if @invoice.client_address.nil?

    return unless htmx_request?

    render partial: 'form', locals: {invoice: @invoice}, layout: false and return
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html do
        redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' unless htmx_request?
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invoice_params
    params[:invoice][:status] = params[:invoice][:status].to_i
    params.require(:invoice).permit(
      :payment_date,
      :description,
      :payment_term_id,
      :client_name,
      :client_email,
      :status,
      sender_address_attributes: %i[id street city state post_code country],
      client_address_attributes: %i[id street city state post_code country],
      line_items_attributes: %i[id name invoice_id quantity price]
    )
  end
end
