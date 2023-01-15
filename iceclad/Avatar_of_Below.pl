# Avatar of Below
# items: 8895, 1200

sub EVENT_SPAWN {
   quest::emote("'s voice echoes through the area. 'The efforts to help the Coldain and bring them together with the gnomes of Iceclad is quite impressive. There will be no doubt that they will continue to increase in power until they can overtake the Giants of Zek. Hey there, what is that on your shoulder?'");
   quest::settimer("avatarshawl",900);
}

sub EVENT_SAY {
   if ($text=~/runed coldain prayer shawl/i) {
      quest::say("So it is the sacred rune of Coldain. Let me have a closer look at it.");
   }
}

sub EVENT_ITEM {
   # Runed Coldain Prayer Shawl (approved)
   if (plugin::check_handin(\%itemcount, 8895 => 1)) {
      quest::emote("holds the shawl up close to one eye to look at the rune sewn into it. He smiles to himself and then drops it to the ground and places one hand on it. A bright blue glow starts to emanate in the snow, then there is a sudden flash! The Avatar has dissipated. All that is left behind is the Shawl lying in the snow, shimmering with a new power. $name slowly bends down to pick it up, and is infused with a blessing from Brell.");
      quest::summonitem(1200); # Item: Blessed Coldain Prayer Shawl
      quest::signalwith(110118, 10, 5); # NPC: General_Bragmur_
      quest::stoptimer("avatarshawl");
      quest::depop();
   }
}

sub EVENT_SIGNAL  {
   if ($timer eq "avatarshawl") {
      quest::stoptimer("avatarshawl");
      quest::depop();
   }
}