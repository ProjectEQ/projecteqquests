# items: 5954, 5955
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Oh. hello there $name.  Thank you for stopping by. but this is just not a very good time for visitors.  My daughter is very upset over what has happened."); }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 5954 =>1 )) {
  quest::say("Ah so Gawfed wants his vase.  Unfortunately that vase has been broken.  Maybe you could go and speak with Chogar so that he can repair the vase.  Then Gawfed and I can finish our transaction.");  #ad lib text
  quest::summonitem(5955);  #need confirmation of item from live
}  
plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155263 -- Jihli_Mahej 

