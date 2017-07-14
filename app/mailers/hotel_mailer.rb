class HotelMailer < ApplicationMailer
    default from: "from@example.com"

    def hotel_email(hotel)
        @hotel=hotel
        @user = hotel.user
        mail(to: @user.email, subject: 'Hotel status change')
    end
end
