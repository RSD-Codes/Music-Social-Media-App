CREATE DATABASE muzikuygulamasi;
-- Kullanıcı Tablosu ve İlgili Tablolar
-- Kullanıcı Tablosu
CREATE TABLE Kullanıcı (
    K_ID INT PRIMARY KEY IDENTITY(1,1),
    K_AD NVARCHAR(100) NOT NULL,
    K_Email NVARCHAR(100) UNIQUE NOT NULL,
    K_Şifre NVARCHAR(100) NOT NULL,
    K_Bio NVARCHAR(MAX),
    DogumTarihi DATE NOT NULL,
    K_Resmi NVARCHAR(MAX)
);

-- Kullanıcı Yaş Tablosu
CREATE TABLE Kullanıcı_Yaş (
    K_ID INT PRIMARY KEY,
    Yasi INT NOT NULL,
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID)
);

-- Bildirimler Tablosu
CREATE TABLE Bildirimler (
    B_ID INT PRIMARY KEY NOT NULL,
    K_ID INT NOT NULL,
    B_Metni NVARCHAR(MAX),
    Okunma BIT NOT NULL,
    OluşTarihi DATETIME NOT NULL,
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID)
);

-- Mesaj Tablosu
CREATE TABLE Mesaj (
    M_ID INT PRIMARY KEY,
    M_İçerik NVARCHAR(MAX),
    GonderenID INT NOT NULL,
    AliciID INT NOT NULL,
    GönderilmeTarihi DATETIME NOT NULL,
    FOREIGN KEY (GonderenID) REFERENCES Kullanıcı(K_ID),
    FOREIGN KEY (AliciID) REFERENCES Kullanıcı(K_ID)
);

-- Takipçi Tablosu
CREATE TABLE Takipçi (
    TakipID INT PRIMARY KEY,
    TakipciID INT NOT NULL,
    TakipEdilenID INT NOT NULL,
    TakipTarihi DATETIME NOT NULL,
    FOREIGN KEY (TakipciID) REFERENCES Kullanıcı(K_ID),
    FOREIGN KEY (TakipEdilenID) REFERENCES Kullanıcı(K_ID)
);

-- Sanatçı Tablosu
CREATE TABLE Sanatçı (
    S_ID INT PRIMARY KEY,
    AlbumSayısı INT NOT NULL,
    ŞarkıSayısı INT NOT NULL,
    K_ID INT NOT NULL,
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID)
);

-- Paylaşım Tablosu
CREATE TABLE Paylaşım (
    Post_ID INT PRIMARY KEY,
    P_Url NVARCHAR(MAX),
    PaylasimTarihi DATETIME NOT NULL,
    K_ID INT NOT NULL,
    Icerik NVARCHAR(MAX),
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID)
);

-- Beğeni Tablosu
CREATE TABLE Beğeni (
    Begeni_ID INT PRIMARY KEY,
    K_ID INT NOT NULL,
    Post_ID INT NOT NULL,
    BegeniTarihi DATETIME NOT NULL,
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID),
    FOREIGN KEY (Post_ID) REFERENCES Paylaşım(Post_ID)
);
-- Yorum Tablosu
CREATE TABLE Yorum (
    Y_ID INT PRIMARY KEY,
    K_ID INT NOT NULL,
    Y_Icerik NVARCHAR(MAX),
    YorumTarihi DATETIME NOT NULL,
    Post_ID INT NOT NULL,
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID),
    FOREIGN KEY (Post_ID) REFERENCES Paylaşım(Post_ID)
);

-- Müzik Tablosu
CREATE TABLE Müzik (
    M_ID INT PRIMARY KEY,
	Post_ID INT NOT NULL,
    CikisTarihi DATE NOT NULL,
    M_Turu NVARCHAR(50),
    M_Suresi INT NOT NULL,
    S_ID INT NOT NULL,
    FOREIGN KEY (S_ID) REFERENCES Sanatçı(S_ID),
	FOREIGN KEY (Post_ID) REFERENCES Paylaşım(Post_ID),
);

