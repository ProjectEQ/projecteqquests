sub EVENT_SAY {
    if ( $text =~ /Hail/i ) {
        quest::emote(
            "puffs up his chest and lifts his chin with hearty arrogance."
        );
        quest::say(
            "Greetings, $name. It seems some of the strange minerals the "    .
            "Wayfarers Brotherhood sold have broken or stopped working as "   .
            "they should. Luckily, I alone have been tasked by Morden Rasp "  .
            "to exchange a Broken Chunk of Coal, a Cracked Ruby, a Charred "  .
            "Pebble, or any other pieces that don't work properly. I need to ".
            "examine it first, though. Let me see what you've got!"
        );
    }
}

sub EVENT_ITEM {
    my $handin = {
        42003 => [ 1, 20,   1 ],    # Cold Slimestone Fragment
        42002 => [ 1, 20,   3 ],    # Crushed Crypt Stone of Genius
        42001 => [ 1, 20,   4 ],    # Gypsum Flake of Improvement
        42005 => [ 1, 20,   5 ],    # Brittle Slate of Keenness
        42007 => [ 1, 30,   1 ],    # Microcline Shard of Knowledge
        42008 => [ 1, 30,   2 ],    # Permafrost Chunk of Resilience
        42006 => [ 1, 30,   3 ],    # Crumbling Crypt Stone of Power
        42010 => [ 1, 30,   4 ],    # Refined Ore of Nimbleness
        42011 => [ 1, 40,   1 ],    # Microcline Shard of Quickness
        42012 => [ 1, 40,   2 ],    # Black Diamond of Deception
        42015 => [ 1, 40,   3 ],    # Crumbled Gravestone of Renewal
        42013 => [ 1, 40,   5 ],    # Warm Emerald Shard
        42020 => [ 1, 60,   1 ],    # Broken Limestone of Focus
        42016 => [ 1, 60,   2 ],    # Icy Bone Chip of the Elements
        42018 => [ 1, 60,   4 ],    # Burning Flake of Pyrite
        42017 => [ 1, 60,   5 ],    # Colorless Crystal of Prevention
        42022 => [ 1, 84,   4 ],    # Prismatic Crystal of Intellect
        42028 => [ 1, 100,  1 ],    # Poison-Covered Slimestone
        42032 => [ 1, 100,  1 ],    # Yellow Microcline Shard of Vigor
        42033 => [ 1, 100,  2 ],    # Glowing Permafrost
        42025 => [ 1, 100,  2 ],    # Crushed Ice Fragment of Visions
        42031 => [ 1, 100,  3 ],    # Burning Crypt Stone Fragment
        42023 => [ 1, 100,  3 ],    # Black Diamond of Preservation
        42027 => [ 1, 100,  3 ],    # Broken Crypt Stone of Fortitude
        42026 => [ 1, 100,  4 ],    # Limonite Orb of Attack
        42022 => [ 1, 100,  4 ],    # Prismatic Crystal of Intellect
        42035 => [ 1, 100,  4 ],    # Refined Ore of Regeneration
        42021 => [ 1, 100,  5 ],    # Brittle Ruby Fragment of Brawn
        42030 => [ 1, 100,  5 ],    # Jagged Slate of Battle Prowess
        42049 => [ 1, 150,  1 ],    # Spore-Covered Pebble of Warding
        42053 => [ 1, 150,  1 ],    # Cracked Slimestone of Guarding
        42036 => [ 1, 150,  1 ],    # Green Microcline Shard of Health
        42045 => [ 1, 150,  1 ],    # Cracked Limestone of Aggression
        42037 => [ 1, 150,  2 ],    # Black Diamond of Advantage
        42054 => [ 1, 150,  2 ],    # Jagged Marble Sphere of Protection
        42050 => [ 1, 150,  2 ],    # Eternal Ice of Avoidance
        42041 => [ 1, 150,  2 ],    # Black Diamond of Knowledge
        42044 => [ 1, 150,  3 ],    # Plain Blood Ruby of Defense
        42040 => [ 1, 150,  3 ],    # Worn Gravestone of Awareness
        42052 => [ 1, 150,  3 ],    # Corroded Crypt Stone of Protection
        42048 => [ 1, 150,  3 ],    # Glowing Black Diamond
        42047 => [ 1, 150,  4 ],    # Opaque Crystal of Deftness
        42039 => [ 1, 150,  4 ],    # Loose Coal of Guarding
        42051 => [ 1, 150,  4 ],    # Notched Shard of Lost Spirits
        42043 => [ 1, 150,  4 ],    # Blazing Flecked Crystal
        42042 => [ 1, 150,  5 ],    # Raw Ruby Shard of the Arcane
        42038 => [ 1, 150,  5 ],    # Enhanced Emerald of Destruction
        42046 => [ 1, 150,  5 ],    # Flawed Ruby Shard of Victory
        42055 => [ 1, 150,  5 ],    # Cracked Sandstone of Health
        42057 => [ 1, 220,  1 ],    # Robust Blue-Flecked Quartz Shard
        42061 => [ 1, 220,  1 ],    # Uneven Quartz of Sturdiness
        42070 => [ 1, 220,  1 ],    # Scarred Limestone of Vengeance
        42191 => [ 1, 220,  2 ],    # Radiant Permafrost Chunk
        42066 => [ 1, 220,  2 ],    # Cracked Icy Shard of Research
        42058 => [ 1, 220,  2 ],    # Lethal Permafrost Chunk
        42062 => [ 1, 220,  2 ],    # Crushed Frozen Shard of Brilliance
        42075 => [ 1, 220,  2 ],    # Eternal Ice of Reconstruction
        42056 => [ 1, 220,  3 ],    # Crypt Stone of Mind Enhancement
        42065 => [ 1, 220,  3 ],    # Gravestone of Dire Melodies
        42073 => [ 1, 220,  3 ],    # Black Diamond of Crippling
        42068 => [ 1, 220,  4 ],    # Cobalt Crystal of Affliction
        42072 => [ 1, 220,  4 ],    # Sharp Crystal of Learning
        42060 => [ 1, 220,  4 ],    # Diffused Ore of Rapidity
        42071 => [ 1, 220,  5 ],    # Dusty Ruby Shard of Prowess
        42063 => [ 1, 220,  5 ],    # Raw Emerald Shard of Malevolence
        42067 => [ 1, 220,  5 ],    # Fractured Ruby Shard of Wellness
        42095 => [ 1, 340,  1 ],    # Limestone of Suffocation
        42082 => [ 1, 340,  1 ],    # Quartz Shard of Force
        42086 => [ 1, 340,  1 ],    # Cold Quartz of Resilience
        42078 => [ 1, 340,  1 ],    # Venom-Coated Slimestone
        42100 => [ 1, 340,  2 ],    # Eternal Ice of Replenishment
        42091 => [ 1, 340,  2 ],    # Heated Shard of Protection
        42087 => [ 1, 340,  2 ],    # Frigid Shard of Cleverness
        42083 => [ 1, 340,  2 ],    # Jagged Permafrost Chunk
        42098 => [ 1, 340,  3 ],    # Rejuvenating Bone Fragment
        42193 => [ 1, 340,  3 ],    # Radiant Diamond Shard
        42077 => [ 1, 340,  3 ],    # Thick Soil of Vitality
        42090 => [ 1, 340,  3 ],    # Night Agent Gravestone Fragment
        42081 => [ 1, 340,  3 ],    # Putrid Soil of Essence
        42093 => [ 1, 340,  4 ],    # Freezing Nickel Fragment
        42085 => [ 1, 340,  4 ],    # Jagged Ore of Foresight
        42192 => [ 1, 340,  4 ],    # Radiant Crystal of Affliction
        42076 => [ 1, 340,  4 ],    # Cylindrical Shard of Acuity
        42097 => [ 1, 340,  4 ],    # Raw Quartz Crystal of Peculiarity
        42092 => [ 1, 340,  5 ],    # Finely Cut Ruby of Capability
        42096 => [ 1, 340,  5 ],    # Warm Ruby of Wellness
        42080 => [ 1, 340,  5 ],    # Grainy Sandstone of Clarity
        42088 => [ 1, 340,  5 ],    # Searing Flawed Emerald Fragment
        42217 => [ 1, 357,  1 ],    # Peerless Crystal of Enticement
        42218 => [ 1, 357,  1 ],    # Peerless Pearl of Magical Warding
        42211 => [ 1, 357,  1 ],    # Peerless Shard of Might
        42219 => [ 1, 357,  2 ],    # Peerless Ruby of Fiery Warding
        42212 => [ 1, 357,  2 ],    # Peerless Jewel of Nimbleness
        42220 => [ 1, 357,  3 ],    # Peerless Diamond of Chilling Protection
        42213 => [ 1, 357,  3 ],    # Peerless Gem of Deftness
        42221 => [ 1, 357,  4 ],    # Peerless Opal of Illness Warding
        42214 => [ 1, 357,  4 ],    # Peerless Sphere of Fortitude
        42216 => [ 1, 357,  5 ],    # Peerless Gemstone of Knowledge
        42215 => [ 1, 357,  5 ],    # Peerless Fragment of Intellect
        42222 => [ 1, 357,  5 ],    # Peerless Emerald of Poison Protection
        42120 => [ 1, 510,  1 ],    # Alluring Limestone of Thrift
        42107 => [ 1, 510,  1 ],    # Magnetite Fragment of Fortitude
        42128 => [ 1, 510,  1 ],    # Slimestone Fragment of Shock
        42196 => [ 1, 510,  1 ],    # Radiant Slimestone of Shock
        42111 => [ 1, 510,  1 ],    # Gray Magnetite of Ingenuity
        42250 => [ 1, 510,  1 ],    # Slippery Slimestone of Endurance
        42256 => [ 1, 510,  1 ],    # Radiant Slate of Health
        42103 => [ 1, 510,  1 ],    # Slimestone Fragment of Ruin
        42129 => [ 1, 510,  2 ],    # Marble Sphere of Disgust
        42195 => [ 1, 510,  2 ],    # Radiant Black Diamond
        42125 => [ 1, 510,  2 ],    # Brilliant Enchanted Prism
        42104 => [ 1, 510,  2 ],    # Smooth Marble Sphere of Prowess
        42108 => [ 1, 510,  2 ],    # Grainy Permafrost of Maiming
        42112 => [ 1, 510,  2 ],    # Icy Shard of Illness Protection
        42116 => [ 1, 510,  2 ],    # Frigid Shard of Acuteness
        42248 => [ 1, 510,  3 ],    # Chilling Orb of Dark Sight
        42115 => [ 1, 510,  3 ],    # Dusty Gravestone of Destruction
        42106 => [ 1, 510,  3 ],    # Tainted Soil of Battle Stance
        42231 => [ 1, 510,  3 ],    # Gravestone of Aggression
        42123 => [ 1, 510,  3 ],    # Blessed Black Diamond
        42119 => [ 1, 510,  3 ],    # Brilliant Blood Ruby of Prowess
        42127 => [ 1, 510,  3 ],    # Eroded Soil of Tenacity
        42102 => [ 1, 510,  3 ],    # Rotted Soil of Avoidance
        42262 => [ 1, 510,  3 ],    # Radiant Gravestone of Endurance
        42197 => [ 1, 510,  3 ],    # Radiant Sphere of Disgust
        42239 => [ 1, 510,  4 ],    # Crushed Slate of Health
        42110 => [ 1, 510,  4 ],    # Slippery Ore of Velocity
        42122 => [ 1, 510,  4 ],    # Obsidian Orb of Endurance
        42126 => [ 1, 510,  4 ],    # Feldspar Fragment of Tolerance
        42114 => [ 1, 510,  4 ],    # Brittle Coal of Prowess
        42118 => [ 1, 510,  4 ],    # Silver-Flecked Crystal of Agony
        42261 => [ 1, 510,  4 ],    # Radiant Prism of Perception
        42101 => [ 1, 510,  4 ],    # Sparkling Sphere of Resistance
        42105 => [ 1, 510,  5 ],    # Dull Sandstone of Ire
        42113 => [ 1, 510,  5 ],    # Sparkling Emerald of Ravaging
        42121 => [ 1, 510,  5 ],    # Flawed Sapphire Sphere of War
        42260 => [ 1, 510,  5 ],    # Radiant Orb of Dark Sight
        42109 => [ 1, 510,  5 ],    # Fractured Diamond Prism of Prowess
        42130 => [ 1, 510,  5 ],    # Shiny Sandstone of Reconstruction
        42249 => [ 1, 510,  5 ],    # Intricate Prism of Perception
        42117 => [ 1, 510,  5 ],    # Raw Sapphire of Proficiency
        42194 => [ 1, 510,  5 ],    # Radiant Crystal of Flame
        42223 => [ 1, 663,  1 ],    # Polished Ore of Power
        42224 => [ 1, 663,  2 ],    # Obsidian Fragment of Durability
        42225 => [ 1, 663,  3 ],    # Ruby Sphere of Intellect
        42228 => [ 1, 663,  3 ],    # Hardened Slate of Protection
        42226 => [ 1, 663,  4 ],    # Tainted Shard of Ingenuity
        42227 => [ 1, 663,  5 ],    # Sparkling Quartz of Resistance
        42153 => [ 1, 760,  1 ],    # Slimestone Fragment of Dread
        42145 => [ 1, 760,  1 ],    # Limestone Shard of Battle Cries
        42199 => [ 1, 760,  1 ],    # Radiant Fragment of Dread
        42136 => [ 1, 760,  1 ],    # Greenish Magnetite of Immunity
        42132 => [ 1, 760,  1 ],    # Yellowish Magnetite of Vitality
        42234 => [ 1, 760,  1 ],    # Cracked Slimestone of Combat
        42157 => [ 1, 760,  1 ],    # Magnetite Shard of Stalwartness
        42133 => [ 1, 760,  2 ],    # Flattened Permafrost
        42237 => [ 1, 760,  2 ],    # Transparent Shard of Thought
        42137 => [ 1, 760,  2 ],    # Distilled Ice of Insight
        42141 => [ 1, 760,  2 ],    # Arctic Ice Shard of Keenness
        42158 => [ 1, 760,  2 ],    # Radiant Permafrost
        42150 => [ 1, 760,  2 ],    # Icy Prism of Avoidance
        42254 => [ 1, 760,  2 ],    # Radiant Shard of Thought
        42131 => [ 1, 760,  3 ],    # Fetid Soil of Hardiness
        42156 => [ 1, 760,  3 ],    # Gory Crypt Stone of Strength
        42251 => [ 1, 760,  3 ],    # Radiant Ore of Combat
        42148 => [ 1, 760,  3 ],    # Black Diamond of Absorption
        42152 => [ 1, 760,  3 ],    # Noxious Soil of Stability
        42140 => [ 1, 760,  3 ],    # Bloodied Gravestone of Cunning
        42257 => [ 1, 760,  4 ],    # Radiant Chunk of Warmth
        42200 => [ 1, 760,  4 ],    # Radiant Mass of Affliction
        42143 => [ 1, 760,  4 ],    # Preserved Pyrite Crystal
        42232 => [ 1, 760,  4 ],    # Polished Sandstone of Ire
        42135 => [ 1, 760,  4 ],    # Translucent Ore of Courage
        42160 => [ 1, 760,  4 ],    # Refined Ore of Wellness
        42151 => [ 1, 760,  4 ],    # Adamantine Orb of Intensity
        42147 => [ 1, 760,  4 ],    # Bastnasite Fragment of Might
        42146 => [ 1, 760,  5 ],    # Sapphire Sphere of Havoc
        42240 => [ 1, 760,  5 ],    # Etched Sandstone of Warmth
        42155 => [ 1, 760,  5 ],    # Gleaming Sandstone of Deflection
        42138 => [ 1, 760,  5 ],    # Heated Desert Emerald Fragment
        42142 => [ 1, 760,  5 ],    # Sapphire Sphere of Comprehension
        42134 => [ 1, 760,  5 ],    # Diamond Prism of Companionship
        42242 => [ 1, 960,  2 ],    # Icy Shard of Resonance
        42243 => [ 1, 960,  4 ],    # Refined Ore of Harmonies
        42204 => [ 1, 1150, 1 ],    # Radiant Marble Sphere of Ire
        42186 => [ 1, 1150, 1 ],    # Smokey Quartz of Peculiarity
        42178 => [ 1, 1150, 1 ],    # Mangled Slimestone
        42161 => [ 1, 1150, 1 ],    # Magnetite Prism of Stoutness
        42207 => [ 1, 1150, 1 ],    # Ooze-Covered Pebble of Perfection
        42170 => [ 1, 1150, 1 ],    # Pristine Limestone of Hatred
        42182 => [ 1, 1150, 1 ],    # Glowing Prism of Brawling
        42209 => [ 1, 1150, 1 ],    # Radiant Ruby of Understanding
        42208 => [ 1, 1150, 2 ],    # Radiant Coal of Prowess
        42183 => [ 1, 1150, 2 ],    # Permafrost Chunk of Marring
        42179 => [ 1, 1150, 2 ],    # Marble Sphere of Ire
        42252 => [ 1, 1150, 2 ],    # Radiant Diamond of Assault
        42229 => [ 1, 1150, 2 ],    # Gleaming Prism of Destruction
        42235 => [ 1, 1150, 2 ],    # Icy Diamond of Assault
        42201 => [ 1, 1150, 2 ],    # Radiant Emerald of Protection
        42187 => [ 1, 1150, 2 ],    # Tundra Ice of Improvement
        42175 => [ 1, 1150, 2 ],    # Eternal Ice Prism of Sense
        42166 => [ 1, 1150, 2 ],    # Polar Ice of Virtue
        42162 => [ 1, 1150, 2 ],    # Glacial Ice of Toughness
        42190 => [ 1, 1150, 3 ],    # Gravestone Fragment of Battle Mastery
        42181 => [ 1, 1150, 3 ],    # Crypt Stone of Resilience
        42173 => [ 1, 1150, 3 ],    # Black Diamond of Regeneration
        42241 => [ 1, 1150, 3 ],    # Gleaming Ore of Dark Healing
        42165 => [ 1, 1150, 3 ],    # Gravestone Fragment of Flailing Dead
        42206 => [ 1, 1150, 3 ],    # Blood Ruby of Understanding
        42203 => [ 1, 1150, 3 ],    # Radiant Diamond of Regeneration
        42177 => [ 1, 1150, 3 ],    # Bloodied Soil of Wit
        42172 => [ 1, 1150, 4 ],    # Glowing Crystal of Endowments
        42205 => [ 1, 1150, 4 ],    # Solid Coal of Prowess
        42168 => [ 1, 1150, 4 ],    # Gold-Flecked Crystal of Negation
        42176 => [ 1, 1150, 4 ],    # Crystal Prism of Perception
        42230 => [ 1, 1150, 4 ],    # Bloodied Ore of Vengeance
        42185 => [ 1, 1150, 4 ],    # Glowing Ore of Rapid Thought
        42202 => [ 1, 1150, 5 ],    # Radiant Crystal of Negation
        42163 => [ 1, 1150, 5 ],    # Sparkling Emerald of Protection
        42188 => [ 1, 1150, 5 ],    # Pristine Emerald of Harm
        42210 => [ 1, 1150, 5 ],    # Radiant Pebble of Perfection
        42258 => [ 1, 1150, 5 ],    # Radiant Ore of Dark Healing
        42180 => [ 1, 1150, 5 ],    # Glowing Sandstone of Focus
        42167 => [ 1, 1150, 5 ],    # Glowing Sapphire of Courage
        42171 => [ 1, 1150, 5 ],    # Pristine White Sapphire of Sense
        42259 => [ 1, 1450, 1 ],    # Radiant Slimestone of Retribution
        42238 => [ 1, 1450, 1 ],    # Pristine Prism of Lucidity
        42244 => [ 1, 1450, 1 ],    # Marble Sphere of Conservation
        42233 => [ 1, 1450, 1 ],    # Cold Slimestone of Fury
        42236 => [ 1, 1450, 3 ],    # Onyx Orb of Aggression
        42245 => [ 1, 1450, 3 ],    # Jagged Gravestone of Affliction
        42255 => [ 1, 1450, 3 ],    # Radiant Prism of Lucidity
        42247 => [ 1, 1450, 4 ],    # Blackened Ore of Retribution
        42246 => [ 1, 1450, 5 ],    # Sparkling Ruby of Fortune
        42253 => [ 1, 1450, 5 ],    # Radiant Orb of Aggression
    };
    foreach my $itemID ( keys %itemcount ) {
        next unless defined $handin->{$itemID};
        my ( $count, $theme, $points ) = @{ $handin->{$itemID} };
        if ( plugin::check_handin(\%itemcount, $itemID => $count ) ) {
            quest::emote("takes the item and tosses it into his satchel.");
            quest::say(
                "Very well, $name. Go ahead and find something else you'd like."
            );
            quest::addldonpoints( $theme, $points );
            last;
        }
    }
    plugin::return_items(\%itemcount );
}