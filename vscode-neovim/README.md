
## VS Code - Neovim

This configuration makes use of vscode-neovim extension coupled with LUA config from native neovim.

It makes primary use of the following plugins:

 - Vim Surround 
     - Used for adding characters like quotation marks and others around text and/or text objects.
     - **Essential plugin** (for me)
     - Sourced from neovim's plugin ecosystem.
     - Keybind is slightly different from the default. See `init.lua` for the new keybinds.
 - Binocular
     - Vscode vim extension used to emulate `telescope` functionality originally from neovim.
     - Requires multiple dependencies. See the marketplace of this extension for details. 
 - EasyMotion
	 - For better navigation. Replacement for Vim Sneak since it doesn't play well with my current config :(
 - QuickScope
	 - An auxilliary plugin for `f` and `t` commands as well as their counterparts to help highlight words.

~~- Vim Sneak
            - Alternative to `f` characters.
            - Keybinds are different from the original due to conflicts.
            - Sourced from neovim.
            - Keybind is set to `v`, along with its uppercase counterpart for backward search.~~

Keybindings in this config are greatly changed, they can be located in `keybindings.json` file once the profile is loaded.

Initially it would be in the `init.lua` file for centralizing configs at once, but due to challenges from VSCode itself from implementing their full functionality *i.e.* works in all contexts (terminal, explorer), it has been moved over to `keybindings.json`

Honestly a pain to work with, but until I fully migrate to neovim as my text editor (who knows when that'll be), this will do for now.

<hr>

**P.S.** As of this writing, I was going to include the ***neovim statusline*** extension from VS code marketplace but it has some quirks when it comes to setup depending on which environment you're in, at least in my experience. So I'm gonna leave this info here in case you're interested to do that on your own.
