class PagesController < ApplicationController

  def index
    @libraries = TrainingLibrary.all()
  end

end
