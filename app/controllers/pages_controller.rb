class PagesController < ApplicationController
  before_action :check_browse, except: [:show]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :load_pages
 
  
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.ordering
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    unless User.edit_by?(@current_user)
      render_error unless (@page.allow_user == true)
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Страница успешно создана' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Страница успешно обновлена' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Страница успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :short_name, :title, :meta_keywords, :meta_description, :content, :allow_user, :show, :index)
    end
    
    def check_browse
    render_error unless User.edit_by?(@current_user)
    end
    
  
  def load_pages
    @pages = Page.all
  end
end
