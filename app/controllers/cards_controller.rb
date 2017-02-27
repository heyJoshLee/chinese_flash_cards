class CardsController < LoggedInController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.words
  end

  def attempt
    answered_correctly = params[:correct] == "true" ? true :false
    card = Card.find(params[:card_id])
    card.attempt(answered_correctly)

    respond_to do |format|
      format.js
    end
  end

  def create
    card = Card.new(card_params)
    card.user_id = current_user.id
    card.save
    @cards = current_user.words
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @cards = current_user.words
    @card.destroy
    respond_to do |format|
      format.js
    end
  end

  def fetch_character_breakdown
    search_query = params[:search_query]
    html_tree = Card.fetch_character_breakdown(search_query)
    render json: { tree: html_tree }
  end

  def update
    @card.update(card_params)
    flash[:success] = "Card was updated"
    redirect_to card_path(@card)
  end

  def hanzi_to_piyin
    render json: { pinyin: Card.hanzi_to_piyin(params[:hanzi]) }
  end

  private

  def set_user
    @user = User.where(id: params[:user_id]).first
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit!
    
  end

end