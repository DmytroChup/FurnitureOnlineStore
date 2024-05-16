# frozen_string_literal: true

class SearchProductsQuery
  def initialize(params, scope=Product.all)
    @scope = scope
    @params = params
  end

  def call
    by_keyword
  end

  private

  def by_keyword
    @scope = @scope.where("name LIKE ?", "%#{@params[:keyword]}%") if @params[:keyword].present?
    @scope
  end
end
