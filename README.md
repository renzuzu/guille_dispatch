# guille_dispatch

**Contact me:**
https://discord.gg/eBpmkW6e5j



# How to install
---
  - Download and extract the zip.
  - Put the script in the resources carpet from your server.
  - Add into server.cfg:  `ensure guille_dispatch`
   
  
# Configuration
---

To translate the script just edit the strings from client, index.html and js.

**To add the rob trigger just add this where the rob is started (client-side):**

```
local pedcoords = GetEntityCoords(PlayerPedId())
local id = GetPlayerServerId(PlayerId())
TriggerServerEvent("guille_dispatch:sendRobaAlert", "247", pedcoords, id)
                                                the rob name
```

By default the photos are taken from a website, but if you want to do the photos localy just do this:

`in fxmanifest.lua`

```
Uncomment the line 27, removing the double -- where ui/vehicles/*.webp
```

`go to app.js and replace the line 45 to this`
``` 
const htmlString = `<img class="vehicle" id="vehicle" src="vehicles/${model}.webp" alt="${model}"></img>`
```
# License
---
[![N|Solid](https://i.creativecommons.org/l/by-nc/4.0/88x31.png)](https://creativecommons.org/)




