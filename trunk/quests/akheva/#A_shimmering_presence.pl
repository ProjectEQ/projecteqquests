sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("'s voice invades your mind, drawing images of past present and future together into a perverse harmony. Some images you recognize as your own, but the others seem to be coming from the spirit's own [memories].");
  }
  if ($text=~/memories/i) {
    quest::emote(" begins to glow a bit brighter. Your mind is filled with visions of a great swirl of clouds and lightning. You can almost feel the wind of the storm creeping into the chinks in your armor. It looks as if the storm is creeping across the surface of Luclin. You see several figures standing at the entrance of a [great temple]. The storm seems to be bearing down on them.");
  }
  if ($text=~/great temple/i) {
    quest::emote(" continues to flood your mind with images of the storm bearing down on the temple. Your view suddenly shifts. You're still looking at the storm, but it appears to be moving toward you this time. There is a creature beside you wearing a robe, holding a scepter in one of his...four arms! He is obviously the leader of the group, As he is wearing beautiful [ornate robes] compared to the rest of the four armed figures around you. ");
  }
  if ($text=~/ornate robes/i) {
    quest::emote(" glows brighter still as your vision turns to follow the robed figure up the stairs of the entrance to the temple. The figure raises his scepter toward the storm and begins to recite some unfamiliar words. A crackle of magical energy blazes across the sky seemingly in defiance of the raging storm. The energy quickly dissipates however, and the storm continues to bear down on the temple. The figure cries out in pain as the scepter in his hand shatters into many shards. The sofly glowing gem from the scepter head rolls silently down the steps and disappears. ");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,10294 => 1)) {
    quest::emote("begins to quiver and shake. The formless entity appears to grow and shrink in complete disregard to natural laws. The light in the temple around you appears to slowly dim until you are surrounded by an impenetrable cloak of shadows. Fear grips your heart as your vision slowly adapts to accommodate the low light. When you can finally make out the figure before you, you find yourself silently praying for the darkness to return. ");
    quest::spawn(179144,0,0,$x,$y,$z);
    quest::exp(10000);
    quest::ding();
    quest::depop();
  }

  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:akheva  NPC:179165 -- #A_shimmering_presence 