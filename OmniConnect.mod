return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`OmniConnect` encountered an error loading the Darktide Mod Framework.")

		new_mod("OmniConnect", {
			mod_script       = "OmniConnect/scripts/mods/OmniConnect/OmniConnect",
			mod_data         = "OmniConnect/scripts/mods/OmniConnect/OmniConnect_data",
			mod_localization = "OmniConnect/scripts/mods/OmniConnect/OmniConnect_localization",
		})
	end,
	packages = {},
}
