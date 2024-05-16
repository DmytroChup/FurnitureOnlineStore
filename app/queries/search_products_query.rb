class SearchProductsQuery
  def initialize(scope = Product.all, params)
    @scope = scope
    @params = params
  end

  def call
    by_keyword
  end

  private

  def by_keyword
    if @params[:keyword].present?
      @scope = @scope.where("name LIKE ?", "%#{@params[:keyword]}%")
    end
    @scope
  end
end
