class UserSearchService
  def initialize(current_user)
    @current_user = current_user
  end

  def find_people
    User.joins(:subcategories)
        .where(subcategories: { id: @current_user.subcategory_ids })
        .distinct
  end
end