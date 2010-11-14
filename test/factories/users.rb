Factory.define :user do |u|
   u.sequence(:username) { |n| "foo#{n}" }   
   u.password "123456" 
   u.password_confirmation { |t| t.password }  
   u.email "foo@example.com" 
end
