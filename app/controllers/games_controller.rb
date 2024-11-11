class GamesController < ApplicationController
  def new
    @length = 10
    @letters_array = Array.new(@length) { ('A'..'Z').to_a.sample }
  end

  def score
    if original_grid?
      return @answer = "Yes, you used the correct letters 👍"
    else
      return @answer = "Sorry but #{params[:word].upcase} can't be built out of #{params[:letters]}"
    end
    raise

  end

  def original_grid?
    @original_grid = []
    params[:word].upcase.chars.each do|letter|
      boolean = params[:letters].chars.include?(letter)
      @original_grid.push(boolean)
      end
      if @original_grid.include?(false)
        return false
      else
        return true
      end
  end
end
