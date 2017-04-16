local Aye = Aye;
if not Aye.addModule("Aye.AutoReadyCheck") then return end;

Aye.modules.AutoReadyCheck.events.READY_CHECK = function()
	if Aye.modules.AutoReadyCheck.check() then
		ConfirmReadyCheck(true);
		ReadyCheckFrame:Hide();
	end;
end;

-- Check if AutoReadyCheck can be performed
--
-- @noparam
-- @return {bool} AutoReadyCheck if AutoReadyCheck can be performed
Aye.modules.AutoReadyCheck.check = function()
	if not Aye.db.global.AutoReadyCheck.enable then return false end;
	
	if Aye.db.global.AutoReadyCheck.ForceDisableIfMythicBenched	and Aye.utils.Player.IsMythicBenched()				then return false end;	-- Force Disable if Mythic Benched
	
	if Aye.db.global.AutoReadyCheck.GuildGroupForceEnable		and Aye.utils.Player.InAllyGroup()					then return true end;	-- Force Enable in Guild group
	if Aye.db.global.AutoReadyCheck.LFGForceEnable				and IsPartyLFG()									then return true end;	-- Force Enable in LFG group
	if Aye.db.global.AutoReadyCheck.PvPForceEnable				and Aye.utils.Player.IsOnPvP()						then return true end;	-- Force Enable on PvP
	if Aye.db.global.AutoReadyCheck.OutsideInstanceForceEnable	and not IsInInstance()								then return true end;	-- Force Enable outside Instance
	
	if Aye.db.global.AutoReadyCheck.AFKdisable					and UnitIsAFK("player")								then return false end;	-- Disable if AFK
	if Aye.db.global.AutoReadyCheck.DNDdisable					and UnitIsDND("player")								then return false end;	-- Disable if DND
	if Aye.db.global.AutoReadyCheck.DeadDisable					and UnitIsDeadOrGhost("player")						then return false end;	-- Disable if Dead
	if Aye.db.global.AutoReadyCheck.CombatDisable				and UnitAffectingCombat("player")					then return false end;	-- Disable if in Combat
	if Aye.db.global.AutoReadyCheck.NotFullHealthDisable		and UnitHealth("player") < UnitHealthMax("player")	then return false end;	-- Disable if Not at Full Health
	if Aye.db.global.AutoReadyCheck.NotFullPowerDisable			and UnitPower("player") < UnitPowerMax("player")	then return false end;	-- Disable if Not at Full Power
	if Aye.db.global.AutoReadyCheck.GuildGroupDisable			and Aye.utils.Player.InAllyGroup()					then return false end;	-- Disable in Guild group
	if Aye.db.global.AutoReadyCheck.LFGDisable					and IsPartyLFG()									then return false end;	-- Disable in LFG group
	if Aye.db.global.AutoReadyCheck.PvPDisable					and Aye.utils.Player.IsOnPvP()						then return false end;	-- Disable on PvP
	if Aye.db.global.AutoReadyCheck.OutsideInstanceDisable		and not IsInInstance()								then return false end;	-- Disable outside Instance
	
	for _, buffGroup in pairs({
		-- condition			settings condition to check
		-- checkingFunction		util function to check condition
		-- arg2					2nd function argument
		
		{ -- Disable if No BiS Flask
			condition = Aye.db.global.AutoReadyCheck.NoBiSFlaskDisable,
			checkingFunction = Aye.utils.Buffs.UnitHasFlask,
			arg2 = nil,
		},
		{ -- Disable if No Rune
			condition = Aye.db.global.AutoReadyCheck.NoRuneDisable,
			checkingFunction = Aye.utils.Buffs.UnitHasRune,
			arg2 = nil,
		},
		{-- Disable if Not Well Fed
			condition = Aye.db.global.AutoReadyCheck.NotWellFedDisable,
			checkingFunction = Aye.utils.Buffs.UnitIsWellFed,
			arg2 = Aye.db.global.AutoReadyCheck.WellFedTier,
		},
	}) do
		if buffGroup.condition then
			local buff, note = buffGroup.checkingFunction("player", buffGroup.arg2);
			if
					buff ~=1
				or	(
							Aye.db.global.AutoReadyCheck.BuffTimeEnable
						and	note <= Aye.db.global.AutoReadyCheck.BuffTime
					)
			then
				return false;
			end;
		end;
	end;
	
	return true;
end;