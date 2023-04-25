class UfoCatchersController < ApplicationController
  def index
    @ufo_catchers = UfoCatcher.all
  end
end
