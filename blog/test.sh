rails generate scaffold Role name:string --force

rails generate scaffold Community pincode:string city:string state:string country:string --force

rails generate scaffold Profile firstName:string LastName:string gender:string DOB:date phone:string email:string verified:integer verify_id:integer inactive:integer role_id:integer community_id:integer showPhone:integer verifytime:timestamp door_no:string --force

rails generate scaffold Posts community_id:integer profile_id:integer title:string body:string create_date:timestamp update_date:timestamp type:integer priority:integer report:integer rating:float rateCount:integer --force

rails generate scaffold Yellowpages profile_id:integer name:string phone:string address:string description:string verified:integer community_id:integer AveRating:float totalRatings:integer --force

rails generate scaffold Comment profile_id:integer description:string type:integer createdate:timestamp report:integer --force

rails generate scaffold Tag name:string post_id:integer profile_id:integer type:integer --force

rails generate scaffold Rating post_id:integer profile_id:integer rate:integer rated_at:timestamp type:integer Description:string --force

rails generate scaffold Report profile_id:integer post_id:integer type:integer profile_id:integer reason:string reported_at:timestamp --force

rails generate scaffold Poll profile_id:integer post_id:integer options:text user_response:text interim:integer finish_time:timestamp anonimity:integer vote_type:integer community_id:integer restricted_id:integer  --force

rails generate scaffold User email:string password_digest:string
