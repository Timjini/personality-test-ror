class PersonalityTestController < ApplicationController
  include PersonalityTestHelper
  include PersonalityTestScoreHelper

  def index
  end

  def clear_session_and_cache
    # clear saved sessions
    session.clear
    Rails.cache.clear
    redirect_to personality_test_path(session: 0)
  end

  def initiate
     @questions, @options = personality_test_questions_options
     session[:options_selected] ||= []
     session[:step] ||=  0
     @question = @questions[session[:step]]
     @personality = session[:personality_result]
  end

  def personality_test 
      initiate
      if !params[:session]
        session[:step] -= 1 unless session[:step].zero?
        # remove selected option
        session[:options_selected].pop
        redirect_to personality_test_path(session: session[:step])
      end

  end

  def result
    initiate

    puts "params?????????????????????????? #{params}"

    if !session[:step].nil? && session[:step] < @questions.length - 1
      puts"-------------------------------#{params[:option]}"
      next_step
    else
      scores = personality_test_score_mapping
      last_step(scores)
    end
  end


  def completed
    initiate
  end

  def next_step
    session[:step] += 1

      # Get the selected option
      selected_option = params[:option].to_i

      # Save answers to array
      session[:options_selected] << selected_option

      puts "--------#{session[:options_selected]}------------"

      # Move to next question
      redirect_to personality_test_path(session: session[:step])
  end

  def last_step(scores)
    session[:options_selected] << params[:option].to_i
    # return in case of error a flash message would be appropriate
      if scores[0].length != session[:options_selected].length
        puts "Error: Mismatched lengths between questions and scores , #{scores.inspect}"
        return
      end

      # calculate score
      threshold = 6
      final_score = calculate_score(session[:options_selected], scores)
      session[:personality_result] = determine_personality(final_score, threshold)
      
      redirect_to personality_test_result_path
  end

  private 


end
