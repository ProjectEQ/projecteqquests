sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome! Welcome to Shandeling's, the gaming hall of chance! The game room is downstairs. If you are lucky enough to get a Gold Ticket, be sure to bring it to me for a spin on the big wheel of prizes! Make sure to tip your waitress well!"); 
}
 }
 
sub EVENT_ITEM {
$item = quest::ChooseRandom(11668,59509,24890,2469,10895,59504,4164,11604,6631,5667);
if($itemcount{66615} && plugin::check_hasitem($client, $item)){ 
quest::say("I don't have any prizes for you at this time.");
quest::summonitem(66615);
}
elsif($itemcount{66615}){
quest::shout("Ladies and Gentlemen gather around, as our brave $name is turning in their Golden Ticket for a chance at the big time! With a spin of the wheel let us determine the prize. Ladies and gentlemen, the $race wins a prize! Everyone please congratulate $name on this excellent luck!");
quest::summonitem($item);
 }
}