-- Çalma Listesi Tablosu
CREATE TABLE Çalma_Listesi (
    PL_ID INT PRIMARY KEY,
	Post_ID INT NOT NULL,
    PL_ADI NVARCHAR(100) NOT NULL,
    Aciklama NVARCHAR(MAX),
    OlusTarihi DATETIME NOT NULL,
    OlusturanKullanici INT NOT NULL,
    FOREIGN KEY (OlusturanKullanici) REFERENCES Kullanıcı(K_ID),
	FOREIGN KEY (Post_ID) REFERENCES Paylaşım(Post_ID),
);

-- Playlist_Muzik Ara Tablosu
CREATE TABLE Playlist_Muzik (
    PL_ID INT NOT NULL,
    M_ID INT NOT NULL,
    PRIMARY KEY (PL_ID, M_ID),
    FOREIGN KEY (PL_ID) REFERENCES Çalma_Listesi(PL_ID),
    FOREIGN KEY (M_ID) REFERENCES Müzik(M_ID)
);

-- Albüm Tablosu
CREATE TABLE Albüm (
    A_ID INT PRIMARY KEY,
	Post_ID INT NOT NULL,
    A_Adi NVARCHAR(100) NOT NULL,
    S_ID INT NOT NULL,
    Baslik NVARCHAR(MAX),
    YayinTarihi DATE NOT NULL,
    FOREIGN KEY (S_ID) REFERENCES Sanatçı(S_ID),
	FOREIGN KEY (Post_ID) REFERENCES Paylaşım(Post_ID)
);

-- Album_Muzik Ara Tablosu
CREATE TABLE Album_Muzik (
    A_ID INT NOT NULL,
    M_ID INT NOT NULL,
    PRIMARY KEY (A_ID, M_ID),
    FOREIGN KEY (A_ID) REFERENCES Albüm(A_ID),
    FOREIGN KEY (M_ID) REFERENCES Müzik(M_ID)
);

-- Abonelik Tablosu
CREATE TABLE Abonelik (
    AB_ID INT PRIMARY KEY,
    K_ID INT NOT NULL,
    BaşlangıçTarihi DATE NOT NULL,
    Durum NVARCHAR(50) NOT NULL,
    BitişTarihi DATE,
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID)
);

-- Ödemeler Tablosu
CREATE TABLE Ödemeler (
    Ö_ID INT PRIMARY KEY,
    Ö_Tarihi DATETIME NOT NULL,
    Ö_Miktarı DECIMAL(10, 2) NOT NULL,
    AB_ID INT NOT NULL,
    Ö_Yöntemi NVARCHAR(50) NOT NULL,
    FOREIGN KEY (AB_ID) REFERENCES Abonelik(AB_ID)
);


