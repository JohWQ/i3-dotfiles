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

-- Border:
require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
}

-- relative-motions:
require("relative-motions"):setup({ show_numbers="relative", show_motion = true, enter_mode ="first" })

-- bunny hops:
 require("bunny"):setup({
   hops = {
     { key = "/",          path = "/",                                               },
     { key = "t",          path = "/tmp",                                            },
     { key = "o",          path = "/opt",                                            },
     { key = { "u", "b" }, path = "/usr/local/bin",          desc = "Local bin"      },
    { key = { "u", "a" }, path = "/usr/share/applications", desc = ".desktop files" },
    { key = "4",          path = "/mnt/4TB",                desc = "SMB Share"      },
    { key = "m",          path = "/media",                  desc = "Drives"         },
    { key = "T",          path = "~/.local/share/Trash",    desc = "Trash"          },
    { key = "i",          path = "~/.config/i3",            desc = "i3wm config"    },
    { key = "s",          path = "~/.config/scripts",       desc = "scripts"        },
    { key = "y",          path = "~/.config/yazi",          desc = "Yazi config"    },
    { key = "c",          path = "~/.config",               desc = "Config files"   },
    { key = "d",          path = "~/Downloads",             desc = "Downloads"      },
    { key = "D",          path = "~/Documents",             desc = "Documents"      },
    { key = "p",          path = "~/Pictures/",             desc = "Pictures"       },
    { key = "h",          path = "~",                       desc = "Home"           },
    -- key and path attributes are required, desc is optional
  },
  desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
  ephemeral = true, -- Enable ephemeral hops, default is true
  tabs = true, -- Enable tab hops, default is true
  notify = false, -- Notify after hopping, default is false
  fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
