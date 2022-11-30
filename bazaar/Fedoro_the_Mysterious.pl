# Class-Change NPC
# Characters use 'CharID-Class-Unlocks-Available'

sub EVENT_SAY {

    my $charKey = $client->CharacterID();

    if ($text=~/hail/i) {
        if (quest::get_data($charKey . "-CadricMet") >= 0) {
            plugin::NPCTell("Hail, ". $client->GetCleanName() ."! You look like an adventurer to me. If [". quest::saylink("cad1a",1,"I'm right") ."], we can be of great help to each other.");
        }
    } elsif ($text=~/cad1a/i) { #I'm right
        plugin::NPCTell("Perfect! I have a unique talent - I can grant you the ability to shift your spirit, allowing you to pick up a different set of skills. You'll be as weak as 
                        newborn kitten at first, but only at first. Better yet, as you flex your new skills and regain experience, you'll find that many of your new abilities will carry
                        over to different aspects of your spirit. I can open up new [". quest::saylink("Classes",1) ."] for you to explore, but you'll need to some [". quest::saylink("favors",1) .
                        "] for me, first.");
    } 
}