-- Faturalar Tablosu
CREATE TABLE Faturalar (
    F_ID INT PRIMARY KEY,
    K_ID INT NOT NULL,
    Tutar DECIMAL(10, 2) NOT NULL,
    F_Durum NVARCHAR(50) NOT NULL,
    SonÖdemeTarihi DATE NOT NULL,
    FaturaTarihi DATE NOT NULL,
    FOREIGN KEY (K_ID) REFERENCES Kullanıcı(K_ID)
);
INSERT INTO Kullanıcı (K_AD, K_Email, K_Şifre, K_Bio, DogumTarihi, K_Resmi)
VALUES 
('Halil İbrahim Turan', 'halilturan2023@gmail.com', 'Halil123', 'Müzik sever.', '2003-09-03', NULL),
('Seyit İlham Fırtına', 'seyit1953@gmail.com', 'Seyit12345', 'Sanatçı biyografisi yazarı.', '2002-08-13', NULL),
('Akif Karaca', 'akifkaraca1989@gmail.com', 'Akif2021', 'Pop müzik aşığı.', '2003-01-23', NULL),
('Mehmet Kaya', 'mehmet@gmail.com', 'Mehmet2021', 'Rock müzik aşığı.', '2001-03-22', NULL),
('Kerem Can', 'kerem@gmail.com', 'Kerem1234!', 'DJ ve prodüktör.', '1994-11-11', NULL),
('Fatma Er', 'fatma@gmail.com', 'Fatma2022!', 'Müzik bloggerı.', '2000-06-18', NULL),
('Hakan Uslu', 'hakan@gmail.com', 'Hakan!321', 'Jazz hayranı.', '1998-02-14', NULL),
('Elif Çelik', 'elif@gmail.com', 'Elif456!', 'Albüm koleksiyoncusu.', '1989-09-30', NULL),
('Yusuf Şahin', 'yusuf@gmail.com', 'Yusuf1987', 'Metal müzik hayranı.', '1987-12-25', NULL),
('Leyla Akın', 'leyla@gmail.com', 'Leyla789!', 'Müzik platformu tasarımcısı.', '1996-04-04', NULL);

INSERT INTO Bildirimler (B_ID, K_ID, B_Metni, Okunma, OluşTarihi)
VALUES
(1, 1, 'Yeni takipçiniz var!', 0, '2025-01-01'),
(2, 2, 'Paylaşımınız beğenildi.', 1, '2025-01-02'),
(3, 3, 'Yeni bir mesaj aldınız.', 0, '2025-01-03'),
(4, 4, 'Albümünüz beğenildi.', 1, '2025-01-04'),
(5, 5, 'Yeni bir yorum yapıldı.', 0, '2025-01-05'),
(6, 6, 'Çalma listenize müzik eklendi.', 1, '2025-01-06'),
(7, 7, 'Sanatçı takibiniz güncellendi.', 0, '2025-01-07'),
(8, 8, 'Takipçiniz bir paylaşım yaptı.', 1, '2025-01-08'),
(9, 9, 'Albümünüz popüler oluyor!', 0, '2025-01-09'),
(10, 10, 'Yeni bir takipçiniz var!', 1, '2025-01-10');
Select* From Bildirimler;
INSERT INTO Mesaj (M_ID, M_İçerik, GonderenID, AliciID, GönderilmeTarihi)
VALUES
(1, 'Haydaa bu albüm gerçekten iyiymiş.', 2, 1, '2025-01-01 10:00:00'),
(2, 'Teşekkürler!', 1, 2, '2025-01-01 10:05:00'),
(3, 'Yeni şarkılarınızı bekliyoruz.', 3, 5, '2025-01-02 12:00:00'),
(4, 'Pop müzik koleksiyonunuz 10 numara.', 4, 8, '2025-01-03 14:30:00'),
(5, 'Rap listesi önerisi var mı?', 7, 6, '2025-01-04 16:45:00'),
(6, 'Bu albüm gerçekten özel!', 5, 3, '2025-01-05 18:00:00'),
(7, 'Takip için teşekkürler.', 8, 7, '2025-01-06 20:15:00'),
(8, 'Yorumlarınızı bekliyoruz.', 9, 10, '2025-01-07 09:30:00'),
(9, 'Çalma listesi paylaşabilir misiniz?', 10, 4, '2025-01-08 11:45:00'),
(10, 'Elbette, hemen paylaşıyorum.', 4, 10, '2025-01-08 12:00:00');
Select* From Mesaj;
INSERT INTO Takipçi (TakipID, TakipciID, TakipEdilenID, TakipTarihi)
VALUES
(1, 1, 2, '2025-01-01'),
(2, 3, 1, '2025-01-02'),
(3, 4, 3, '2025-01-03'),
(4, 5, 4, '2025-01-04'),
(5, 6, 5, '2025-01-05'),
(6, 7, 6, '2025-01-06'),
(7, 8, 7, '2025-01-07'),
(8, 9, 8, '2025-01-08'),
(9, 10, 9, '2025-01-09'),
(10, 2, 10, '2025-01-10');
Select* From Takipçi Where TakipTarihi BETWEEN '2025-01-01' AND '2025-01-05';
INSERT INTO Paylaşım (Post_ID, P_Url, PaylasimTarihi, K_ID, Icerik)
VALUES
(1, 'https://musisocial.com/post1', '2025-01-01 09:00:00', 1, 'En sevdiğim şarkı.'),
(2, 'https://musisocial.com/post2', '2025-01-02 10:00:00', 2, 'Yeni albümüm yayında!'),
(3, 'https://musisocial.com/post3', '2025-01-03 11:00:00', 3, 'Çalma listem: Rap.'),
(4, 'https://musisocial.com/post4', '2025-01-04 12:00:00', 4, 'Pop müzik severlere önerim.'),
(5, 'https://musisocial.com/post5', '2025-01-05 13:00:00', 5, 'Yeni remiximi dinleyin!'),
(6, 'https://musisocial.com/post6', '2025-01-06 14:00:00', 6, 'Müzik bloggerından öneriler.'),
(7, 'https://musisocial.com/post7', '2025-01-07 15:00:00', 7, 'Rap gecesi.'),
(8, 'https://musisocial.com/post8', '2025-01-08 16:00:00', 8, 'Albüm koleksiyonum.'),
(9, 'https://musisocial.com/post9', '2025-01-09 17:00:00', 9, 'Metal müzikle bir gün.'),
(10, 'https://musisocial.com/post10', '2025-01-10 18:00:00', 10, 'Müzik platformu önerisi.');
Select* FROM Paylaşım;

