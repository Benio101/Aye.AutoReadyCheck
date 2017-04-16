local Aye = Aye;
if not Aye.load then return end;

Aye.options.args.AutoReadyCheck = {
	name = "Auto Ready Check",
	type = "group",
	args = {
		header1 = {
			order = 1,
			type = "header",
			name = "Auto Ready Check",
		},
		description2 = {
			order = 2,
			type = "description",
			name = "On Ready Check, automatically respond as |cffe6cc80Ready|r.\n",
		},
		enable = {
			order = 3,
			name = "Enable",
			desc = "Enable Auto Ready Check",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.enable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.enable = v end,
		},
		execute5 = {
			order = 5,
			type = "execute",
			name = "Disable & Reload",
			func = function() DisableAddOn("Aye.AutoReadyCheck"); ReloadUI(); end,
			hidden = function() return Aye.db.global.AutoReadyCheck.enable end,
		},
		description6 = {
			order = 6,
			type = "description",
			name = "This module is currently temporary |cff9d9d9ddisabled|r at will and should no longer work.\n"
				.. "|cff9d9d9dIf you wish to keep this module disabled, you should disable related addon completelly.\n"
				.. "You can always re–enable module by re–enabling related addon addon the same way.\n|r"
			,
			hidden = function() return Aye.db.global.AutoReadyCheck.enable end,
		},
		execute7 = {
			order = 7,
			type = "execute",
			name = "Default module settings",
			desc = "Reset settings of this module to default.\n\n|cff9d9d9dIf you wish to reset settings of all Aye modules instead, "
				.. "use \"Defaults\" options from left bottom corner of \"Interface\" window, then select \"These Settings\".|r"
			,
			func = function()
				Aye.db.global.AutoReadyCheck = CopyTable(Aye.default.global.AutoReadyCheck);
				Aye.libs.ConfigRegistry:NotifyChange("Aye");
			end,
			hidden = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		header11 = {
			order = 11,
			type = "header",
			name = "Player Options",
		},
		AFKdisable = {
			order = 13,
			name = "|cffe6cc80Disable|r if AFK",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.AFKdisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.AFKdisable = v end,
			disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		DNDdisable = {
			order = 14,
			name = "|cffe6cc80Disable|r if DND",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.DNDdisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.DNDdisable = v end,
			disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		DeadDisable = {
			order = 16,
			name = "|cffe6cc80Disable|r if Dead",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.DeadDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.DeadDisable = v end,
			disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		CombatDisable = {
			order = 17,
			name = "|cffe6cc80Disable|r if in Combat",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.CombatDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.CombatDisable = v end,
			disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		NotFullHealthDisable = {
			order = 19,
			name = "|cffe6cc80Disable|r if Not at Full Health",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.NotFullHealthDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.NotFullHealthDisable = v end,
			disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		NotFullPowerDisable = {
			order = 20,
			name = "|cffe6cc80Disable|r if Not at Full Power",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.NotFullPowerDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.NotFullPowerDisable = v end,
			disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		group31 = {
			order = 31,
			type = "group",
			inline = true,
			name = "",
			args = {
				NoBiSFlaskDisable = {
					order = 33,
					name = "|cffe6cc80Disable|r if No BiS Flask",
					type = "toggle",
					get = function() return Aye.db.global.AutoReadyCheck.NoBiSFlaskDisable end,
					set = function(_, v) Aye.db.global.AutoReadyCheck.NoBiSFlaskDisable = v end,
					disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
				},
				NoRuneDisable = {
					order = 34,
					name = "|cffe6cc80Disable|r if No Rune",
					type = "toggle",
					get = function() return Aye.db.global.AutoReadyCheck.NoRuneDisable end,
					set = function(_, v) Aye.db.global.AutoReadyCheck.NoRuneDisable = v end,
					disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
				},
				NotWellFedDisable = {
					order = 36,
					name = "|cffe6cc80Disable|r if Not Well Fed",
					type = "toggle",
					get = function() return Aye.db.global.AutoReadyCheck.NotWellFedDisable end,
					set = function(_, v) Aye.db.global.AutoReadyCheck.NotWellFedDisable = v end,
					disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
				},
				WellFedTier = {
					order = 37,
					name = "Required Well Fed Tier",
					desc = "Minimum required Well Fed Tier\n\nTier 1: +225 stat or |cffffffff|Hitem:133564::::::::110:265::::::|h[Spiced Rib Roast]|h|r\n"
						.. "Tier 2: +300 stat or |cffffffff|Hitem:133569::::::::110:265::::::|h[Drogbar-Style Salmon]|h|r\n"
						.. "Tier 3: +375 stat or |cffffffff|Hitem:133574::::::::110:265::::::|h[Fishbrul Special]|h|r\n"
						.. "Tier 4: +400 stat or +600 stamina\nTier 5: +500 stat or +750 stamina"
					,
					type = "range",
					min = 1,
					max = 5,
					softMin = 1,
					softMax = 5,
					bigStep = 1,
					get = function() return Aye.db.global.AutoReadyCheck.WellFedTier end,
					set = function(_, v) Aye.db.global.AutoReadyCheck.WellFedTier = v end,
					disabled = function() return
							not Aye.db.global.AutoReadyCheck.enable
						or	not Aye.db.global.AutoReadyCheck.NotWellFedDisable
					end,
				},
				header39 = {
					order = 39,
					type = "header",
					name = "Minimum Buff Time",
				},
				BuffTimeEnable = {
					order = 41,
					name = "Enable Minimum Buff Time",
					type = "toggle",
					get = function() return Aye.db.global.AutoReadyCheck.BuffTimeEnable end,
					set = function(_, v) Aye.db.global.AutoReadyCheck.BuffTimeEnable = v end,
					disabled = function() return
							not Aye.db.global.AutoReadyCheck.enable
						or (
									not Aye.db.global.AutoReadyCheck.NoBiSFlaskDisable
								and	not Aye.db.global.AutoReadyCheck.NoRuneDisable
								and	not Aye.db.global.AutoReadyCheck.NotWellFedDisable
							)
					end,
				},
				BuffTime = {
					order = 42,
					name = "Minimum Buff Time |cff9d9d9d(min)|r",
					desc = "|cffe6cc80Disable|r Auto Ready Check if player buff is close to expire |cff9d9d9d(with remaining time left ≤ given minutes)|r",
					type = "range",
					min = 0,
					max = 60,
					softMin = 0,
					softMax = 20,
					bigStep = 1,
					get = function() return Aye.db.global.AutoReadyCheck.BuffTime end,
					set = function(_, v) Aye.db.global.AutoReadyCheck.BuffTime = v end,
					disabled = function() return
							not Aye.db.global.AutoReadyCheck.enable
						or	not Aye.db.global.AutoReadyCheck.BuffTimeEnable
						or (
									not Aye.db.global.AutoReadyCheck.NoBiSFlaskDisable
								and	not Aye.db.global.AutoReadyCheck.NoRuneDisable
								and	not Aye.db.global.AutoReadyCheck.NotWellFedDisable
							)
					end,
				},
			},
		},
		header51 = {
			order = 51,
			type = "header",
			name = "Instance Filter",
		},
		GuildGroupDisable = {
			order = 53,
			name = "|cffe6cc80Disable|r in Ally Group",
			desc = "|cffe6cc80Disable|r in Ally Group |cff9d9d9d(at least half of other members are either friends or guildmates)|r",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.GuildGroupDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.GuildGroupDisable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.GuildGroupForceEnable
			end,
		},
		LFGDisable = {
			order = 54,
			name = "|cffe6cc80Disable|r in LFG group",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.LFGDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.LFGDisable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.LFGForceEnable
			end,
		},
		PvPDisable = {
			order = 56,
			name = "|cffe6cc80Disable|r on PvP",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.PvPDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.PvPDisable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.PvPForceEnable
			end,
		},
		OutsideInstanceDisable = {
			order = 57,
			name = "|cffe6cc80Disable|r outside Instance",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.OutsideInstanceDisable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.OutsideInstanceDisable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.OutsideInstanceForceEnable
			end,
		},
		ForceDisableIfMythicBenched = {
			order = 59,
			name = "|cffe6cc80Force Disable|r if Mythic Benched |cff9d9d9d(in Ally Group outside party #1–4)|r",
			desc = "|cffe6cc80Force Disable|r in Ally Group |cff9d9d9d(at least half of other members are either friends or guildmates)|r on Mythic difficulty if outside party #1–4.\n\n"
				.. "|cffe6cc80Force Disable|r|cff9d9d9d is most important and overwrites |cffe6cc80Force Enable|r|cff9d9d9d.|r"
			,
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoReadyCheck.ForceDisableIfMythicBenched end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.ForceDisableIfMythicBenched = v end,
			disabled = function() return not Aye.db.global.AutoReadyCheck.enable end,
		},
		header61 = {
			order = 61,
			type = "header",
			name = "Force Enable",
		},
		description62 = {
			order = 62,
			type = "description",
			name = "Force Enable Auto Ready Check independing of Player Options.\n",
		},
		GuildGroupForceEnable = {
			order = 63,
			name = "|cffe6cc80Force Enable|r in Ally Group",
			desc = "|cffe6cc80Force Enable|r in Ally Group |cff9d9d9d(at least half of other members are either friends or guildmates)|r",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.GuildGroupForceEnable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.GuildGroupForceEnable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.GuildGroupDisable
			end,
		},
		LFGForceEnable = {
			order = 64,
			name = "|cffe6cc80Force Enable|r in LFG group",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.LFGForceEnable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.LFGForceEnable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.LFGDisable
			end,
		},
		PvPForceEnable = {
			order = 66,
			name = "|cffe6cc80Force Enable|r on PvP",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.PvPForceEnable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.PvPForceEnable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.PvPDisable
			end,
		},
		OutsideInstanceForceEnable = {
			order = 67,
			name = "|cffe6cc80Force Enable|r outside Instance",
			type = "toggle",
			get = function() return Aye.db.global.AutoReadyCheck.OutsideInstanceForceEnable end,
			set = function(_, v) Aye.db.global.AutoReadyCheck.OutsideInstanceForceEnable = v end,
			disabled = function() return
					not Aye.db.global.AutoReadyCheck.enable
				or	Aye.db.global.AutoReadyCheck.OutsideInstanceDisable
			end,
		},
	},
};