# items: 48041, 48044, 4267, 48043, 48042
sub EVENT_SAY {

if($text=~/hail/i) {
     quest::say("Hmm. . .is there something I can help you with? I am far too [busy] to listen to your problems though so I take that back.");
}
if($text=~/busy/i) {
     quest::say("It is none of your concern unless you are truly gifted in the dark   art of necromancy. If so, you will have some form of proof to show me.");
}
 if($text=~/wish to hear/i && $skullcap == 1) {
    quest::say("I have recently found a volume on summoning a great minion from the Great Library of Charasis but I can't find all of the needed items. Being as I am one of the [sages of Cabilis], I request you go and [collect these items] for me.");
}
if($text=~/sages of cabilis/i && $skullcap == 1) {
     quest::say("Ah, they are all but a memory now. We used to be welcome within the city of Cabilis but our quest for greater power led to our exile. No matter now, go retrieve the items and you will be one of the chosen to walk beside greatness.");
}
if($text=~/collect these items/i && $skullcap == 1) {
     quest::say("As you should broodling. The the first is a brittle bone, which was once used for reincarnations. The second item is a poisoned soul, this is from an iksar that died a cruel and twisted death. The death was so awful, it's spirit still roams around angry. The third you will find in the burning heat. The final item is a gem of reflection. I have yet to find someone that knows how to create one. Even those fools in Cabilis probably wouldn't know. Maybe you can locate that one yourself. Bring all of these items back to me and I shall do the rest.");
   quest::summonitem(48041); # Item: Ixpacan's Tome
}
 }

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 48044 => 1, 4267 => 1)) {
quest::say("I see now that I lack the skill necessary to control the Dark Arts. Maybe it would be wiser to allow another such as yourself to continue forward. Please accept this token as a reward in your mastering of the Dark Arts.");
      quest::exp(20000);
      quest::summonitem(48043); # Item: Demi Lich Skullcap
}
if (plugin::check_handin(\%itemcount, 4267 => 1)) {
     quest::summonitem(4267); # Item: Necromancer Skullcap
     quest::setglobal("skullcap", 1, 5, "F");
     quest::say("Oh, I see you are truly gifted in the dark arts. Well I will explain my dilemma to you now if you [wish to hear].");
}
if (plugin::check_handin(\%itemcount, 48042 => 1)) {
      my $x = $npc->GetX();
      my $y = $npc->GetY();
      my $z = $npc->GetZ();
      my $h = $npc->GetHeading();
      quest::say("Wonderful! You have brought all of the items I have asked for. Your future seems very bright with the rest of the Sages. Step back now as I conjure the child of Charasis.");
      quest::emote("As Ixpacan starts his incantations, you can see an image begin to appear from the shadows.");
      quest::spawn2(93189,0,0,$x,$y + 5,$z,$h); # NPC: child_of_Charasis
      quest::say("It's out of my control! Defeat it before it destroys us both!");
}
plugin::return_items(\%itemcount); # return unused items
 }

#END of FILE Zone:Overthere ID:93148 - Ixpacan (Ixpacan.pl)