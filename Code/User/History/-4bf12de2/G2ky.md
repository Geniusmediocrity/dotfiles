# Transfering keys on another system on PC

1. Make dir .ssh
2. Copy there id_ed25519.pub and id_ed25519 and change their rights:
   - `sudo chmod 700 ~/.ssh` set rights to the dir .ssh
   - `sudo chmod 644 ~/.ssh/id_ed25519.pub` set rights to the public(open) key
   - `sudo chmod 600 ~/.ssh/id_ed25519` set rights to the priate(closed) key

3. After, un the same terminal i enter a command:

```shell
ssh-add
```

4. 
