class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save 
      flash[:success] = "Store created!"
      redirect_to locations_path
    else
      render 'new'
    end
  end
end
