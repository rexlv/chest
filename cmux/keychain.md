1. 在.bashrc中增加:

``` bash
ssh-add $HOME/.ssh/private_key
eval `keychain --eval --agents ssh --inherit any $HOME/.ssh/private_key`
```

2. 在$HOME/.ssh/hosts中增加

```
Host ${FORTRESS_MACHINE_HOST}
ForwardAgent yes
ControlPath ~/.fortress/lvchao1
ControlMaster auto
ControlPersist 7200h

```
