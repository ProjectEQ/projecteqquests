#zone: gunthak
#quest: Vision Shift
#site3op

sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Eh, who's there? Yender is that you? No you're far too tall to be Yender. You must be one o' them [pirates]!' Redlin then begins to beat furiously on your ankle with his staff. Furiously might be a slightly strong word, as he doesn't seem to be doing any real damage.");
  }
  if($text=~/not a pirate/i) {
    quest::say("Not a pirate, aye? Well lucky thing for you, I would have given you a real thrashing with my stick if you were! I don't suppose you know where I could get a good pair of gnomish glasses around here do ya? Mine broke on the boat ride over and I can't see a thing without 'em.");
  }
}

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 59054 => 1)) {
    quest::emote("takes the spectacles from your hands and puts them up to his eyes and blinks several times.");
    quest::say("Many thanks, $name! I don't know what I would have done without you. Probably stagger around the island half blind for the rest of my life! At any rate I can repay you with a little trick I picked up along the way. If you ever get in a jam, hopefully you won't be as forgetful as I was!");
    quest::emote("hands you a scroll with several runes scrawled across it.");
    quest::exp(1000);
    quest::summonitem(59020);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	$npc->SetAppearance(1);
}