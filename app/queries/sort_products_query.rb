# frozen_string_literal: true

class SortProductsQuery
  def initialize(relation=Product.all, params={})
    @relation = relation
    @params = params
  end

  def call
    filter_by_category
    sort_by_param
    reverse_if_needed
    @relation
  end

  def filter_by_category
    return unless @params[:category].present?

    @relation = @relation.joins(:subcategory).where(subcategories: {category_id: @params[:category]})
  end

  def sort_by_param
    @relation = case @params[:sort_by]
                when "average_rating"
                  @relation.sort_by {|product| product.average_rating.to_f }
                when "review_count"
                  @relation.sort_by(&:review_count)
                when "created_at"
                  @relation.order(created_at: :desc)
                else
                  @relation
                end
  end

  def reverse_if_needed
    @relation = @relation.reverse if @params[:direction] == "asc"
  end
end
