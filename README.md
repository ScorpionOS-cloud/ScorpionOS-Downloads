# Scorpion OS Temalar

Bu depo, Fedora tabanlı Scorpion OS için özel olarak tasarlanmış tema, simge setleri ve KDE yapılandırma dosyalarını içerir.

---

## 📦 Kurulum

1. Depoyu klonlayın:
   ```bash
   git clone https://github.com/ScorpionOS-cloud/ScorpionOS-Themes.git
   cd ScorpionOS-Themes
   ```

2. Ayar betiğini çalıştırın:
   ```bash
   ./apply-config.sh
   ```
   - `themes/` klasöründeki dosyalar `/usr/share/plasma/look-and-feel/` dizinine taşınır.
   - `icons/` klasöründeki dosyalar `/usr/share/icons/` dizinine taşınır.
   - `plasma-config/` klasöründeki dosyalar `~/.config/` dizinine kopyalanır.

3. KDE Plasma oturumunuzu yeniden başlatın:
   ```bash
   kquitapp5 plasmashell && kstart5 plasmashell
   ```

---

## 📂 Depo Yapısı

- `themes/`: Plasma temaları.
- `icons/`: Simge setleri.
- `plasma-config/`: KDE yapılandırma dosyaları.
- `apply-config.sh`: Temaları ve ayarları taşıyan betik.
```
