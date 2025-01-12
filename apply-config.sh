#!/bin/bash

# Scorpion OS Ayar Uygulama Betiği

echo "Scorpion OS tema ve ayarları uygulanıyor..."

# Gerekli dizinlerin kontrolü
if [ ! -d "themes" ] || [ ! -d "icons" ] || [ ! -d "plasma-config" ]; then
    echo "Hata: Gerekli dizinler (themes, icons, plasma-config) eksik!"
    exit 1
fi

# Temaları kopyala
echo "Temalar kopyalanıyor..."
sudo cp -r themes/* /usr/share/plasma/look-and-feel/

# Simgeleri kopyala
echo "Simgeler kopyalanıyor..."
sudo cp -r icons/* /usr/share/icons/

# KDE ayarlarını kopyala
echo "KDE ayarları kopyalanıyor..."
cp -r plasma-config/* ~/.config/

# İşlem tamamlandı
echo "Scorpion OS tema ve ayarları başarıyla uygulandı!"
echo "Değişikliklerin etkili olması için KDE Plasma oturumunuzu yeniden başlatın."
