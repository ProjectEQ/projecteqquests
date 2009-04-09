#BeginFile: halas\Kevan_McPherson.pl
#Quest file for halas - Kevan McPherson: Shield Frame Mold (Guktan Shield No. 2)

sub EVENT_SAY {
 
if($text=~/hail/i) {
  quest::say("Well met, $name! I'm Kevan McPherson, the best darn smith in the north. Have ye come to purchase my finely crafted weapons or are ye wanting me ta teach ya the secrets of Northman smithing?");
  }
  if($text=~/kintok/i) {
    quest::say("He did, did he? How is that fool doing? Its been a while since I saw him last! So, what has he sent you here for? Oh, a mold? I have a stockpile of those laying around. I suppose I could part with one if you were able to somehow get a fire goblin skin.");
  }
  if($text=~/what northman kite shields/i){
    quest::say("To smith a Northman kite shield ye'll need a kite shield mold. a smithy hammer. a flask of water and a medium quality folded sheet metal. Remember ye'll have ta smith the metal sheet in a regular forge and finish the shield in our special Northman forge."); 
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,2361 => 1)) { #Fire Goblin Skin
    quest::say("Well, arent you full of surprises! I appreciate you retrieving this for me, as I cant really leave my shop here for very long, the services I provide are nearly irreplacable. As promised, here is your mold! Good luck!");
    quest::summonitem(51114); #Shield Frame Mold
  }
  else {
    quest::say("I have no need for this, $name.");
    quest::return_items(\%itemcount);
  }
}
#EOF: halas\Kevan_McPherson.pl