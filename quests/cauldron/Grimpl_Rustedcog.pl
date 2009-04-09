#zone Cauldron
# by Angelox

sub EVENT_SAY {
if($text=~/Hail/i) {
    quest::say("Whaddya want Human? I don't have all day. I have work to do and no time to chat with the likes of you.");
}else{
  #do nothing
   }
}

