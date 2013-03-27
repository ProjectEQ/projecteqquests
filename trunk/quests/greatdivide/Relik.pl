sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Huh? What are ya needin'? Speak up! I ain't got all day. Are you here to help out or just eat up valuable time chatting?");
  }
  if ($text=~/here to help/i) {
    quest::say("Ah, good. That's what I wanted to hear. We be needin' help with supplies. I been needin' pickheads for a while now but the minin' guild hasn't had the stock ta send 'em. We're gonna need ta improvise. I've seen the gashes left in rock after a shardwurm crawled over it and I think that be the thing we need. If ya can bring me four shardwurm claws, maybe I can rig 'em up into enough picks to keep us runnin' on time with our crystal mining.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30262 => 4)) {
    quest::say("Oh, yeah. That's strong, very strong. With these, we can make our shipment for this month. I gotta be thankin' ya properly. This be one of our best tools. Here, ya can swing a pick with us anytime, $name.");
    quest::summonitem(30263);
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414