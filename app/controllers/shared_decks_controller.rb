class SharedDecksController < ApplicationController

  def index
    @decks = Deck.where.not('slug' => nil)
  end

  def show
    @deck = Deck.find_by_slug(params[:id])
    if @deck
      render :show
    end
  end

end
