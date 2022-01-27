module Api
  module V1
    class ArticlesController < Api::BaseController
      def index
        key_words = params[:query]&.gsub("-", " ")
        articles_found = Article.search(key_words)
        render json: { status: 200, message: "ok", articles: articles_found}
      end
    end
  end
end