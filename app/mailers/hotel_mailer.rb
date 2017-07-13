class HotelMailer < ApplicationMailer
    default from: "from@example.com"

    def hotel_email(hotel)
        @user = hotel.user
        mail(to: @user.email, subject: 'Your hotel')
    end
end
