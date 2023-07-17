class User < ApplicationRecord
       # validates :name, presence: true
       validate :email_uniqueness_custom_validation
       validates :password, presence: true, length: { minimum: 6 }
       validates :role, presence: true
       enum role: { admin: 0, patient: 1, doctor: 2 }


       private

       def email_uniqueness_custom_validation
              existing_user = User.find_by(email: email)
              if existing_user && existing_user.id != id
                     errors.add(:email, 'has already been taken')
              end
       end
end
