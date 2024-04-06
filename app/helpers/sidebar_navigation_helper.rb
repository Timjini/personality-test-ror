module SidebarNavigationHelper

    def personality_sidebar_info
        if request.path.include?("personality-test")
            return @questions 
        end
    end
end