INSERT INTO Sanatçı (S_ID, AlbumSayısı, ŞarkıSayısı, K_ID)
VALUES
(1, 5, 50, 1),  -- Ali Yılmaz
(2, 4, 40, 2),  -- Ayşe Demir
(3, 6, 60, 3),  -- Mehmet Kaya
(4, 3, 30, 4),  -- Zeynep Aydın
(5, 2, 20, 5),  -- Kerem Can
(6, 7, 70, 6),  -- Fatma Er
(7, 4, 45, 7),  -- Hakan Uslu
(8, 3, 35, 8),  -- Elif Çelik
(9, 5, 55, 9),  -- Yusuf Şahin
(10, 2, 25, 10); -- Leyla Akın

INSERT INTO Müzik (M_ID,Post_ID, CikisTarihi, M_Turu, M_Suresi, S_ID)
VALUES
(1,1, '2020-01-01', 'Pop', 210, 1),
(2,2, '2021-06-15', 'Rock', 180, 2),
(3,3, '2022-09-20', 'Rap', 240, 3),
(4,4, '2019-11-11', 'Pop', 200, 4),
(5,5, '2023-03-05', 'Electronic', 150, 5),
(6,6, '2020-12-31', 'Classical', 300, 6),
(7,7, '2022-08-22', 'Rap', 270, 7),
(8,8, '2021-10-01', 'Folk', 230, 8),
(9,9, '2020-05-10', 'Metal', 190, 9),
(10,10, '2023-01-15', 'Pop', 220, 10);
Select* From Müzik WHERE M_Turu='Pop';
INSERT INTO Kullanıcı_Yaş (K_ID, Yasi)
VALUES 
(1, 21), (2, 22), (3, 21), (4, 23), (5, 31),
(6, 25), (7, 33), (8, 27), (9, 36), (10, 29);
Select* From Kullanıcı;
INSERT INTO Abonelik (AB_ID, K_ID, BaşlangıçTarihi, Durum, BitişTarihi)
VALUES
(1, 1, '2024-01-01', 'Aktif', '2025-01-01'),
(2, 2, '2023-06-15', 'Pasif', '2024-06-15'),
(3, 3, '2023-09-20', 'Aktif', '2024-09-20'),
(4, 4, '2022-11-11', 'Aktif', '2023-11-11'),
(5, 5, '2023-03-05', 'Pasif', '2024-03-05'),
(6, 6, '2023-12-31', 'Aktif', '2024-12-31'),
(7, 7, '2022-08-22', 'Aktif', '2023-08-22'),
(8, 8, '2021-10-01', 'Pasif', '2022-10-01'),
(9, 9, '2022-05-10', 'Aktif', '2023-05-10'),
(10, 10, '2023-01-15', 'Aktif', '2024-01-15');
Select* From Abonelik;

