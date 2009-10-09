#zone: gunthak NPC: Kardin_Nillic (224197)
#site3op & Angelox :)
#Aria of Asceticism (bard quest)
#quest is Titanium version

sub EVENT_SAY { 
if ($text=~/Hail/i){
quest::emote("lifts his gaze from the whitened corpse lying on the bed in front of him. He holds the pale fingers tightly in his hands. As he opens his mouth to speak you shiver as what you thought was a corpse makes a soft moaning sound on the bed next to him. 'What business do you have here? Death grows near for him, what comfort can you hope to bring him in this [plagued] place?");
  }
 elsif ($text=~/plagued/i){
    quest::say("The plague of Innoruuk has infested this island. We now know that many of the fish that can be caught here are diseased and should not be eaten. Of course this knowledge does little to abate the fevers of those already stricken. The Broken Skull pirates seem to be mysteriously [immune] to this plague.");
  }
  elsif ($text=~/immune/i){
    quest::say("Somehow the pirates are able to avoid becoming ill from eating the fish here. We know they're eating the same manner of fish that we are, but something else must be protecting or perhaps curing them of the toxins in the fish. In fact, they seem to always be in good spirits with the boisterous racket of [singing] and fighting that echoes over the island every fortnight.");
  }
  elsif ($text=~/singing/i){
    quest::emote("snickers softly. 'The pirates apparently enjoy songs at meal time. A group of bards seem to have joined them. They sound as if they were trained at the Wind Spirit's Song, but the faded song pages I've seen of theirs read like students of Marsheart's. All the pages I've seen have been faded and largely illegible or I would know for sure.");
 }
}
#He returns to you a book, but this one isn't faded;
sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 59022 => 1)) {
    #not sure what the text is here - please say if you know.
    quest::say("I can't read all of it, Take the rest to Jusean Evanesque of South Qeynos, he will understand.");
    quest::summonitem(59023);
 }
  elsif(plugin::check_handin(\%itemcount, 59024 => 1)) {
    quest::say("You have done well $name, my friend will now be saved, let me share my song with you.");
    quest::exp(1000);
    quest::summonitem(59002);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}