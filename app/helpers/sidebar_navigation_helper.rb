module SidebarNavigationHelper

    def personality_sidebar_info
        if request.path.include?("personality-test") && !request.path.end_with?("/result")
            return @questions 
        end
    end
end
