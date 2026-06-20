SGN_MOD = SMODS.current_mod
SGN_CONF = SGN_MOD.config

assert(SMODS.load_file("booster.lua"))()

SMODS.Atlas({
    key = "sangan",
    path = "sangan.png",
    px = 71,
    py = 95
})

-- Only exists for the title card
SMODS.Joker({
    key = "sangan",
    atlas = 'sgn_sangan',
    pos = { x = 0, y = 0 },
    in_pool = function() return false end,
    discovered = true,
    no_collection = true,
})

SGN_MOD.calculate = function(self, context)
    if context.starting_shop then
        if G.sgn_structure_pack_spawn_type ~= 2 then
            SMODS.add_booster_to_shop("p_sgn_structure_pack")
        end
    end
end

SGN_MOD.menu_cards = function()
    if not JoyousSpring.config.disable_main_menu then
        return {
            key = "j_sgn_sangan",
            no_edition = true,
            func = function()
                for _, card in ipairs(G.title_top.cards) do
                    if (((card.config or {}).center or {}).original_mod or {}).id == "sangan" then
                        card.click = function(self)
                            SMODS.LAST_SELECTED_MOD_TAB = nil
                            G.FUNCS.openModUI_sangan()
                        end
                    end
                end
            end
        }
    end
end

SGN_MOD.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 8, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {n=G.UIT.C, config={minw = 3, padding=0.1}, nodes={
                {n=G.UIT.R, config={minh=0.1}},
                create_option_cycle({label = localize('sgn_spawn_type'), current_option = SGN_CONF.spawn_type, options = localize('sgn_spawn_type_options'), ref_table = SGN_MOD.config, ref_value = 'spawn_type', colour = G.C.RED, no_pips = true, opt_callback = 'cycle_update'}),
            }}
        }
    }
end