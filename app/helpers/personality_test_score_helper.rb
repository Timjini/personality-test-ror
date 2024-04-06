module PersonalityTestScoreHelper

    def calculate_score(answers, score_mapping)
        total_score = 0 
        
        answers.each_with_index do |answer, index|
            total_score += score_mapping[index][answer]
        end
            total_score
    end

    def determine_personality(score, threshold)
        score >= threshold ? "Extrovert" : "Introvert"
    end

end