INSERT INTO Faturalar (F_ID, K_ID, Tutar, F_Durum, SonÖdemeTarihi, FaturaTarihi)
VALUES
(1, 1, 49.99, 'Ödenmiş', '2025-01-01', '2024-12-31'),
(2, 2, 29.99, 'Ödenmemiş', '2025-01-02', '2024-12-31'),
(3, 3, 19.99, 'Ödenmiş', '2025-01-03', '2024-12-31'),
(4, 4, 39.99, 'Ödenmiş', '2025-01-04', '2024-12-31'),
(5, 5, 59.99, 'Ödenmemiş', '2025-01-05', '2024-12-31'),
(6, 6, 24.99, 'Ödenmiş', '2025-01-06', '2024-12-31'),
(7, 7, 34.99, 'Ödenmiş', '2025-01-07', '2024-12-31'),
(8, 8, 44.99, 'Ödenmemiş', '2025-01-08', '2024-12-31'),
(9, 9, 14.99, 'Ödenmiş', '2025-01-09', '2024-12-31'),
(10, 10, 54.99, 'Ödenmemiş', '2025-01-10', '2024-12-31');
Select*FROM Faturalar Where Tutar>35;

CREATE PROCEDURE YorumEkleme
    @Y_ID INT,  
    @K_ID INT,
    @Post_ID INT,
    @Y_Icerik NVARCHAR(MAX),
    @YorumTarihi DATETIME
AS
BEGIN
    INSERT INTO Yorum (Y_ID,K_ID, Post_ID, Y_Icerik, YorumTarihi)
    VALUES (@Y_ID,@K_ID, @Post_ID, @Y_Icerik, @YorumTarihi);
END;
EXEC YorumEkleme
    @Y_ID = 6,    
    @K_ID = 2, -- Yorumu yapan kullanıcının ID'si
    @Post_ID = 1, -- Yorum yapılan paylaşımın ID'si
    @Y_Icerik = 'Harika bir paylaşım!',
    @YorumTarihi = '2025-01-11';
Select*From Yorum Where Y_ID=6;

CREATE TRIGGER AbonelikDurumGüncelle
ON Abonelik
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM INSERTED WHERE BitişTarihi < GETDATE())
    BEGIN
        UPDATE Abonelik
        SET Durum = 'Pasif'
        WHERE AB_ID IN (SELECT AB_ID FROM INSERTED WHERE BitişTarihi < GETDATE());
    END;
END;
UPDATE Abonelik
SET BitişTarihi = '2025-01-01'
WHERE AB_ID = 3; -- Güncellenen abonelik ID'si
Select*From Abonelik WHERE AB_ID=3;

BEGIN TRANSACTION;
BEGIN TRY
    -- Kullanıcıyı ekle
    INSERT INTO Kullanıcı (K_AD, K_Email, K_Şifre, K_Bio, DogumTarihi, K_Resmi)
    VALUES ('Yusuf Soysal','istanbulbeyefendisi@gmail.com', 'şeyhmus123', 'Müzik sever', '1990-01-01', NULL);

    -- İşlemi onayla
    COMMIT TRANSACTION;
    PRINT 'Kullanıcı başarıyla eklendi.';
