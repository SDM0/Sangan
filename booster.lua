SMODS.Atlas({
    key = "boosters",
    path = "boosters.png",
    px = 71,
    py = 95
})

SMODS.Booster({
    key = "structure_pack",
    atlas = "sgn_boosters",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    config = {
        choose = 1,
        extra = 5,
        packs = {}
    },
    cost = 4,
    kind = "sgn_structure",
    group_key = "k_sgn_structure_pack_group",
    get_weight = function()
        return G.sgn_structure_pack_spawn_type == 1 and 0 or 0.75
    end,
    create_card = function(self, card)
        JoyousSpring.in_pack_selection = true
        local pack = get_pack("sgn_structure_booster", "sgn_structure")
        local i = 1
        while (not pack or card.ability.packs[pack.key]) do
            pack = get_pack("sgn_structure_booster_reroll" .. i, "sgn_structure")
            i = i + 1
        end
        JoyousSpring.in_pack_selection = nil
        card.ability.packs[pack.key] = true
        local booster = SMODS.create_card({
            key = (pack or { key = "p_joy_secret_pack_1" }).key,
            area = G.pack_cards,
        })
        booster.ability.joy_modify_cost = { cost = 0 }
        booster:set_cost()
        return booster
    end,
    ease_background_colour = function(self)
        if not G.GAME.joy_enter_selection_pack then
            G.GAME.joy_enter_selection_pack = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            JoyousSpring.INFO_MENU.open("secret_pack", nil, true)
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
        ease_colour(G.C.DYN_UI.MAIN, G.C.JOY.TRAP)
        ease_background_colour({ new_colour = G.C.JOY.TRAP, special_colour = G.C.BLACK, contrast = 2 })
    end,
    dependencies = {"JoyousSpring"}
})

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    -- Prevent weight change due to config change mid run
    self.sgn_structure_pack_spawn_type = SGN_MOD.config.spawn_type
    game_start_run_ref(self, args)
end

SGN_MOD.structure_booster = JoyousSpring.secret_booster:extend{
    class_prefix = 'p_structure_pack',
    atlas = "sgn_boosters",
    pos = { x = 0, y = 0 },
    kind = "sgn_structure",
    group_key = "k_sgn_booster_group",
    dependencies = {"JoyousSpring"}
}

SGN_MOD.structure_booster({
    key = "dragonmaid",
    joy_secret = {
        properties = { { monster_archetypes = { "Dragonmaid" } } },
        extra_keys = {},
        center = "j_joy_dmaid_house"
    }
})

SGN_MOD.structure_booster({
    key = "livetwin",
    joy_secret = {
        properties = { { monster_archetypes = { "LiveTwin" } }, { monster_archetypes = { "EvilTwin" } } },
        extra_keys = {},
        center = "j_joy_ltwin_channel"
    }
})

SGN_MOD.structure_booster({
    key = "dogmatika",
    joy_secret = {
        properties = { { monster_archetypes = { "Dogmatika" } } },
        extra_keys = {},
        center = "j_joy_dogma_nation"
    }
})

SGN_MOD.structure_booster({
    key = "ghostgirls",
    joy_secret = {
        properties = { { monster_archetypes = { "GhostGirls" } } },
        extra_keys = {},
        center = "j_joy_yokai_ash"
    }
})

SGN_MOD.structure_booster({
    key = "spright",
    joy_secret = {
        properties = { { monster_archetypes = { "Spright" } } },
        extra_keys = {},
        center = "j_joy_spright_gigantic"
    }
})

SGN_MOD.structure_booster({
    key = "mekknight",
    joy_secret = {
        properties = { { monster_archetypes = { "MekkKnight" } } },
        extra_keys = {},
        center = "j_joy_mekkleg_scars"
    }
})

SGN_MOD.structure_booster({
    key = "generaider",
    joy_secret = {
        properties = { { monster_archetypes = { "Generaider" } } },
        extra_keys = {},
        center = "j_joy_generaider_boss_stage"
    }
})

