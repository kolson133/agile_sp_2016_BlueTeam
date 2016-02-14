class CardsController < ApplicationController
  before_action :set_deck

  # GET /cards
  # GET /cards.json
  def index
    @cards = @deck.cards
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = @deck.cards.find(params[:id])
  end

  def show_random_card
    cards = @deck.cards
    cards = Card.where(deck_id: @deck)
    cards = cards.where(is_disabled: false)
    cards = cards.shuffle
    @card = cards.first
    redirect_to deck_card_path(@deck, @card)
  end

  def next_card
    @card = @deck.cards.find(params[:id])
    @card = @card.next
    while @card.is_disabled == true
      @card = @card.next
    end
    redirect_to deck_card_path(@deck, @card)
  end 

  def previous_card
    @card = @deck.cards.find(params[:id])
    @card = @card.previous
    while @card.is_disabled == true
      @card = @card.previous
    end
    redirect_to deck_card_path(@deck, @card)
  end

  # GET /cards/new
  def new
    @card = @deck.cards.build
  end

  # GET /cards/1/edit
  def edit
    @card = @deck.cards.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    @card =  @deck.cards.build(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to deck_path(@deck), notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: deck_card_path(@deck, @card) }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    @card = @deck.cards.find(params[:id])
    respond_to do |format|
      if @card.update_attributes(card_params)
        format.html { redirect_to deck_path(@deck), notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: deck_card_path(@deck, @card) }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def disable_card 
    @card = @deck.cards.find(params[:id])
    @card.is_disabled = true
    @card.save
    respond_to do |format|
      format.html { redirect_to deck_path(@deck), notice: 'Card was successfully disabled.' }
    end
  end
  
  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:deck_id])
    end

    def get_random_card
      @card.where(:deck_id => params[:deck_id]).count
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:question, :answer, :is_disabled, :image, :image_remote_url)
    end

end
