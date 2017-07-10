module HotelsHelper
    def hotel_image hotel
        if hotel.image.present?
            image_tag(hotel.image, :class => "img-responsive center-block")
        else
            image_tag("A_blank_flag.png", :class => "img-responsive center-block")
        end
    end

    def hotel_rating hotel      
        case hotel.rate  
            when 0
                content_tag(:p,"Отсутствует", style: "display:inline")        
            when 1 
                content_tag(:p,"Ужасно", style: "display:inline; color:red")                       
            when 2 
                content_tag(:p,"Плохо", style: "display:inline; color:yellow")
            when 3 
                content_tag(:p,"Нормально", style: "display:inline; color:inherit")
            when 4 
                content_tag(:p,"Хорошо", style: "display:inline; color:green")
            when 5 
                content_tag(:p,"Отлично", style: "display:inline; color:blue")  
        end                
       
            
        
    end

    def hotel_star_rating hotel   
        case hotel.star  
            when 0
                content_tag(:p,"Отсутствует", style: "display:inline;")               
            when 1 
                content_tag(:p,"Tourist (\u2605)", style: "display:inline;")                       
            when 2 
                content_tag(:p,"Standard (\u2605\u2605)", style: "display:inline;")
            when 3 
                 content_tag(:p,"Comfort (\u2605\u2605\u2605)", style: "display:inline;")
            when 4 
                content_tag(:p,"First Class (\u2605\u2605\u2605\u2605)", style: "display:inline;")
            when 5 
                content_tag(:p,"Luxury (\u2605\u2605\u2605\u2605\u2605)", style: "display:inline;")  
        end    
    end
end