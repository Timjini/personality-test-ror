module PersonalityTestHelper

    def personality_test_questions_options
        questions = [
            "Being around people makes me feel...",
            "To prepare for a night out...",
            "Teamwork or group work: which do I prefer?",
            "What's your idea of the perfect date?",
            "During parties or social gatherings, I tend to..."
        ]
        options = [
            ["I'd rather be alone.","Being around others can be fun but tiring.","Like I'm alive!"],
            ["I get all my friends together to plan where we'll dance the night away.","Prepare? My friends have to drag me out most nights.","Call a few of my closest friends to see what they're planning."],
            ["Work by myself.","Work with as many people as possible.","Work as part of a small group."],
            ["Something quiet and intimate like watching a movie together on the couch.","A live concert surrounded by other screaming fans.","Dinner at a nice restaurant followed by a show."],
            ["Spend time with a few people that I know. It's about quality not quantity.","Keep to myself. You can find me planted on the wall or by the punch bowl.","Talk to as many people as I can. I've been called a social butterfly."]
        ]

        [questions, options]
    end

    def personality_test_score_mapping 
         scores = [
            [0, 1, 2], 
            [2, 0, 1], 
            [2, 0, 1], 
            [1, 0, 2], 
            [2, 0, 1] 
        ]
       [scores]
    end

end