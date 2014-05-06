module StaticPagesHelper
  def assets
    @stores = Store.all
    @blurbs = Blurb.all
  end
end
