class UfoCatchersController < ApplicationController
  def index
    @ufo_catchers = UfoCatcher.all
  end

  def new
    @ufo_catchers = UfoCatcher.new
  end
end
