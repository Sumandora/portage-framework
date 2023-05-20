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
The injector will be installed as `FrameworkCSGO`.  
You likely have to run it with root permissions unless you reconfigured your setup in that regard.
