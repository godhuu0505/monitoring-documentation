require 'open-uri'

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :download, :edit, :update, :destroy]
  before_action :set_document_data, only: [:show]

  def index
    @documents = Document.all
  end

  def show
  end

  def download
    doc = open(@document.url)
    if doc.content_type == "application/pdf"
      filename = Time.current.strftime("%Y%m%d%H%M%S") + "_" + @document.name.to_s + ".pdf"
      open(filename, "w+b") do |out|
        out.write(doc.read)
      end

      @document_datum = @document.document_datum.create(file_name: filename, document_type: "pdf")
    end

    respond_to do |format|
      format.html { redirect_to @document, notice: 'Document was successfully downloaded.' }
      format.json { head :no_content }
    end
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def set_document_data
      @document_data = @document.document_datum.all
    end

    def document_params
      params.require(:document).permit(:name, :url)
    end
end
