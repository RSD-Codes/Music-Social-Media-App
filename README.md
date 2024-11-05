# Müzik Sosyal Medya Uygulaması Veri Tabanı Sistemi
## Katılımcılar
- AKİF KARACA | 220260608
- SEYİT İLHAM FIRTINA | 220260140
- HALİL İBRAHİM TURAN | 220260044

Projemiz; kullanıcıların müzik, playlist ve albüm paylaşımı yapabildiği müzik odaklı bir sosyal medya platformu oluşturmayı hedeflemektedir. Kullanıcılar burada kendi profillerini oluşturabilecek, diğer kullanıcıları takip edebilecek, albüm ve şarkı paylaşımlarında bulunabileceklerdir. Bu platform, müzikseverlerin bir araya gelip müzik zevklerini paylaşmalarını, yeni müzikler keşfetmelerini, şarkılar ve albümler hakkında yorum yapmalarını sağlarken, aynı zamanda etkileşimli bir topluluk oluşturmayı amaçlıyoruz.

Platformumuzda, kullanıcılar paylaşımları "Beğeni" ederek etkileşim sağlayabilecek ve diğer kullanıcıların şarkı veya albümlerine yorum bırakabileceklerdir. Ayrıca, premium abonelik sistemi ile kullanıcılar bazı özel özelliklere erişebilecek ve çeşitli ödeme yöntemleri ile aboneliklerini yenileyebileceklerdir. Her kullanıcının ödeme geçmişi, faturaları ve abonelik durumları sistemde yönetilecektir.

Bu projede, kullanıcıların birbirlerini takip edebileceği ve müzik tercihlerini paylaşarak daha geniş bir müzik kütüphanesine ulaşabileceği, tüm dünyadan müzikseverlerin buluştuğu bir dijital ortam oluşturulması hedeflenmektedir.

