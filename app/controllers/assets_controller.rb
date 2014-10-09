class AssetsController < ApplicationController
  def version
    @asset = Asset.find_by(original_id: params[:original_id], version: params[:version])
    render partial: 'asset', locals: {asset: @asset}, layout: nil
  end
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
  end
  private
  def project_params
    params.require(:asset).permit(:original_id, :version)
  end
end