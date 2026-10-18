local mod = get_mod("OmniConnect")

local StateMainMenu = require("scripts/game_states/game/state_main_menu")
local MechanismHub = require("scripts/managers/mechanism/mechanisms/mechanism_hub")
local LoadingHost = require("scripts/loading/loading_host")
local memory = mod:persistent_table("memory")

-- =============================================================================
-- Reconnect Logic
-- =============================================================================

function mod.on_game_state_changed(status, state_name)
	if state_name ~= "StateGameplay" then
		return
	end
	if status == "enter" then
		memory.in_game = true
	else
		memory.in_game = false
	end
end

mod.retry_func = function()
	if not memory.in_game then
		mod:echo(mod:localize("err_not_in_game"))
		return
	end
	if not Managers.multiplayer_session then
		mod:echo(mod:localize("err_not_in_game"))
		return
	end
	if not Managers.party_immaterium:game_session_in_progress() then
		mod:echo(mod:localize("err_not_in_game"))
		return
	end
	local players = Managers.player:players()
	local human = 0
	for _, player in pairs(players) do
		if player:is_human_controlled() and player.player_unit then
			human = human + 1
		end
	end
	if human < 2 then
		mod:echo(mod:localize("err_only_one_human"))
		return
	end
	Managers.multiplayer_session:leave("pong_timeout")
end

mod.retry_keybind_func = function()
	if not Managers.ui:chat_using_input() then
		mod:retry_func()
	end
end

mod:command("retry", mod:localize("retry_description"), function()
	mod:retry_func()
end)

mod:hook(StateMainMenu, "_show_reconnect_popup", function(func, self)
	local handle_rejoin_popup = mod:get("handle_rejoin_popup")
	if handle_rejoin_popup == "rejoin" then
		self._reconnect_pressed = true
		self:_rejoin_game()
		return
	elseif handle_rejoin_popup == "leave" then
		if Managers.party_immaterium then
			Managers.party_immaterium:leave_party()
		end
		return
	end
	return func(self)
end)

mod:hook(MechanismHub, "_show_retry_popup", function(func, self)
	local handle_rejoin_popup = mod:get("handle_rejoin_popup")
	if handle_rejoin_popup == "rejoin" then
		self:_retry_join()
		return
	elseif handle_rejoin_popup == "leave" then
		if Managers.party_immaterium then
			Managers.party_immaterium:leave_party()
		end
		return
	end
	return func(self)
end)

mod:hook(LoadingHost, "load_mission", function(func, self, loading_context)
	if not loading_context then
		Log.warning("OmniConnect", "Attempted to load mission without loading_context. Skipping to prevent crash.")
		return
	end
	return func(self, loading_context)
end)

-- =============================================================================
-- Disconnect Logic
-- =============================================================================

mod.Disconnect_func = function()
	local disconnect = mod:get("mod_disconnect")
	local leave_party = mod:get("mod_disconnect_party")

	if leave_party then
		Managers.party_immaterium:leave_party()
	end

	if disconnect == "exit_to_main_menu" then
		Managers.multiplayer_session:leave("exit_to_main_menu")
	elseif disconnect == "leave_to_hub" then
		Managers.multiplayer_session:leave("leave_to_hub")
	end
end

mod:command("dis", mod:localize("disconnect_description"), function()
	mod:Disconnect_func()
end)

-- =============================================================================
-- Leave Logic
-- =============================================================================

mod.leave_party_func = function()
	local party_immaterium = Managers.party_immaterium
	if party_immaterium and party_immaterium:num_other_members() > 0 then
		party_immaterium:leave_party()
		mod:echo(mod:localize("leave_success"))
	else
		mod:echo(mod:localize("err_not_in_party"))
	end
end

mod:command("leaveparty", mod:localize("leave_description"), function()
	mod.leave_party_func()
end)

mod:command("lp", mod:localize("leave_description"), function()
	mod.leave_party_func()
end)

mod.leave_keybind_func = function()
	if not Managers.ui:chat_using_input() then
		mod.leave_party_func()
	end
end

mod.disconnect_keybind_func = function()
	if not Managers.ui:chat_using_input() then
		mod:Disconnect_func()
	end
end
