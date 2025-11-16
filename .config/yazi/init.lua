------------------------------------------------------------------
-- Default rule override:
function Linemode:mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		return ""
	elseif os.date("%Y", time) == os.date("%Y") then
		return os.date("%d/%m %H:%M", time)
	else
		return os.date("%d/%m  %Y", time)
	end
end

-- Add linemode option:
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	-- Options: "%b", "%k", "%m", "%g", "%t", "%p", "%e", "%z", "%y", "%r", "%q"
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%p %d/%m %H:%M", time)
	else
		time = os.date("%p %d/%m %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end
------------------------------------------------------------------
-- Folder saving preferences:
local pref_by_location = require("pref-by-location")
pref_by_location:setup({
	prefs = { -- (Optional)
	},
})

------------------------------------------------------------------
-- Border:
require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
})

-- relative-motions:
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })

-- Augment command:
-- Custom configuration
-- https://github.com/hankertrix/augment-command.yazi

------------------------------------------------------------------
-- bunny hops:
require("bunny"):setup({
	hops = {
		{ key = "/", path = "/" },
		{ key = "t", path = "/tmp" },
		{ key = "e", path = "/etc" },
		{ key = "o", path = "/opt" },
		{ key = { "u", "l", "b" }, path = "/usr/local/bin", desc = "Local bin" },
		{ key = { "u", "b" }, path = "/usr/bin", desc = "binaries" },
		{ key = { "u", "s" }, path = "/usr/share", desc = "usr share" },
		{ key = { "u", "a" }, path = "/usr/share/applications", desc = ".desktop files" },
		{ key = { "m", "4" }, path = "/mnt/4TB", desc = "SMB Share" },
		{ key = { "m", "m" }, path = "/media", desc = "Drives" },
		{ key = { "m", "e" }, path = "/media/EXT4HDD4TB/", desc = "EXT4 HDD" },
		{ key = { "m", "n" }, path = "/media/NTFSHDD4TB/", desc = "NTFS HDD" },
		{ key = { "m", "s" }, path = "/media/SSD1TB", desc = "NTFS SSD" },
		{ key = { "m", "w" }, path = "/media/WINDOWS/", desc = "Windows" },
		{ key = "T", path = "~/.local/share/Trash", desc = "Trash" },
		{ key = "n", path = "~/.config/nvim", desc = "Neovim config" },
		{ key = "r", path = "~/.config/i3status-rust", desc = "i3status-rs config" },
		{ key = "i", path = "~/.config/i3", desc = "i3wm config" },
		{ key = { "s", "s" }, path = "~/.config/scripts", desc = "scripts" },
		{ key = "y", path = "~/.config/yazi", desc = "Yazi config" },
		{ key = "f", path = "~/dotfiles", desc = "dotfiles" },
		{ key = "c", path = "~/.config", desc = "Config files" },
		{ key = { "s", "m" }, path = "~/Music", desc = "Music" },
		{ key = { "s", "M" }, path = "~/Music/music-SERVER/Metal_Rock", desc = "Metal Music" },
		{ key = { "s", "H" }, path = "~/Music/music-SERVER/Hip-hop_Pop", desc = "Hip-hop Music" },
		{ key = { "s", "A" }, path = "~/Music/music-SERVER/Ambient", desc = "Ambient Music" },
		{ key = "d", path = "~/Downloads", desc = "Downloads" },
		{ key = "D", path = "~/Documents", desc = "Documents" },
		{ key = "p", path = "~/Pictures", desc = "Pictures" },
		{ key = "v", path = "~/Videos", desc = "Videos" },
		{ key = "h", path = "~", desc = "Home" },
		-- key and path attributes are required, desc is optional
	},
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true, -- Enable ephemeral hops, default is true
	tabs = true, -- Enable tab hops, default is true
	notify = false, -- Notify after hopping, default is false
	fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
