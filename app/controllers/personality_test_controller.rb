class PersonalityTestController < ApplicationController
  include PersonalityTestHelper
  include PersonalityTestScoreHelper

  def index
  end

  def clear_session_and_cache
    session.clear
    Rails.cache.clear
    redirect_to personality_test_path(session: 0)
  end

  def personality_test 
      # puts "-----------#{params}"
      @questions, @options, @score_mapping = personality_test_questions_options
      session[:step] ||=  0

      @question = @questions[session[:step]]

      # puts "---#{option}--------#{selected_options}------------"

      if params[:back]
        session[:step] -= 1 unless session[:step].zero?
            puts "----------#{session[:step]} ======"
      session[:options_selected].pop
      redirect_to personality_test_path(session: session[:step])
      end


  end

  def result
      @questions, @options, @score_mapping = personality_test_questions_options

      # initialize array of answers
      session[:options_selected] ||= []

      if !session[:step].nil? && session[:step] < @questions.length - 1
        session[:step] += 1

        # Get the selected option
        selected_option = params[:option].to_i

        # save answers to array
        session[:options_selected] << selected_option

        puts "--------#{session[:options_selected]}------------"

        # move to next question
        redirect_to personality_test_path(session: session[:step])
      else
        redirect_to personality_test_result_path
      end
  end



  def completed
    @personality = session[:personality_result]
  end

end