END TRY
BEGIN CATCH
    -- Hata durumunda işlemi geri al
    ROLLBACK TRANSACTION;

    -- Hata mesajını göster
    PRINT 'Bir hata oluştu. İşlem geri alındı.';
    THROW;
END CATCH;

Select*From Kullanıcı Where K_AD='Yusuf Soysal';

CREATE VIEW KullanıcıYorumDetayları AS
SELECT 
    Yorum.Y_ID AS YorumID,
    Kullanıcı.K_ID AS KullanıcıID,
    Kullanıcı.K_AD AS KullanıcıAdı,
    Yorum.Y_Icerik AS Yorumİçeriği,
    Paylaşım.Post_ID AS PaylaşımID,
    Paylaşım.Icerik AS Paylaşımİçeriği,
    Paylaşım.K_ID AS PaylaşımSahibiID,
    Sahibi.K_AD AS PaylaşımSahibiAdı,
    Yorum.YorumTarihi AS YorumTarihi
FROM 
    Yorum
INNER JOIN 
    Kullanıcı ON Yorum.K_ID = Kullanıcı.K_ID
INNER JOIN 
    Paylaşım ON Yorum.Post_ID = Paylaşım.Post_ID
INNER JOIN 
    Kullanıcı AS Sahibi ON Paylaşım.K_ID = Sahibi.K_ID;

	SELECT * FROM KullanıcıYorumDetayları;

    SELECT* FROM Sanatçı Where S_ID IN(1,2,3);

    Select K_AD,DogumTarihi FROM Kullanıcı ORDER BY DogumTarihi ASC;
-- Aşağıdaki Stored Procedure bir paylaşım silindiğinde, ilişkili veriler (yorumlar, beğeniler ve müzikler) otomatik olarak silinir. Böylece veri bütünlüğü korunur.
CREATE PROCEDURE SilPaylaşım
    @Post_ID INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Yorumları Sil
        DELETE FROM Yorum
        WHERE Post_ID = @Post_ID;

        -- Beğenileri Sil
        DELETE FROM Beğeni
        WHERE Post_ID = @Post_ID;

        -- Müzikleri Sil
        DELETE FROM Müzik
        WHERE Post_ID = @Post_ID;

        -- Paylaşımı Sil
        DELETE FROM Paylaşım
        WHERE Post_ID = @Post_ID;

        -- İşlemi Onayla
        COMMIT TRANSACTION;
        PRINT 'Paylaşım ve ilişkili veriler başarıyla silindi.';
    END TRY
    BEGIN CATCH
        -- Hata Durumunda İşlemi Geri Al
        ROLLBACK TRANSACTION;
        PRINT 'Hata oluştu. İşlem geri alındı.';
        THROW;
    END CATCH;
END;
EXEC SilPaylaşım @Post_ID = 1;

CREATE TRIGGER GüncellemeBildirimGönderme
ON Paylaşım
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- En büyük B_ID'yi bul ve yeni bir değer oluştur
    DECLARE @NextB_ID INT;
    SELECT @NextB_ID = ISNULL(MAX(B_ID), 0) + 1 FROM Bildirimler;

    -- Bildirim Ekle
    INSERT INTO Bildirimler (B_ID, K_ID, B_Metni, Okunma, OluşTarihi)
    SELECT 
        @NextB_ID + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), -- B_ID'yi artır
        K_ID, 
        'Paylaşımınız güncellenmiştir: ' + Icerik, 
        0, 
        GETDATE()
    FROM 
        INSERTED;

    PRINT 'Güncelleme bildirimi başarıyla gönderildi.';
END;
Select*From Paylaşım Where Post_ID=10;
-- Paylaşımı güncelle
UPDATE Paylaşım
SET Icerik = 'Platform önerisi olan var mı?', PaylasimTarihi = GETDATE()
WHERE Post_ID = 10;
Select*From Paylaşım Where Post_ID=10;
Select*From Bildirimler Where K_ID=10;

DROP trigger GüncellemeBildirimGönder;
