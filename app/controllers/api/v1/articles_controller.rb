module Api
  module V1
    class ArticlesController < Api::BaseController
      def index
        p "searching"
        key_words = params[:query]&.gsub("-", " ")
        # TODO some caching
        articles_found = Article.search(key_words)
        p "*****************"
        p session[:test_cookie]
        p key_words
        p Search.all
        p "*****************"
        render json: { status: 200, message: "ok", articles: articles_found}
      end
    end
  end
end