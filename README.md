# Scorpion OS Temalar

**Scorpion OS Temalar** deposuna hoş geldiniz! Bu depo, Fedora tabanlı Scorpion OS için özel olarak tasarlanmış tema, simge setleri ve KDE yapılandırma dosyalarını içerir.

---

## 📦 Kurulum

Scorpion OS temalarını ve ayarlarını uygulamak için aşağıdaki adımları takip edin:

1. Bu depoyu klonlayın:
   ```bash
   git clone https://github.com/ScorpionOS-cloud/ScorpionOS-Themes.git
   cd ScorpionOS-Themes
   ```

2. Ayar betiğini çalıştırarak temaları ve ayarları uygulayın:
   ```bash
   ./apply-config.sh
   ```

   ### Betik Neler Yapar?
   - İşletim sistemi adını "Scorpion OS" olarak değiştirir.
   - `/etc/os-release`, `/usr/lib/os-release` ve GRUB menüsünde gerekli düzenlemeleri yapar.
   - `themes` klasöründeki dosyaları `/usr/share/plasma/look-and-feel/` dizinine taşır.
   - `icons` klasöründeki dosyaları `/usr/share/icons/` dizinine taşır.
   - `plasma-config` klasöründeki KDE yapılandırma dosyalarını `~/.config/` dizinine taşır.

3. Betik başarıyla tamamlandığında Scorpion OS için temalar ve ayarlar etkinleşmiş olacaktır.

---

## 📁 Dosya Yapısı

```
ScorpionOS-Themes/
├── themes/          # KDE temaları
├── icons/           # Simge setleri
├── plasma-config/   # KDE yapılandırma dosyaları
├── apply-config.sh  # Betik dosyası
└── README.md        # Rehber dosyası
```

---

## 💡 Notlar
- Betiği çalıştırmadan önce gerekli izinleri vermeyi unutmayın:
  ```bash
  chmod +x apply-config.sh
  ```
- İşlemlerin sorunsuz çalışması için sudo yetkilerine sahip olmanız gerekir.
```

---
