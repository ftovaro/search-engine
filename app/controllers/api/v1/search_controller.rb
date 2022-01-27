module Api
  module V1
    class SearchController < Api::BaseController
      def create
        UploadSearchWorker.perform_async(session[:user_uuid], params[:query], params[:device])
      end
    end
  end
end