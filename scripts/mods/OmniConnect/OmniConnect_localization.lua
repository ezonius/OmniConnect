return {
	mod_name = {
		en = "OmniConnect",
		ru = "OmniConnect",
		["zh-cn"] = "OmniConnect",
	},
	mod_description = {
		en = "Consolidated Disconnect and Reconnect mod. Use /dis to return to menu/hub, and /retry to disconnect with the ability to reconnect.",
		ru = "Объединенный мод Disconnect и Reconnect. Используйте /dis для возврата в меню/хаб, и /retry для отключения с возможностью переподключения.",
		["zh-cn"] = "整合了 Disconnect 和 Reconnect 的模组。使用 /dis 返回主菜单或大厅，使用 /retry 断开连接并允许重新连接。",
	},
	-- Disconnect
	disconnect_description = {
		en = "Disconnect",
		ru = "Дисконнект",
		["zh-cn"] = "断开连接",
	},
	mod_disconnect = {
		en = "Disconnect in",
		ru = "Дисконнект в",
		["zh-cn"] = "断开连接至",
	},
	opt_main_menu = {
		en = "main menu",
		ru = "Меню",
		["zh-cn"] = "主菜单",
	},
	opt_to_hub = {
		en = "to hub",
		ru = "Лобби",
		["zh-cn"] = "大厅",
	},
	mod_disconnect_party = {
		en = "Leave party",
		ru = "Покинуть группу",
		["zh-cn"] = "离开队伍",
	},
	disconnect_party_tooltip = {
		en = "Automatically leaves the group. Without this function, it is not always possible to successfully return to the Hub, especially if you are playing with friends. Also useful if you use the Reconnect mod with the Automatic Reconnection feature enabled.",
		ru = "Автоматически покидает группу. Без этой функции не всегда удачно возвращает в Хаб, в особенности если вы играете с друзьями. Так же полезна если вы используте мод Reconnect с включенной функцией Автоматического переподключения.",
		["zh-cn"] = "自动离开队伍。如果不使用此功能，有时可能无法成功返回大厅，特别是当你与朋友一起玩时。如果你启用了自动重连功能，这也非常有用。",
	},
	-- Reconnect
	retry_description = {
		en = "Disconnect and return to main menu (reconnectable)",
		["zh-cn"] = "断开连接并返回主菜单（可重新连接）",
		ru = "Отключение и возврат в главное меню (с возможностью повторного подключения)",
	},
	err_not_in_game = {
		en = "Error: you are not in a game",
		["zh-cn"] = "错误：你不在一局游戏中",
		ru = "Ошибка: вы не в игре",
	},
	err_only_one_human = {
		en = "Error: you are the only human player",
		["zh-cn"] = "错误：你是唯一的真人玩家",
		ru = "Ошибка: вы единственный игрок-человек",
	},
	retry_keybind = {
		en = "Keybind for /retry command",
		["zh-cn"] = "命令 /retry 的快捷键",
		ru = "Клавиша для команды /retry",
	},
	leave_keybind = {
		en = "Keybind for /leaveparty command",
		["zh-cn"] = "命令 /leaveparty 的快捷键",
		ru = "Клавиша для команды /leaveparty",
	},
	handle_rejoin_popup = {
		en = "Rejoin popup auto action",
		["zh-cn"] = "重连弹框自动操作",
		ru = "Автоматическое действие при Переподключении",
	},
	handle_rejoin_popup_description = {
		en = "If you have kept auto joining an invalid session, try to open Mod Options and disable this option temporarily.",
		["zh-cn"] = "如果你遇到连续重连已失效的会话，请尝试打开模组选项再临时禁用此选项。",
		ru = "Если вы продолжаете автоматически присоединяться к недействительному сеансу, попробуйте открыть параметры мода и временно отключить эту опцию.",
	},
	opt_do_nothing = {
		en = "Do Nothing",
		["zh-cn"] = "什么都不做",
		ru = "Ничего не делать",
	},
	opt_auto_rejoin = {
		en = Localize("loc_popup_reconnect_to_session_reconnect_button"),
	},
	opt_auto_leave = {
		en = Localize("loc_popup_reconnect_to_session_leave_button"),
	},
	-- Leave
	leave_description = {
		en = "Leave current group (strike team) [/leaveparty]",
		ru = "Покинуть текущую группу (ударную группу) [/leaveparty]",
		["zh-cn"] = "离开当前小组（突击队）[/leaveparty]",
	},
	leave_success = {
		en = "Left group.",
		ru = "Группа покинута.",
		["zh-cn"] = "已离开小组。",
	},
	err_not_in_party = {
		en = "Error: you are not in a group",
		ru = "Ошибка: вы не в группе",
		["zh-cn"] = "错误：你不在小组中",
	},
}
