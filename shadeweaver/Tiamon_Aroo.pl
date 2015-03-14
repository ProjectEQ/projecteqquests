# Claw Needle
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Those wretched vermin swarm to our city and trade routes in search of the refuse left by careless travelers who pass through these parts. They are just about useless and their stench brings bile to my throat. I would have set out to poison the whole lot of them if it was not for their unique [claws].");
  }
  if ($text=~/claws/i) {
    quest::say("The claws of the hoppers act as a [spirit anchor]. They are specialized in tearing into the fiber of the shadow beings that roam the thicket. I find these claws useful in binding the silk fashioned by the [shadeweavers].");
  }
  if ($text=~/shadeweavers/i) {
    quest::say("The shadeweavers hunt the beings of shadow found within the thicket. From them they fashion their shadow armor they call Xakra. We have tried to use this strong and lightweight armor in the past, but the shadows just disperse. I have found that sewing this armor onto a suitable [spirit anchor] will keep it from dispersing.");
  }
  if ($text=~/spirit anchor/i) {
    quest::say("A spirit can only materialize within our realm by binding themselves to an object that is a spirit anchor. Some bones and stones have such properties. A spirit anchor can also do the most damage to the material form of such spirits when used as a weapon. I use the claws of the hoppers as a sewing needle of sorts to [bind the silk] made by the [shadeweavers]. A standard sewing needle would only pass through the substance of the silk. The hopper claws can pierce through their ethereal fabric effectively.");
  }
  if ($text=~/bind the silk/i) {
    quest::say("A spirit must be bound to material from our own realm. Stones such as those used to build cities can be great anchors for spirits. The more ritual and culture that a stone is exposed to, the stronger it becomes as an anchor. You can use the claws of a hopper to sew the shadeweavers silk onto a suitable anchor. If you bring me four of these claws, I can fashion one of them into a needle for you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30601 => 4)) {
    quest::say("Well done! You have brought me plenty of claws. I have enough now to make a needle for you. May it serve you well.");
    quest::exp(750);
    quest::summonitem(30617);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: shadeweaver ID: 165159 NPC: Tiamon_Aroo

