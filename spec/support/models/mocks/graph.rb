module Mocks
  class Graph
    def initialize(*args)
    end
    
    def get_object(*args)
      {
        'name' => 'Mooley', 
        'picture' => 'http://www.google.com/images/nav_logo29.png', 
        'id' => "12345", 
        'likes' => {
          'data' => [
          {'name' => 'Robocop', 'category' => '80s Movies', 'id' => "1234556"},
          {'name' => 'Lost Boys', 'category' => '80s Movies', 'id' => "1234557"}
          ]
        }
      }
    end
    
    def get_connections(first, second, third)
      case second
        when 'likes'
        return  [
        {"name"=>"LukeYoung Music", "category"=>"Musician/band", "id"=>"10150104667300221", "created_time"=>"2011-01-22T07:52:52+0000"}, 
        {"name"=>"Zach Galifianakis", "category"=>"Public figure", "id"=>"33615965244", "created_time"=>"2011-01-22T07:51:58+0000"}, 
        {"name"=>"Robotech", "category"=>"Tv show", "id"=>"234880208284", "created_time"=>"2011-01-22T07:29:07+0000"}, 
        {"name"=>"Alameda, California", "category"=>"City", "id"=>"104033399634478", "created_time"=>"2010-09-11T23:23:14+0000"}, 
        {"name"=>"Rush Limbaugh", "category"=>"Public figure", "id"=>"136264019722601", "created_time"=>"2010-08-14T06:27:58+0000"}, 
        {"name"=>"Phil Hendrie Show Flashback", "category"=>"Local business", "id"=>"76146952246", "created_time"=>"2010-05-25T18:38:42+0000"}, 
        {"name"=>"PlayHaven", "category"=>"Website", "id"=>"91490420804", "created_time"=>"2010-05-25T18:38:42+0000"},
        {'name' => 'Robocop', 'category' => '80s Movies', 'id' => "1234556"}
        ]
        
        when 'friends'
        return  [
        {"name"=>"Steve Wood", "id"=>"501685463", "picture"=>"http://profile.ak.fbcdn.net/hprofile-ak-snc4/hs222.ash2/48813_501685463_6736778_q.jpg"}, 
        {"name"=>"Luke TheBoss Young", "id"=>"507899127", "picture"=>"http://profile.ak.fbcdn.net/hprofile-ak-snc4/hs1430.snc4/173185_507899127_5865515_q.jpg"}, 
        {"name"=>"Carlo Irwin", "id"=>"516599583", "picture"=>"http://profile.ak.fbcdn.net/hprofile-ak-snc4/hs625.ash1/27420_516599583_2291_q.jpg"}, 
        {"name"=>"Joe Garcia", "id"=>"526869583", "picture"=>"http://profile.ak.fbcdn.net/hprofile-ak-snc4/hs1324.snc4/161509_526869583_1072082_q.jpg"}
        ]
      end
    end
  end
end