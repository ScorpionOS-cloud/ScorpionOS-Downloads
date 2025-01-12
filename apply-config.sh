#!/bin/bash

# Renkli çıktı için
GREEN="\033[1;32m"
BLUE="\033[1;34m"
RED="\033[1;31m"
RESET="\033[0m"

# Yeni işletim sistemi adı
os_name="Scorpion OS"

# Başlangıç mesajı
echo -e "${BLUE}Scorpion OS Kurulum Betiği Çalıştırılıyor...${RESET}"

# Kullanıcı onayı
read -p "Değişiklikleri uygulamak istediğinizden emin misiniz? (e/h): " confirm
if [[ "$confirm" != "e" && "$confirm" != "E" ]]; then
    echo -e "${RED}İşlem iptal edildi.${RESET}"
    exit 1
fi

# 1. /etc/os-release Güncelleme
echo -e "${BLUE}/etc/os-release dosyası güncelleniyor...${RESET}"
if sudo sed -i "s/^NAME=.*/NAME=\"$os_name\"/" /etc/os-release && \
   sudo sed -i "s/^PRETTY_NAME=.*/PRETTY_NAME=\"$os_name\"/" /etc/os-release; then
    echo -e "${GREEN}/etc/os-release başarıyla güncellendi.${RESET}"
else
    echo -e "${RED}/etc/os-release güncellenirken bir hata oluştu.${RESET}"
    exit 1
fi

# 2. /usr/lib/os-release Güncelleme
if [ -f /usr/lib/os-release ]; then
    echo -e "${BLUE}/usr/lib/os-release dosyası güncelleniyor...${RESET}"
    sudo sed -i "s/^NAME=.*/NAME=\"$os_name\"/" /usr/lib/os-release
    sudo sed -i "s/^PRETTY_NAME=.*/PRETTY_NAME=\"$os_name\"/" /usr/lib/os-release
    echo -e "${GREEN}/usr/lib/os-release başarıyla güncellendi.${RESET}"
fi

# 3. GRUB Güncelleme
echo -e "${BLUE}GRUB yapılandırması güncelleniyor...${RESET}"
if sudo sed -i "s/^GRUB_DISTRIBUTOR=.*/GRUB_DISTRIBUTOR=\"$os_name\"/" /etc/default/grub; then
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
    echo -e "${GREEN}GRUB menüsü başarıyla \"$os_name\" olarak güncellendi.${RESET}"
else
    echo -e "${RED}GRUB yapılandırması güncellenirken bir hata oluştu.${RESET}"
    exit 1
fi

# 4. Temaları Uygulama
echo -e "${BLUE}Temalar kontrol ediliyor...${RESET}"
if [ -d "themes" ]; then
    echo -e "${BLUE}Temalar kopyalanıyor...${RESET}"
    sudo cp -r themes/* /usr/share/plasma/look-and-feel/
    echo -e "${GREEN}Temalar başarıyla uygulandı.${RESET}"
else
    echo -e "${RED}themes/ klasörü bulunamadı. Lütfen kontrol edin.${RESET}"
fi

# 5. Simge Setlerini Uygulama
echo -e "${BLUE}Simge setleri kontrol ediliyor...${RESET}"
if [ -d "icons" ]; then
    echo -e "${BLUE}Simge setleri kopyalanıyor...${RESET}"
    sudo cp -r icons/* /usr/share/icons/
    echo -e "${GREEN}Simge setleri başarıyla uygulandı.${RESET}"
else
    echo -e "${RED}icons/ klasörü bulunamadı. Lütfen kontrol edin.${RESET}"
fi

# 6. KDE Yapılandırma Dosyalarını Uygulama
echo -e "${BLUE}KDE yapılandırma dosyaları kontrol ediliyor...${RESET}"
if [ -d "plasma-config" ]; then
    echo -e "${BLUE}KDE yapılandırma dosyaları kopyalanıyor...${RESET}"
    mkdir -p ~/.config/
    cp -r plasma-config/* ~/.config/
    echo -e "${GREEN}KDE yapılandırma dosyaları başarıyla uygulandı.${RESET}"
else
    echo -e "${RED}plasma-config/ klasörü bulunamadı. Lütfen kontrol edin.${RESET}"
fi

# Başarı Mesajı
echo -e "${GREEN}Scorpion OS başarıyla ayarlandı ve temalar uygulandı!${RESET}"
