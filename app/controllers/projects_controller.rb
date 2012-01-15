class ProjectsController < ApplicationController
  layout 'admin'
  before_filter :collect_client_names, :only => ['new','edit']
  before_filter :authenticate_user!

  def main
    render :layout => 'front'
  end

  def highlights
    @projects = Project.where('is_renowned=?',true).all
    render :layout => 'front'
  end

  def all
    @projects = Project.all
    render :layout => 'front'
  end


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'front'}
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project.file_uploads.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @project.file_uploads.build
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { 
          if params[:project][:redirect_url].empty?
            redirect_to @project, notice: 'Project was successfully created.' 
          else
            self.collect_client_names
            @project.file_uploads.build
            render action: "new"
          end

        }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { 
          if params[:project][:redirect_url].empty?
            redirect_to @project, notice: 'Project was successfully updated.' 
          else
            self.collect_client_names
            @project.file_uploads.build
            render action: "edit"
          end
          }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end

  protected
  def collect_client_names
    @client_names = Project.select('DISTINCT(client_name)').all.map{|p| p.client_name}
  end
end