SGN_MOD.structure_booster({
    key = "ghoti",
    joy_secret = {
        properties = { { monster_archetypes = { "Ghoti" } } },
        extra_keys = {},
        center = "j_joy_fish_depths"
    }
})

SGN_MOD.structure_booster({
    key = "psyframe",
    joy_secret = {
        properties = { { monster_archetypes = { "PSYFrame" } } },
        extra_keys = {},
        center = "j_joy_psy_circuit"
    }
})

SGN_MOD.structure_booster({
    key = "runick",
    joy_secret = {
        properties = { { monster_archetypes = { "Runick" } } },
        extra_keys = {},
        center = "j_joy_runick_fountain"
    }
})

SGN_MOD.structure_booster({
    key = "burningabyss",
    joy_secret = {
        properties = { { monster_archetypes = { "BurningAbyss" } } },
        extra_keys = {},
        center = "j_joy_ba_malacoda"
    }
})

SGN_MOD.structure_booster({
    key = "labrynth",
    joy_secret = {
        properties = { { monster_archetypes = { "Labrynth" } } },
        extra_keys = {},
        center = "j_joy_lab_labyrinth"
    }
})

SGN_MOD.structure_booster({
    key = "subterror",
    joy_secret = {
        properties = { { monster_archetypes = { "Subterror" } } },
        extra_keys = {},
        center = "j_joy_sub_city"
    }
})

SGN_MOD.structure_booster({
    key = "eldlich",
    joy_secret = {
        properties = { { monster_archetypes = { "Eldlich" } } },
        extra_keys = {},
        center = "j_joy_eld_mad"
    }
})

SGN_MOD.structure_booster({
    key = "ignister",
    joy_secret = {
        properties = { { monster_archetypes = { "Ignister" } } },
        extra_keys = {},
        center = "j_joy_ignis_ailand"
    }
})

SGN_MOD.structure_booster({
    key = "solfachord",
    joy_secret = {
        properties = { { monster_archetypes = { "Solfachord" } } },
        extra_keys = {},
        center = "j_joy_solfa_harmonia"
    }
})

SGN_MOD.structure_booster({
    key = "witchcrafter",
    joy_secret = {
        properties = { { monster_archetypes = { "Witchcrafter" } } },
        extra_keys = {},
        center = "j_joy_witch_vicemadame"
    }
})

SGN_MOD.structure_booster({
    key = "shaddoll",
    joy_secret = {
        properties = { { monster_archetypes = { "Shaddoll" } } },
        extra_keys = {},
        center = "j_joy_shaddoll_prison"
    }
})

SGN_MOD.structure_booster({
    key = "paleozoic",
    joy_secret = {
        properties = { { monster_archetypes = { "Paleozoic" } } },
        extra_keys = {},
        center = "j_joy_paleo_anomalo"
    }
})

SGN_MOD.structure_booster({
    key = "invoked",
    joy_secret = {
        properties = { { { monster_archetypes = { "Invoked" } }, { monster_archetypes = { "Aleister" } } } },
        extra_keys = {},
        center = "j_joy_invoked_meltdown"
    }
})

SGN_MOD.structure_booster({
    key = "danger",
    joy_secret = {
        properties = { { monster_archetypes = { "Danger" } } },
        extra_keys = {},
        center = "j_joy_danger_disorder"
    }
})

SGN_MOD.structure_booster({
    key = "adamancipator",
    joy_secret = {
        properties = { { monster_archetypes = { "Adamancipator" } } },
        extra_keys = {},
        center = "j_joy_adaman_laputite"
    }
})

SGN_MOD.structure_booster({
    key = "virtualworld",
    joy_secret = {
        properties = { { monster_archetypes = { "VirtualWorld" } } },
        extra_keys = {},
        center = "j_joy_vw_shenshen"
    }
})

SGN_MOD.structure_booster({
    key = "flowercardian",
    joy_secret = {
        properties = { { monster_archetypes = { "FlowerCardian" } } },
        extra_keys = {},
        center = "j_joy_cardian_lightflare"
    }
})

SGN_MOD.structure_booster({
    key = "fortunelady",
    joy_secret = {
        properties = { { monster_archetypes = { "FortuneLady" } } },
        extra_keys = {},
        center = "j_joy_flady_every"
    }
})

