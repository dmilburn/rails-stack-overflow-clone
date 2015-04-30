class User < ActiveRecord::Base
 has_secure_password
 has_many :questions
 has_many :answers
 has_many :responses
 has_many :votes, foreign_key: :voter_id
end