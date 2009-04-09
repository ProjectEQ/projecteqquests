sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is a pleasure to meet you. friend.  Please let me know if you have trouble finding the book that you seek.  If you request something that we do not have available. I can make a note to keep an eye out for it.  We are getting in a great variety of interesting new material these days.  Speaking of which. I need someone to take a tome to Elder Animist Dumul.  He has been frantically researching something or another.  I'm sure that you could pry a little and learn more about it if you were to take this book to him.  Is that something that you would be interested in doing?");
}
if($text=~/yes/i){
quest::say("You have a braver spirit than mine. friend. but I'm glad that someone is available to assist me.  Take care and keep alert.  The Khati Sha seem to be very troubled by something of late.");
quest::summonitem("9061"); }
}
#END of FILE Zone:sharvahl  ID:155228 -- Historian_Sharar 

