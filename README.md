# Frameworks Portage repository

## Initial install
```
root # emerge eselect-repository
root # eselect repository add framework git https://github.com/Sumandora/portage-framework.git
root # emaint sync -r framework
root # emerge games-cheat/FrameworkCSGO
```

## Updating
You can use `emerge @live-rebuild` to rebuild all live ebuilds or `emerge games-cheat/FrameworkCSGO` to rebuild Framework.  
Consider using [smart-live-rebuild](https://github.com/projg2/smart-live-rebuild) in order to get more automated updating.

## Injector
Use the injector from the main repository ([click here](https://github.com/Sumandora/FrameworkCSGO/blob/master/Load.sh)).  
You will need to modify the path from `Build/libFrameworkCSGO.so` to `/usr/lib64/libFrameworkCSGO.so`.