# Projenin E-R Diyagramı
![Başlıksız Diyagram (2)](https://github.com/user-attachments/assets/4c9faeb4-1479-4ae4-8e51-2fa39a2c64bb)

---

# Tablolar ve Varlık - Nitelik İlişkisi
### 1. Kullanıcı (User)
| Özellik Adı      | Açıklama                          |
|------------------|-----------------------------------|
| K_ID             | Kullanıcı ID (birincil anahtar)  |
| K_AD             | Kullanıcının adı                 |
| K_Email          | Kullanıcının e-posta adresi      |
| K_Şifre          | Kullanıcının şifresi             |
| K_Bio            | Kullanıcının biyografisi         |
| DogumTarihi      | Kullanıcının doğum tarihi        |
| Yasi             | Kullanıcının yaşı                |
| K_Resmi          | Kullanıcının profil resmi        |


### 2. Bildirimler (Notifications)
| Özellik Adı      | Açıklama                          |
|------------------|-----------------------------------|
| B_ID             | Bildirim ID (birincil anahtar)   |

---

### 3. Mesaj (Messages)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| M_ID               | Mesaj ID (birincil anahtar)                 |
| M_İçerik           | Mesajın içeriği                              |
| GonderenID         | Mesajı gönderen kullanıcının ID'si          |
| GönderilmeTarihi   | Mesajın gönderildiği tarih ve saat          |
| AliciID            | Mesajı alan kullanıcının ID'si              |

---

### 4. Takipçi (Followers)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| TakipID            | Takip ID (birincil anahtar)                 |
| TakipciID          | Takip eden kullanıcının ID'si               |
| TakipEdilenID      | Takip edilen kullanıcının ID'si             |
| TakipTarihi        | Takip ilişkisinin kurulduğu tarih           |

---

### 5. Sanatçı (Artist)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| S_ID               | Sanatçı ID (birincil anahtar)               |
| AlbumSayısı        | Sanatçının albüm sayısı                     |
| Şarkı Sayısı       | Sanatçının şarkı sayısı                     |

---

### 6. Paylaşım (Post)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| Post_ID            | Paylaşım ID (birincil anahtar)              |
| P_Url              | Paylaşımın bağlantısı veya medyası          |
| PaylasimTarihi     | Paylaşımın yapıldığı tarih ve saat          |
| K_ID               | Paylaşımı yapan kullanıcının ID'si          |
| Icerik             | Paylaşımın içeriği                          |

---

### 7. Beğeni (Likes)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| Begeni_ID          | Beğeni ID (birincil anahtar)                |
| K_ID               | Beğeniyi yapan kullanıcının ID'si           |
| Y_ID               | Beğenilen paylaşımın ID'si                  |
| BegeniTarihi       | Beğeni işleminin yapıldığı tarih ve saat    |

---

### 8. Yorum (Comments)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| Y_ID               | Yorum ID (birincil anahtar)                 |
| K_ID               | Yorumu yapan kullanıcının ID'si             |
| Y_Icerik           | Yorumun metni                               |
| YorumTarihi        | Yorumun yapıldığı tarih ve saat             |
| Post_ID            | Yorumun yapıldığı paylaşımın ID'si          |

---

### 9. Müzik (Music)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| M_ID               | Müzik ID (birincil anahtar)                 |
| CikisTarihi        | Müziğin yayınlandığı tarih                  |
| M_Turu             | Müziğin türü (ör. Pop, Rock)                |
| M_Suresi           | Müziğin süresi (saniye cinsinden)           |
| S_ID               | Müziğin ait olduğu sanatçının ID'si         |

---

### 10. Çalma Listesi (Playlist)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| PL_ID              | Playlist ID (birincil anahtar)              |
| PL_ADI             | Playlist'in adı                             |
| Aciklama           | Playlist'in açıklaması                      |
| OlusTarihi         | Playlist'in oluşturulduğu tarih             |
| MuzikSayisi        | Playlist'teki müzik sayısı                  |
| OlusturanKullanici | Playlist'i oluşturan kullanıcının ID'si     |

---

### 11. Albüm (Album)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| A_ID               | Albüm ID (birincil anahtar)                 |
| A_Adi              | Albümün adı                                 |
| S_ID               | Albümün ait olduğu sanatçının ID'si         |
| Baslik             | Albümün başlığı veya teması                 |
| YayinTarihi        | Albümün yayınlandığı tarih                  |

---

### 12. Ödemeler (Payments)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| Ö_ID               | Ödeme ID (birincil anahtar)                 |
| Ö_Tarihi           | Ödemenin yapıldığı tarih                    |
| Ö_Miktarı          | Ödemenin miktarı                            |
| A_ID               | İlgili abonelik ID'si                       |
| Ö_Yöntemi          | Ödeme yöntemi (kredi kartı, banka transferi vb.) |

---

### 13. Abonelik (Subscription)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| A_ID               | Abonelik ID (birincil anahtar)              |
| K_ID               | Aboneliğin ait olduğu kullanıcının ID'si    |
| Başlangıç Tarihi   | Aboneliğin başlangıç tarihi                 |
| Durum              | Abonelik durumu (aktif/pasif)               |
| Bitiş Tarihi       | Aboneliğin bitiş tarihi                     |

---

### 14. Faturalar (Invoices)
| Özellik Adı        | Açıklama                                     |
|--------------------|----------------------------------------------|
| F_ID               | Fatura ID (birincil anahtar)                |
| K_ID               | Faturanın ilişkili olduğu kullanıcının ID'si|
| Tutar              | Faturanın toplam tutarı                     |
| F_Durum            | Faturanın durumu (ödenmiş/ödenmemiş)        |
| Son Ödeme Tarihi   | Faturanın son ödeme tarihi                  |
| Fatura Tarihi      | Faturanın oluşturulma tarihi                |

---

## Varlık-İlişki tablosu:
| Varlık 1      | Varlık 2      | İlişki Türü          |
|---------------|---------------|----------------------|
| Kullanıcı     | Takipçi       | Sahiptir (1, N)     |
| Kullanıcı     | Mesaj         | Sahiptir (1, N)     |
| Kullanıcı     | Bildirim      | Sahiptir (1, N)     |
| Kullanıcı     | Abonelik      | Sahiptir (1, 1)     |
| Kullanıcı     | Fatura        | Ait (1, N)          |
| Kullanıcı     | Sanatçı       | Bir (1, 1)          |
| Kullanıcı     | Post          | Paylaşır (1, N)     |
| Kullanıcı     | Playlist      | Oluşturur (1, N)    |
| Kullanıcı     | Kullanıcı     | Takip Eder (1, N)   |
| Müzik         | Playlist      | Bulunur (M, N)      |
| Müzik         | Albüm         | Bulunur (M, N)      |
| Sanatçı       | Müzik         | Yayınlar (1, N)     |
| Post          | Müzik         | İçerik (1, 1)       |
| Post          | Albüm         | İçerik (1, 1)       |
| Post          | Playlist      | İçerik (1, 1)       |
| Post          | Beğeni        | Atılmış (1, M)      |
| Post          | Yorum         | Yapılmış (1, N)     |
