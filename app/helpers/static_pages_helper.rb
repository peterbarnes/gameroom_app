module StaticPagesHelper
  def assets
    @stores = Store.all
    @blurbs = Blurb.all
    @services = Service.all
  end
end
