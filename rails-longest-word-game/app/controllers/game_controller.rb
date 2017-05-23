require 'open-uri'
require 'json'

class GameController < ApplicationController
  def game
    a = ('a'..'z').to_a
    selection = a.sample(10)
    @random = selection.join
    @starttime = Time.now.to_i
  end

  def included?(word, grid)
    word.split.all? { |l| word.count(l) <= grid.count(l) }
  end

  def score
    @grid = params[:letters]
    @word = params[:word]
    endtime = Time.now.to_i
    if included?(@word, @grid) && get_translation(@word)
      starttime = params[:starttime].to_i
      @timer = endtime - starttime
      @calcscore = compute_score(@word, @timer)
    else
      @calcscore = "Please use letters from the Grid"
    end
  end


  def compute_score(attempt, time_taken)
  (time_taken > 60.0) ? 0 : attempt.size * (1.0 - time_taken / 60.0)
  end

  def get_translation(word)
  api_key = "61679a20-71fa-4f11-9471-70393ff78ef9"
    begin
      response = open("https://api-platform.systran.net/translation/text/translate?source=en&target=fr&key=#{api_key}&input=#{word}")
      json = JSON.parse(response.read.to_s)
      if json['outputs'] && json['outputs'][0] && json['outputs'][0]['output'] && json['outputs'][0]['output'] != word
        return json['outputs'][0]['output']
      end
    rescue
      if File.read('/usr/share/dict/words').upcase.split("\n").include? word.upcase
        return word
      else
        return nil
      end
    end
  end
end


