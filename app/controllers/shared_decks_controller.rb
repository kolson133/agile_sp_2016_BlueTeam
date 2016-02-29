class SharedDecksController < ApplicationController
  before_action :authenticate_user!

  def index
    @decks = Deck.where.not('slug' => nil)
    @my_shared = current_user.decks.where.not('slug' => nil)
  end

  def show
    @deck = Deck.find_by_slug(params[:id])
    if @deck
      render :show
    end
  end

end
