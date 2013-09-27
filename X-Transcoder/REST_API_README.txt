API USAGE DOCUMENT
___________________________________________________________________
Basic Authentication:
    username: haha@haha.com
    password: 111111

Content Type :
   application/xml or application/json

Body:
   You can pass xml or json data in Body
   
   sample json body

    {
     "email" : "haha@haha.com", 
     "first_name" : "haha", 
     "last_name" : "haha"
    }

   Sample xml body

    <user>
      <email>"haha@haha.com"</email>
      <first-name>haha</first-name>
      <last-name>haha</last-name>
    </user>

NOTE : Content Type should be set to application/xml for xml data in body 
and to application/json for json data in body

API Requests:

=> listing users
   url: http://localhost:3000/api/users
   method: GET
   body : not needed

=> Retrieving User detail
  url: http://localhost:3000/api/users/:id 
  method: GET
  body : not needed

=> creating users
   url: http://localhost:3000/api/users
   method: Post
   Body : It can be xml or json

=> Updating User Profile
  url: http://localhost:3000/api/users/:id 
  method: PUT
  Body : It can be xml or json
  
=> Deleting User 
  url: http://localhost:3000/api/users/:id 
  method: DELETE
  body : not needed