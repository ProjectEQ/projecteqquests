# Velium Retreival
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Uuuuhhh, how goes it, $race? Oh, I'm doin' jest fine down here, just hanging around... Mining! Yes mining for our fearless leader, the Dain. Yessiree... sssoooooo...");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1725 => 1)) {
    quest::emote("Hmmm, not sure why you're giving me all this. <cough> 50 pieces <cough> of platinum <cough> Whew, wow, I may be coming down with <cough> and the note <cough> something.");
    quest::setglobal("shipment",1,0,"D1");
  }
  elsif (($shipment == 1) && ($platinum >= 50)) {
    quest::emote("darts his eyes about the room before retrieving a large box from under the table. He takes the platinum and the note, then hands you the box without a word. ");
    quest::summonitem(29064);
    quest::delglobal("shipment");
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: thurgadina ID: 115008 NPC: Ungdin

