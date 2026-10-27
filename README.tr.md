# Nashi

[English](README.md) · [Türkçe özellikler ve kısayollar](https://orkunisitmak.github.io/nashi-app/tr/) · [Upstream sürümler](https://github.com/orkunisitmak/nashi-app/releases/latest)

Nashi, [Tangerine](https://tangerineformac.com/) uygulamasının sürükle ve çark etkileşiminden ilham alan bağımsız, açık kaynaklı bir dosya dönüştürme/düzenleme uygulamasıdır. Web’den medya indirme, QR okuma, geliştirilmiş crop/annotate araçları, klavyeyle medya düzenleme ve canlı ilerleme ekler. Tangerine veya LEAP STUDIO ile bağlantılı değildir; referans uygulamanın binary dosyaları veya görselleri dağıtılmaz.

**Bu fork yalnızca macOS’u destekler ve uygulama güncelleyicisi içermez.** Yeni sürümler elle kurulur. Harici araç indirme/kurulumu korunur. Aşağıdaki upstream site ve sürüm linkleri bu fork’un değil, orijinal projenin çıktılarıdır.

[Etkileşimli web demosunu dene](https://orkunisitmak.github.io/nashi-app/tr/#playground): örnek dosyaları sürükle, wheel ve kısayolları kullan, 27 aracı keşfet. Desteklenen görsel/PDF/ses çıktıları gerçektir; masaüstüne özel işlemler önizleme olarak işaretlenir.

## Nashi’yi iş başında gör

[![Nashi gerçek ekran kaydı: Finder sürükleme, wheel, dönüştürme, crop ve video trim](docs/assets/showcase/nashi-demo.gif?v=50e9219b2083)](https://orkunisitmak.github.io/nashi-app/tr/#demo)

**[95 saniyelik ekran kaydını izle](https://orkunisitmak.github.io/nashi-app/tr/#demo)** · [MP4 aç / indir](https://orkunisitmak.github.io/nashi-app/assets/showcase/nashi-demo.mp4?v=50e9219b2083)

macOS 0.7.3 ile çekilmiş gerçek kullanım ekran kaydı: Finder’dan sürükleme, wheel’den JPG’ye dönüştürme, görsel kırpma ve In/Out tutamaçlarıyla video trim. Beklemeler ve uzun önizlemeler kısaltıldı; kalan hareketler normal hızda oynar. Video oynatıcıda Türkçe ve İngilizce altyazı bulunur.

| macOS · Ana ekran | macOS · Görsel kırp |
| :---: | :---: |
| [![Nashi Mac ana ekranı](docs/assets/showcase/mac-home.png)](docs/assets/showcase/mac-home.png) | [![Kare seçim ve oran kontrolleriyle Nashi kırpma editörü](docs/assets/showcase/mac-crop.png)](docs/assets/showcase/mac-crop.png) |
| **macOS · Video kırp** | **macOS · Çark** |
| [![In/Out tutamaçları ve seçilen aralıkla Nashi video trim editörü](docs/assets/showcase/mac-trim.png)](docs/assets/showcase/mac-trim.png) | [![Nashi dönüştürme çarkı](docs/assets/showcase/mac-wheel.png)](docs/assets/showcase/mac-wheel.png) |

Demo dosyaları yalnızca Nashi görsellerini içerir; kişisel dosya veya hesap bilgisi gösterilmez.

## İndir ve kullan

Bu fork’u [macOS build adımlarıyla](README.md#build) derle, ardından `build/Nashi.app` dosyasını Uygulamalar klasörüne taşı. Apple Silicon ve macOS 13+ gerekir. Katalog 27 araç, 45 girdi formatı ve 275 dönüşüm yolu içerir.

[Upstream macOS sürümleri](https://github.com/orkunisitmak/nashi-app/releases/latest) bu fork’un değişikliklerini içermez.

İlk açılışta **Kurulumu tamamla → Eksik araçları indir** akışı Medya ve Office araçlarını sırayla kurar. Bilgisayarında bulunan araçlar yeniden indirilmez; iptal veya hata sonrasında yalnızca eksik gruplarla devam edilir. **Araçlar hazır** durumu iki grup da kullanılabilir olduğunda gösterilir. İndirmeler doğrudan upstream’den gelir; hash’leri kurulumdan önce doğrulanır. Temel yerel görsel/PDF işlemleri hemen çalışır. [Sürümler, hash’ler ve lisanslar](docs/dependencies.md).

Kaynak derlemeleri varsayılan olarak ad-hoc imzalıdır ve Apple notarization içermez. macOS ilk açılışta onay isteyebilir. Nashi sistem güvenlik ayarlarını kapatmaz.

## Kısayollar

macOS’ta Finder’da sürüklerken **Shift** dönüşüm, **Command** araçlar, **Control** dosya işlemleri çarkını açar. **Control–Shift–D** kopyalanmış public linki indirir. Sürükleme tuşları özelleştirilebilir.

Desteklenen medya editörlerinde **Space** oynat/duraklat, **sağ/sol ok** bir saniye ilerle/geri git, **I/O** aralık başlangıcı/sonu. Crop’ta sürükleyerek seç, **Shift** ile oranı kilitle, **Enter** ile kaydet. [Tam kısayol rehberi](https://orkunisitmak.github.io/nashi-app/tr/#shortcuts).

Dönüştürme ve düzenleme yerelde çalışır. Web indirmeleri seçtiğin siteye bağlanır. Analytics, bulut hesabı veya tarayıcı çerezi aktarma yok. Bu fork uygulama güncellemesi aramaz, indirmez veya kurmaz. İşler tamamlandıktan sonra yeni sürümü elle kur. Harici araç kurulumu hash’i doğrulanmış araçları doğrudan upstream’den indirmeye devam eder.

Kaynak kod [MIT](LICENSE) lisanslıdır; üçüncü taraf bileşenlerin kendi lisansları geçerlidir. [macOS build adımları](README.md#build).
