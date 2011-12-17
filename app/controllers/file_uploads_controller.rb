class FileUploadsController < ApplicationController
  def destroy

    file_upload = FileUpload.find(params[:id])

   
    file_upload.destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

end