SGN_MOD.structure_booster({
    key = "mimighoul",
    joy_secret = {
        properties = { { monster_archetypes = { "Mimighoul" } } },
        extra_keys = {},
        center = "j_joy_mimi_dungeon"
    }
})

SGN_MOD.structure_booster({
    key = "artifact",
    joy_secret = {
        properties = { { monster_archetypes = { "Artifact" } } },
        extra_keys = {},
        center = "j_joy_artifact_dagda"
    }
})

SGN_MOD.structure_booster({
    key = "purrely",
    joy_secret = {
        properties = { { monster_archetypes = { "Purrely" } } },
        extra_keys = {},
        center = "j_joy_purr_street"
    }
})

SGN_MOD.structure_booster({
    key = "beetrooper",
    joy_secret = {
        properties = { { monster_archetypes = { "Beetrooper" } } },
        extra_keys = {},
        center = "j_joy_bee_hercules"
    }
})

SGN_MOD.structure_booster({
    key = "battlewasp",
    joy_secret = {
        properties = { { monster_archetypes = { "Battlewasp" } } },
        extra_keys = {},
        center = "j_joy_wasp_partisan"
    }
})

SGN_MOD.structure_booster({
    key = "zoodiac",
    joy_secret = {
        properties = { { monster_archetypes = { "Zoodiac" } } },
        extra_keys = {},
        center = "j_joy_zoo_boar"
    }
})

SGN_MOD.structure_booster({
    key = "centurion",
    joy_secret = {
        properties = { { monster_archetypes = { "CenturIon" } } },
        extra_keys = {},
        center = "j_joy_centur_standup"
    }
})

SGN_MOD.structure_booster({
    key = "whiteforest",
    joy_secret = {
        properties = { { monster_archetypes = { "WhiteForest" } } },
        extra_keys = {},
        center = "j_joy_wforest_witch"
    }
})

SGN_MOD.structure_booster({
    key = "dracotail",
    joy_secret = {
        properties = { { monster_archetypes = { "Dracotail" } } },
        extra_keys = {},
        center = "j_joy_dracotail_arthalion"
    }
})

SGN_MOD.structure_booster({
    key = "skystriker",
    joy_secret = {
        properties = { { monster_archetypes = { "SkyStriker" } } },
        extra_keys = {},
        center = "j_joy_striker_areazero"
    }
})

SGN_MOD.structure_booster({
    key = "voicelessvoice",
    joy_secret = {
        properties = { { monster_archetypes = { "VoicelessVoice" } } },
        extra_keys = {},
        center = "j_joy_voice_skull"
    }
})

SGN_MOD.structure_booster({
    key = "drytron",
    joy_secret = {
        properties = { { monster_archetypes = { "Drytron" } } },
        extra_keys = {},
        center = "j_joy_dry_fafnir"
    }
})

SGN_MOD.structure_booster({
    key = "hazyflame",
    joy_secret = {
        properties = { { monster_archetypes = { "HazyFlame" } } },
        extra_keys = {},
        center = "j_joy_hazy_basil"
    }
})

SGN_MOD.structure_booster({
    key = "timethief",
    joy_secret = {
        properties = { { monster_archetypes = { "TimeThief" } } },
        extra_keys = {},
        center = "j_joy_thief_double"
    }
})

SGN_MOD.structure_booster({
    key = "darkmagician",
    joy_secret = {
        properties = { { monster_archetypes = { "DarkMagician" } } },
        extra_keys = {},
        center = "j_joy_dm_salvation"
    }
})

SGN_MOD.structure_booster({
    key = "sforce",
    joy_secret = {
        properties = { { monster_archetypes = { "SForce" } } },
        extra_keys = {},
        center = "j_joy_sforce_bridgehead"
    }
})

SGN_MOD.structure_booster({
    key = "eotw",
    joy_secret = {
        properties = { { monster_archetypes = { "Ruin" } }, { monster_archetypes = { "Demise" } } },
        extra_keys = {},
        center = "j_joy_eotw_breaking"
    }
})

