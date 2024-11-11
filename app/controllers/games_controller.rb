require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @length = 10
    @letters_array = Array.new(@length) { ('A'..'Z').to_a.sample }
  end

  def score
    if english_word?(params[:word]) && original_grid?
      return @answer = "Well done, this is an english word !"
    elsif english_word?(params[:word]) && original_grid? === false
      return @answer = "Sorry but #{params[:word].upcase} can't be built out of #{params[:letters]}"
    else
      return @answer = "Sorry, this is not an english word..."
    end


  end

  private

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

  def english_word?(word)
    response = URI.parse("https://dictionary.lewagon.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end



end
