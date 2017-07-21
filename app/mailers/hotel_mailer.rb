class HotelMailer < ApplicationMailer
    default from: "from@example.com"
    add_template_helper(HotelsHelper)

    def hotel_email(hotel)
        @hotel= hotel
        @user = hotel.user
        mail(to: @user.email, subject: 'Hotel status change')
    end
end
