-- scaffold geniefile for libigl

libigl_script = path.getabsolute(path.getdirectory(_SCRIPT))
libigl_root = path.join(libigl_script, "libigl")

libigl_includedirs = {
	path.join(libigl_script, "config"),
	libigl_root,
}

libigl_libdirs = {}
libigl_links = {}
libigl_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { libigl_includedirs }
	end,

	_add_defines = function()
		defines { libigl_defines }
	end,

	_add_libdirs = function()
		libdirs { libigl_libdirs }
	end,

	_add_external_links = function()
		links { libigl_links }
	end,

	_add_self_links = function()
		links { "libigl" }
	end,

	_create_projects = function()

project "libigl"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		libigl_includedirs,
	}

	defines {}

	files {
		path.join(libigl_script, "config", "**.h"),
		path.join(libigl_root, "**.h"),
		path.join(libigl_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
