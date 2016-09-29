class ProductsDataTable

  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    # raise params[:order].values.first[:column].inspect

    {
      draw: params[:draw].to_i,
      recordsTotal: Product.count,
      recordsFiltered: products.total_entries,
      data: data
    }
  end

private

  def data
    products.map do |product|
      {
        name: link_to(product.name, product),
        __tooltip_name: product.description,
        stock: product.stock,
        available: product.available.strftime("%B %e, %Y"),
        amount: number_to_currency(product.amount),
        DT_RowClass: product.row_class
      }
    end
  end

  def products
    @products ||= fetch_products
  end

  def fetch_products
    products = Product.order("#{sort_column} #{sort_direction}")
    products = products.page(page).per_page(per_page)
    if params[:search][:value].present?
      products = products.where("name like :search", search: "%#{params[:search][:value]}%")
    end
    products
  end

  def page
    (params[:start].to_i / per_page) + 1
    # params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
    # params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def order
    params[:order].values.first
  end

  def sort_column
    columns = %w[name stock available amount]
    columns[order[:column].to_i]
  end

  def sort_direction
    order[:dir] == "asc" ? "asc" : "desc"
  end

end
