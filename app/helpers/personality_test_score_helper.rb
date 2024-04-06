module PersonalityTestScoreHelper

    def calculate_score(answers, scores)
        total_score = 0
        # score is array inside array :)
        formatted_scores = scores[0]

        answers.each_with_index do |answer, answer_index|
        # Access the score match option array/index with score array/index
        score = formatted_scores[answer_index][answer]
            total_score += score
        puts "Answer index: #{answer_index}, Answer: #{answer}"

        end

        return total_score
        puts "Total score helper return #{total_score}"
    end



    def determine_personality(score, threshold)
        return score >= threshold ? "💃🏽 Extrovert" : "🫠 Introvert"
    end

end