class PracticeController < LoggedInController

  def home
    @card = get_card
  end



  def attempt
    answered_correctly = params[:correct] == "true" ? true :false
    card = Card.find(params[:card_id])
    card.attempt(answered_correctly)

    respond_to do |format|
      @card = get_card
      format.js
    end
  end

  private

  def get_card
    current_user.words.shuffle.first
  end



end