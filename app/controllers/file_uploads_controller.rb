class FileUploadsController < ApplicationController
  before_filter :authenticate_user!
  def destroy

    file_upload = FileUpload.find(params[:id])

   
    file_upload.destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

end
