require 'json'
# require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = generate_code(10)
  end

  def score
    @word = params[:word]
    word_array = @word.split('')
    tested = word_array.all? { |lette| params[:letters].downcase.split(' ').include?(lette) }
    if tested == false
      @result = "The word can't be built out of the original grid"
    elsif api(@word)
      @result = "The word is valid according to the grid and is an English word"
    elsif tested
      @result = "The word is valid according to the grid, but is not a valid English word"
    end
  end

  private

  def api(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    the_word_raw = open(url).read
    the_word = JSON.parse(the_word_raw)
    the_word['found']
  end

  def generate_code(number)
    charset = Array('A'..'Z')
    Array.new(number) { charset.sample }
  end
end
