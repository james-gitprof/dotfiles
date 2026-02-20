## VS Code - Neovim

This configuration makes use of vscode-neovim extension coupled with LUA config from native neovim.

It makes primary use of the following plugins:

- Vim Surround 
            - Used for adding characters like quotation marks and others around text and/or text objects.
            - Essential.
            - Sourced from neovim.
            - Keybind is slightly different from the default. See `init.lua` for the new keybinds.
- Vim Sneak
            - Alternative to `f` characters.
            - Keybinds are different from the original due to conflicts.
            - Sourced from neovim.
            - Keybind is set to `v`, along with its uppercase counterpart for backward search.
            
- Binocular
            - Vscode vim extension used to emulate `telescope` functionality
            - Requires multiple dependencies. See the marketplace of this extension for details.

Keybindings in this config are greatly changed, they can be located in `keybindings.json` file once the profile is loaded.

Initially it would be in the `init.lua` file for centralizing configs at once, but due to challenges from VSCode itself from implementing their full functionality *i.e.* works in all contexts (terminal, explorer), it has been moved over to `keybindings.json`

Honestly a pain to work with, but until I fully migrate to neovim as my text editor (who knows when that'll be), this will do for now.

