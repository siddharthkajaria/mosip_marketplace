class Admin::DashboardController < Admin::AdminbaseController
  layout 'admin'

  def index
    @users = User.all().count
    @products_count = Product.all.count
    @manufacturers_count = Manufacturer.all.count
    @category_count = Category.all.count
  end

end