---

### 🔹 **1. `pacman`**

```bash
pacman -Qqe
```

- `-Q` — query local database
- `-q` — quiet
- `-e` — explicitly installed

---

### 🔹 **2. `yay` (AUR)**

```bash
yay -Qm
```

- `-Qm` — local packages _not_ in the official repos → AUR-пакеты.

---

### 🔹 **3. `snap`**

```bash
snap list --installed | tail -n +2 | awk '{print $1}'
```

or recomended:

```bash
snap list --installed | tail -n +2 | awk '$1 !~ /^(core|snapd|gnome|gtk)/ {print $1}'
```

---

### 🔹 **4. `flatpak`**

```bash
flatpak list --app --system --columns=application
```
