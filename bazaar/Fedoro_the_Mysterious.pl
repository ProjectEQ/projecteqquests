# Class-Change NPC
# Characters use 'CharID-Class-Unlocks-Available'

sub EVENT_SAY {

    my $charKey = $client->CharacterID();

    if ($text=~/hail/i) {
        if (quest::get_data($charKey . "-CadricMet") >= 0) {
            plugin::NPCTell("Hail, ". $client->GetCleanName() ."! You look like an adventurer to me. If [". quest::saylink("cad1a",1,"I'm right") ."], we can be of great help to each other.");
        } else {
             plugin::NPCTell("Hail, ". $client->GetCleanName() .", good to see you again. Are you ready to do another [". quest::saylink("cad1c",1,"favor") ."] for me?");
        }
    } elsif ($text=~/cad1a/i) { #I'm right
        plugin::NPCTell("Perfect! I have a unique talent - I can grant you the ability to shift your spirit, allowing you to pick up a different set of skills. You'll be as weak as 
                        newborn kitten at first, but only at first. Better yet, as you flex your new skills and regain experience, you'll find that many of your new abilities will carry
                        over to different aspects of your spirit. I can open up new [". quest::saylink("cad2b",1,"Classes") ."] for you to explore, but you'll need to do some [". 
                        quest::saylink("cad1c",1,"favors") ."] for me, first.");
    } elsif ($text=~/cad1b/i) { #Classes

    } elsif ($text=~/cad1c/i) { #Classes
        plugin::NPCTell("");
    } elsif ($text=~/warrior/i) {
        plugin::NPCTell("trying to unlock war");
        $client->GrantAlternateAdvancementAbility(30196, 1);
    }
}