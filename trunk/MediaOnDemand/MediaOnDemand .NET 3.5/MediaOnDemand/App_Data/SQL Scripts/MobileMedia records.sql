
SET IDENTITY_INSERT [dbo].[MobileMedia] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'The_Sopranos', N'.mov', N'video', 4314, '20110817 01:18:38.697', N'Y', N'', N'', N'', N'', N'../../images/posters/video.jpg', NULL, 0, N'The_Sopranos.mov' UNION ALL
SELECT N'01 Adonai', N'.mp3', N'audio', 4315, '20110817 01:18:38.713', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Adonai.mp3' UNION ALL
SELECT N'01 Agua Viva', N'.mp3', N'audio', 4316, '20110817 01:18:38.713', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Agua Viva.mp3' UNION ALL
SELECT N'01 Ahora es el Tiempo', N'.mp3', N'audio', 4317, '20110817 01:18:38.713', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Ahora es el Tiempo.mp3' UNION ALL
SELECT N'01 Al que es Digno', N'.mp3', N'audio', 4318, '20110817 01:18:38.713', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Al que es Digno.mp3' UNION ALL
SELECT N'01 Alabadle', N'.mp3', N'audio', 4319, '20110817 01:18:38.730', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Alabadle.mp3' UNION ALL
SELECT N'01 All Out', N'.mp3', N'audio', 4320, '20110817 01:18:38.730', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 All Out.mp3' UNION ALL
SELECT N'01 All The Right Moves', N'.mp3', N'audio', 4321, '20110817 01:18:38.730', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 All The Right Moves.mp3' UNION ALL
SELECT N'01 Alli Esta El', N'.mp3', N'audio', 4322, '20110817 01:18:38.730', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Alli Esta El.mp3' UNION ALL
SELECT N'01 Broken Heart', N'.mp3', N'audio', 4323, '20110817 01:18:38.743', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Broken Heart.mp3' UNION ALL
SELECT N'01 Cry Me A River', N'.mp3', N'audio', 4324, '20110817 01:18:38.743', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Cry Me A River.mp3' UNION ALL
SELECT N'01 Cuan Bello es el', N'.mp3', N'audio', 4325, '20110817 01:18:38.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Cuan Bello es el.mp3' UNION ALL
SELECT N'01 Dejame', N'.mp3', N'audio', 4326, '20110817 01:18:38.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Dejame.mp3' UNION ALL
SELECT N'01 El Aire De Tu Casa', N'.mp3', N'audio', 4327, '20110817 01:18:38.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 El Aire De Tu Casa.mp3' UNION ALL
SELECT N'01 El Amor Mio', N'.mp3', N'audio', 4328, '20110817 01:18:38.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 El Amor Mio.mp3' UNION ALL
SELECT N'01 El Motivo de Mi Cancion', N'.mp3', N'audio', 4329, '20110817 01:18:38.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 El Motivo de Mi Cancion.mp3' UNION ALL
SELECT N'01 En La Eternidad', N'.mp3', N'audio', 4330, '20110817 01:18:38.777', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 En La Eternidad.mp3' UNION ALL
SELECT N'01 Enciende una luz_', N'.mp3', N'audio', 4331, '20110817 01:18:38.777', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Enciende una luz_.mp3' UNION ALL
SELECT N'01 Escape', N'.mp3', N'audio', 4332, '20110817 01:18:38.777', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Escape.mp3' UNION ALL
SELECT N'01 Fiesta', N'.mp3', N'audio', 4333, '20110817 01:18:38.777', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Fiesta.mp3' UNION ALL
SELECT N'01 Goats On A Boat', N'.mp3', N'audio', 4334, '20110817 01:18:38.777', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Goats On A Boat.mp3' UNION ALL
SELECT N'01 Heme aqui', N'.mp3', N'audio', 4335, '20110817 01:18:38.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Heme aqui.mp3' UNION ALL
SELECT N'01 Here In Your Arms', N'.mp3', N'audio', 4336, '20110817 01:18:38.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Here In Your Arms.mp3' UNION ALL
SELECT N'01 Hossana', N'.mp3', N'audio', 4337, '20110817 01:18:38.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Hossana.mp3' UNION ALL
SELECT N'01 I Need You', N'.mp3', N'audio', 4338, '20110817 01:18:38.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 I Need You.mp3' UNION ALL
SELECT N'01 I''m A Winans Too!', N'.mp3', N'audio', 4339, '20110817 01:18:38.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 I''m A Winans Too!.mp3' UNION ALL
SELECT N'01 Intro', N'.mp3', N'audio', 4340, '20110817 01:18:38.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Intro.mp3' UNION ALL
SELECT N'01 Kalimba', N'.mp3', N'audio', 4341, '20110817 01:18:38.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Kalimba.mp3' UNION ALL
SELECT N'01 Let Go', N'.mp3', N'audio', 4342, '20110817 01:18:38.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Let Go.mp3' UNION ALL
SELECT N'01 Marcos Witt -Tu nombre oh Dios', N'.mp3', N'audio', 4343, '20110817 01:18:38.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Marcos Witt -Tu nombre oh Dios.mp3' UNION ALL
SELECT N'01 Marcos Witt', N'.mp3', N'audio', 4344, '20110817 01:18:38.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Marcos Witt.mp3' UNION ALL
SELECT N'01 Me Has Llamado a Conocerte', N'.mp3', N'audio', 4345, '20110817 01:18:38.823', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Me Has Llamado a Conocerte.mp3' UNION ALL
SELECT N'01 MUSICA CRISTIANA - Marcos Witt', N'.mp3', N'audio', 4346, '20110817 01:18:38.823', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 MUSICA CRISTIANA - Marcos Witt.mp3' UNION ALL
SELECT N'01 My Homey 1', N'.mp3', N'audio', 4347, '20110817 01:18:38.823', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 My Homey 1.mp3' UNION ALL
SELECT N'01 My Homey', N'.mp3', N'audio', 4348, '20110817 01:18:38.823', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 My Homey.mp3' UNION ALL
SELECT N'01 Narcotic', N'.mp3', N'audio', 4349, '20110817 01:18:38.840', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Narcotic.mp3' UNION ALL
SELECT N'01 Narración_ La Búsqueda', N'.mp3', N'audio', 4350, '20110817 01:18:38.840', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Narración_ La Búsqueda.mp3' UNION ALL
SELECT N'01 No Cambiaria', N'.mp3', N'audio', 4351, '20110817 01:18:38.840', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 No Cambiaria.mp3' UNION ALL
SELECT N'01 No Hay Dios Tan Grande Como Tú', N'.mp3', N'audio', 4352, '20110817 01:18:38.840', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 No Hay Dios Tan Grande Como Tú.mp3' UNION ALL
SELECT N'01 No Podría Vivir', N'.mp3', N'audio', 4353, '20110817 01:18:38.840', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 No Podría Vivir.mp3' UNION ALL
SELECT N'01 Oh! Gravity.', N'.mp3', N'audio', 4354, '20110817 01:18:38.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Oh! Gravity..mp3' UNION ALL
SELECT N'01 One Day (Feat. Akon)', N'.mp3', N'audio', 4355, '20110817 01:18:38.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 One Day (Feat. Akon).mp3' UNION ALL
SELECT N'01 Preparad El Camino', N'.mp3', N'audio', 4356, '20110817 01:18:38.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Preparad El Camino.mp3' UNION ALL
SELECT N'01 Procrastinating', N'.mp3', N'audio', 4357, '20110817 01:18:38.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Procrastinating.mp3' UNION ALL
SELECT N'01 Que Todos Los Peblos Te Alaben', N'.mp3', N'audio', 4358, '20110817 01:18:38.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Que Todos Los Peblos Te Alaben.mp3' UNION ALL
SELECT N'01 Quiero Levantar Mis Manos', N'.mp3', N'audio', 4359, '20110817 01:18:38.870', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Quiero Levantar Mis Manos.mp3' UNION ALL
SELECT N'01 Returning The Smile You Have Had', N'.mp3', N'audio', 4360, '20110817 01:18:38.870', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Returning The Smile You Have Had.mp3' UNION ALL
SELECT N'01 Sananos', N'.mp3', N'audio', 4361, '20110817 01:18:38.870', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Sananos.mp3' UNION ALL
SELECT N'01 She Makes Dirty Words Sound Prett', N'.mp3', N'audio', 4362, '20110817 01:18:38.870', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 She Makes Dirty Words Sound Prett.mp3' UNION ALL
SELECT N'01 Si Se Puede Decir', N'.mp3', N'audio', 4363, '20110817 01:18:38.870', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Si Se Puede Decir.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'01 Swimming In Miami', N'.mp3', N'audio', 4364, '20110817 01:18:38.887', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Swimming In Miami.mp3' UNION ALL
SELECT N'01 Te Amo', N'.mp3', N'audio', 4365, '20110817 01:18:38.887', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Te Amo.mp3' UNION ALL
SELECT N'01 This Is Your Life', N'.mp3', N'audio', 4366, '20110817 01:18:38.887', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 This Is Your Life.mp3' UNION ALL
SELECT N'01 Track 01', N'.mp3', N'audio', 4367, '20110817 01:18:38.887', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Track 01.mp3' UNION ALL
SELECT N'01 Tu Gracia Me Sostiene', N'.mp3', N'audio', 4368, '20110817 01:18:38.887', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Tu Gracia Me Sostiene.mp3' UNION ALL
SELECT N'01 Tu Nombre Oh Dios', N'.mp3', N'audio', 4369, '20110817 01:18:38.900', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Tu Nombre Oh Dios.mp3' UNION ALL
SELECT N'01 Unbreakable', N'.mp3', N'audio', 4370, '20110817 01:18:38.900', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Unbreakable.mp3' UNION ALL
SELECT N'01 Unánimes', N'.mp3', N'audio', 4371, '20110817 01:18:38.900', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Unánimes.mp3' UNION ALL
SELECT N'01 Ven te Necesito', N'.mp3', N'audio', 4372, '20110817 01:18:38.917', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Ven te Necesito.mp3' UNION ALL
SELECT N'01 Voice of Truth', N'.mp3', N'audio', 4373, '20110817 01:18:38.917', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 Voice of Truth.mp3' UNION ALL
SELECT N'01 What If', N'.mp3', N'audio', 4374, '20110817 01:18:38.917', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'01 What If.mp3' UNION ALL
SELECT N'02 (There''s Gotta Be) More To Life', N'.mp3', N'audio', 4375, '20110817 01:18:38.917', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 (There''s Gotta Be) More To Life.mp3' UNION ALL
SELECT N'02 ... Que Te Quiero', N'.mp3', N'audio', 4376, '20110817 01:18:38.917', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 ... Que Te Quiero.mp3' UNION ALL
SELECT N'02 A Boy Brushed Red...Living In', N'.mp3', N'audio', 4377, '20110817 01:18:38.933', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 A Boy Brushed Red...Living In.mp3' UNION ALL
SELECT N'02 Activate', N'.mp3', N'audio', 4378, '20110817 01:18:38.933', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Activate.mp3' UNION ALL
SELECT N'02 Alabadle!', N'.mp3', N'audio', 4379, '20110817 01:18:38.933', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Alabadle!.mp3' UNION ALL
SELECT N'02 Alegrense', N'.mp3', N'audio', 4380, '20110817 01:18:38.933', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Alegrense.mp3' UNION ALL
SELECT N'02 Algun Día', N'.mp3', N'audio', 4381, '20110817 01:18:38.947', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Algun Día.mp3' UNION ALL
SELECT N'02 All Around The World', N'.mp3', N'audio', 4382, '20110817 01:18:38.947', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 All Around The World.mp3' UNION ALL
SELECT N'02 All Of Me', N'.mp3', N'audio', 4383, '20110817 01:18:38.947', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 All Of Me.mp3' UNION ALL
SELECT N'02 Amaré al Señor mi Dios', N'.mp3', N'audio', 4384, '20110817 01:18:38.947', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Amaré al Señor mi Dios.mp3' UNION ALL
SELECT N'02 Anything Is Possible', N'.mp3', N'audio', 4385, '20110817 01:18:38.963', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Anything Is Possible.mp3' UNION ALL
SELECT N'02 Beautiful One', N'.mp3', N'audio', 4386, '20110817 01:18:38.963', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Beautiful One.mp3' UNION ALL
SELECT N'02 Breaking', N'.mp3', N'audio', 4387, '20110817 01:18:38.980', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Breaking.mp3' UNION ALL
SELECT N'02 Con Todo Mi Corazon', N'.mp3', N'audio', 4388, '20110817 01:18:38.980', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Con Todo Mi Corazon.mp3' UNION ALL
SELECT N'02 Creere', N'.mp3', N'audio', 4389, '20110817 01:18:38.980', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Creere.mp3' UNION ALL
SELECT N'02 Dame Dame', N'.mp3', N'audio', 4390, '20110817 01:18:38.980', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Dame Dame.mp3' UNION ALL
SELECT N'02 Day Late Friend', N'.mp3', N'audio', 4391, '20110817 01:18:38.993', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Day Late Friend.mp3' UNION ALL
SELECT N'02 El Deseado De Las Naciones', N'.mp3', N'audio', 4392, '20110817 01:18:38.993', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 El Deseado De Las Naciones.mp3' UNION ALL
SELECT N'02 El Gozo Del Señor', N'.mp3', N'audio', 4393, '20110817 01:18:38.993', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 El Gozo Del Señor.mp3' UNION ALL
SELECT N'02 Enamorame', N'.mp3', N'audio', 4394, '20110817 01:18:38.993', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Enamorame.mp3' UNION ALL
SELECT N'02 Fiesta hay en el corazón', N'.mp3', N'audio', 4395, '20110817 01:18:39.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Fiesta hay en el corazón.mp3' UNION ALL
SELECT N'02 Heartless', N'.mp3', N'audio', 4396, '20110817 01:18:39.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Heartless.mp3' UNION ALL
SELECT N'02 Home Featuring Maria Z', N'.mp3', N'audio', 4397, '20110817 01:18:39.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Home Featuring Maria Z.mp3' UNION ALL
SELECT N'02 Jeshua', N'.mp3', N'audio', 4398, '20110817 01:18:39.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Jeshua.mp3' UNION ALL
SELECT N'02 Let Him In', N'.mp3', N'audio', 4399, '20110817 01:18:39.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Let Him In.mp3' UNION ALL
SELECT N'02 Letting Go Of Tonight', N'.mp3', N'audio', 4400, '20110817 01:18:39.027', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Letting Go Of Tonight.mp3' UNION ALL
SELECT N'02 Mi Amigo Miguel', N'.mp3', N'audio', 4401, '20110817 01:18:39.027', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Mi Amigo Miguel.mp3' UNION ALL
SELECT N'02 Mi Anhelo', N'.mp3', N'audio', 4402, '20110817 01:18:39.027', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Mi Anhelo.mp3' UNION ALL
SELECT N'02 Mi Universo', N'.mp3', N'audio', 4403, '20110817 01:18:39.027', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Mi Universo.mp3' UNION ALL
SELECT N'02 my life be like', N'.mp3', N'audio', 4404, '20110817 01:18:39.027', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 my life be like.mp3' UNION ALL
SELECT N'02 NASA', N'.mp3', N'audio', 4405, '20110817 01:18:39.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 NASA.mp3' UNION ALL
SELECT N'02 No Matter What 1', N'.mp3', N'audio', 4406, '20110817 01:18:39.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 No Matter What 1.mp3' UNION ALL
SELECT N'02 No Matter What', N'.mp3', N'audio', 4407, '20110817 01:18:39.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 No Matter What.mp3' UNION ALL
SELECT N'02 Party In The USA', N'.mp3', N'audio', 4408, '20110817 01:18:39.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Party In The USA.mp3' UNION ALL
SELECT N'02 Playing with Fire', N'.mp3', N'audio', 4409, '20110817 01:18:39.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Playing with Fire.mp3' UNION ALL
SELECT N'02 Poderoso', N'.mp3', N'audio', 4410, '20110817 01:18:39.057', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Poderoso.mp3' UNION ALL
SELECT N'02 Renob, Nevada', N'.mp3', N'audio', 4411, '20110817 01:18:39.057', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Renob, Nevada.mp3' UNION ALL
SELECT N'02 Roots Beneath Ideals', N'.mp3', N'audio', 4412, '20110817 01:18:39.057', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Roots Beneath Ideals.mp3' UNION ALL
SELECT N'02 Salmo 121 (Dueto con Vicente Mont', N'.mp3', N'audio', 4413, '20110817 01:18:39.057', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Salmo 121 (Dueto con Vicente Mont.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 2.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'02 Sana nuestra tierra', N'.mp3', N'audio', 4414, '20110817 01:18:39.073', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Sana nuestra tierra.mp3' UNION ALL
SELECT N'02 Santo Y Poderoso', N'.mp3', N'audio', 4415, '20110817 01:18:39.073', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Santo Y Poderoso.mp3' UNION ALL
SELECT N'02 Si Yo Te Dejo', N'.mp3', N'audio', 4416, '20110817 01:18:39.073', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Si Yo Te Dejo.mp3' UNION ALL
SELECT N'02 Southern Constellations', N'.mp3', N'audio', 4417, '20110817 01:18:39.073', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Southern Constellations.mp3' UNION ALL
SELECT N'02 Su Dulce Voz', N'.mp3', N'audio', 4418, '20110817 01:18:39.087', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Su Dulce Voz.mp3' UNION ALL
SELECT N'02 The Angel Song', N'.mp3', N'audio', 4419, '20110817 01:18:39.087', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 The Angel Song.mp3' UNION ALL
SELECT N'02 The Bird and the Worm', N'.mp3', N'audio', 4420, '20110817 01:18:39.087', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 The Bird and the Worm.mp3' UNION ALL
SELECT N'02 The Ponytail Parade', N'.mp3', N'audio', 4421, '20110817 01:18:39.087', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 The Ponytail Parade.mp3' UNION ALL
SELECT N'02 Things We Go Through', N'.mp3', N'audio', 4422, '20110817 01:18:39.087', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Things We Go Through.mp3' UNION ALL
SELECT N'02 This Love', N'.mp3', N'audio', 4423, '20110817 01:18:39.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 This Love.mp3' UNION ALL
SELECT N'02 Track 02', N'.mp3', N'audio', 4424, '20110817 01:18:39.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Track 02.mp3' UNION ALL
SELECT N'02 Ven, Te Necesito', N'.mp3', N'audio', 4425, '20110817 01:18:39.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Ven, Te Necesito.mp3' UNION ALL
SELECT N'02 We were meant to Live', N'.mp3', N'audio', 4426, '20110817 01:18:39.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 We were meant to Live.mp3' UNION ALL
SELECT N'02 We Will Walk', N'.mp3', N'audio', 4427, '20110817 01:18:39.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 We Will Walk.mp3' UNION ALL
SELECT N'02 Who Am I', N'.mp3', N'audio', 4428, '20110817 01:18:39.120', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Who Am I.mp3' UNION ALL
SELECT N'02 Yo Te Busco', N'.mp3', N'audio', 4429, '20110817 01:18:39.120', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 Yo Te Busco.mp3' UNION ALL
SELECT N'02 You Reign', N'.mp3', N'audio', 4430, '20110817 01:18:39.120', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'02 You Reign.mp3' UNION ALL
SELECT N'03 A Message For Adrienne', N'.mp3', N'audio', 4431, '20110817 01:18:39.120', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 A Message For Adrienne.mp3' UNION ALL
SELECT N'03 Al Taller del Maestro', N'.mp3', N'audio', 4432, '20110817 01:18:39.133', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Al Taller del Maestro.mp3' UNION ALL
SELECT N'03 All Day Long', N'.mp3', N'audio', 4433, '20110817 01:18:39.133', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 All Day Long.mp3' UNION ALL
SELECT N'03 Alza Tus Ojos', N'.mp3', N'audio', 4434, '20110817 01:18:39.133', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Alza Tus Ojos.mp3' UNION ALL
SELECT N'03 Amazing God', N'.mp3', N'audio', 4435, '20110817 01:18:39.150', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Amazing God.mp3' UNION ALL
SELECT N'03 Assistant to the Regional Manager', N'.mp3', N'audio', 4436, '20110817 01:18:39.150', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Assistant to the Regional Manager.mp3' UNION ALL
SELECT N'03 Bajo Control', N'.mp3', N'audio', 4437, '20110817 01:18:39.150', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Bajo Control.mp3' UNION ALL
SELECT N'03 Beautiful Lie', N'.mp3', N'audio', 4438, '20110817 01:18:39.150', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Beautiful Lie.mp3' UNION ALL
SELECT N'03 Bounce Back', N'.mp3', N'audio', 4439, '20110817 01:18:39.167', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Bounce Back.mp3' UNION ALL
SELECT N'03 Canto Espontaneo', N'.mp3', N'audio', 4440, '20110817 01:18:39.167', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Canto Espontaneo.mp3' UNION ALL
SELECT N'03 Chasing Cars', N'.mp3', N'audio', 4441, '20110817 01:18:39.167', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Chasing Cars.mp3' UNION ALL
SELECT N'03 Digital Love', N'.mp3', N'audio', 4442, '20110817 01:18:39.167', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Digital Love.mp3' UNION ALL
SELECT N'03 Escalates', N'.mp3', N'audio', 4443, '20110817 01:18:39.167', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Escalates.mp3' UNION ALL
SELECT N'03 Esperame', N'.mp3', N'audio', 4444, '20110817 01:18:39.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Esperame.mp3' UNION ALL
SELECT N'03 False Pretense', N'.mp3', N'audio', 4445, '20110817 01:18:39.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 False Pretense.mp3' UNION ALL
SELECT N'03 Georgia On My Mind', N'.mp3', N'audio', 4446, '20110817 01:18:39.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Georgia On My Mind.mp3' UNION ALL
SELECT N'03 Home', N'.mp3', N'audio', 4447, '20110817 01:18:39.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Home.mp3' UNION ALL
SELECT N'03 How To Save A Life', N'.mp3', N'audio', 4448, '20110817 01:18:39.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 How To Save A Life.mp3' UNION ALL
SELECT N'03 I wanna go home', N'.mp3', N'audio', 4449, '20110817 01:18:39.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 I wanna go home.mp3' UNION ALL
SELECT N'03 I''M Made Of Wax, Larry, What Are', N'.mp3', N'audio', 4450, '20110817 01:18:39.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 I''M Made Of Wax, Larry, What Are.mp3' UNION ALL
SELECT N'03 Indescribable', N'.mp3', N'audio', 4451, '20110817 01:18:39.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Indescribable.mp3' UNION ALL
SELECT N'03 It''s Alright (Send Me)', N'.mp3', N'audio', 4452, '20110817 01:18:39.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 It''s Alright (Send Me).mp3' UNION ALL
SELECT N'03 Jubilee', N'.mp3', N'audio', 4453, '20110817 01:18:39.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Jubilee.mp3' UNION ALL
SELECT N'03 Kings And Queens', N'.mp3', N'audio', 4454, '20110817 01:18:39.213', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Kings And Queens.mp3' UNION ALL
SELECT N'03 Levantate Señor', N'.mp3', N'audio', 4455, '20110817 01:18:39.213', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Levantate Señor.mp3' UNION ALL
SELECT N'03 Lost Without You', N'.mp3', N'audio', 4456, '20110817 01:18:39.213', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Lost Without You.mp3' UNION ALL
SELECT N'03 Me asombra tu amor_', N'.mp3', N'audio', 4457, '20110817 01:18:39.213', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Me asombra tu amor_.mp3' UNION ALL
SELECT N'03 Mi primer amor', N'.mp3', N'audio', 4458, '20110817 01:18:39.213', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Mi primer amor.mp3' UNION ALL
SELECT N'03 Mi Vida', N'.mp3', N'audio', 4459, '20110817 01:18:39.230', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Mi Vida.mp3' UNION ALL
SELECT N'03 Necesitas Conocerle', N'.mp3', N'audio', 4460, '20110817 01:18:39.230', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Necesitas Conocerle.mp3' UNION ALL
SELECT N'03 New Drug', N'.mp3', N'audio', 4461, '20110817 01:18:39.230', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 New Drug.mp3' UNION ALL
SELECT N'03 No Hay Palabras', N'.mp3', N'audio', 4462, '20110817 01:18:39.230', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 No Hay Palabras.mp3' UNION ALL
SELECT N'03 Obertura Para Piano Y Orquesta Co', N'.mp3', N'audio', 4463, '20110817 01:18:39.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Obertura Para Piano Y Orquesta Co.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 3.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'03 Oh, Jesus', N'.mp3', N'audio', 4464, '20110817 01:18:39.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Oh, Jesus.mp3' UNION ALL
SELECT N'03 Senor Hazme un Radical', N'.mp3', N'audio', 4465, '20110817 01:18:39.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Senor Hazme un Radical.mp3' UNION ALL
SELECT N'03 Shalom, Sea La Paz', N'.mp3', N'audio', 4466, '20110817 01:18:39.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Shalom, Sea La Paz.mp3' UNION ALL
SELECT N'03 Si Te Tengo A Ti', N'.mp3', N'audio', 4467, '20110817 01:18:39.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Si Te Tengo A Ti.mp3' UNION ALL
SELECT N'03 Sinceridad', N'.mp3', N'audio', 4468, '20110817 01:18:39.260', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Sinceridad.mp3' UNION ALL
SELECT N'03 Te Vengo A Decir', N'.mp3', N'audio', 4469, '20110817 01:18:39.260', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Te Vengo A Decir.mp3' UNION ALL
SELECT N'03 The Bearer Of Bad News', N'.mp3', N'audio', 4470, '20110817 01:18:39.260', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 The Bearer Of Bad News.mp3' UNION ALL
SELECT N'03 The Black Pearl', N'.mp3', N'audio', 4471, '20110817 01:18:39.260', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 The Black Pearl.mp3' UNION ALL
SELECT N'03 The Question Is 1', N'.mp3', N'audio', 4472, '20110817 01:18:39.260', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 The Question Is 1.mp3' UNION ALL
SELECT N'03 The Question Is', N'.mp3', N'audio', 4473, '20110817 01:18:39.277', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 The Question Is.mp3' UNION ALL
SELECT N'03 The Youth', N'.mp3', N'audio', 4474, '20110817 01:18:39.277', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 The Youth.mp3' UNION ALL
SELECT N'03 Track 03', N'.mp3', N'audio', 4475, '20110817 01:18:39.277', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Track 03.mp3' UNION ALL
SELECT N'03 Tu Has Sido Fiel', N'.mp3', N'audio', 4476, '20110817 01:18:39.277', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Tu Has Sido Fiel.mp3' UNION ALL
SELECT N'03 Venció', N'.mp3', N'audio', 4477, '20110817 01:18:39.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Venció.mp3' UNION ALL
SELECT N'03 Vivir Sin Ti', N'.mp3', N'audio', 4478, '20110817 01:18:39.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 Vivir Sin Ti.mp3' UNION ALL
SELECT N'03 ¡Vengan Todos!', N'.mp3', N'audio', 4479, '20110817 01:18:39.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'03 ¡Vengan Todos!.mp3' UNION ALL
SELECT N'04 Aleluya', N'.mp3', N'audio', 4480, '20110817 01:18:39.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Aleluya.mp3' UNION ALL
SELECT N'04 Aqui Estoy', N'.mp3', N'audio', 4481, '20110817 01:18:39.307', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Aqui Estoy.mp3' UNION ALL
SELECT N'04 Aquí Estoy Otra Vez', N'.mp3', N'audio', 4482, '20110817 01:18:39.307', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Aquí Estoy Otra Vez.mp3' UNION ALL
SELECT N'04 Awake', N'.mp3', N'audio', 4483, '20110817 01:18:39.307', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Awake.mp3' UNION ALL
SELECT N'04 Boom Boom Pow (David Guetta Elect', N'.mp3', N'audio', 4484, '20110817 01:18:39.307', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Boom Boom Pow (David Guetta Elect.mp3' UNION ALL
SELECT N'04 Cap''tain', N'.mp3', N'audio', 4485, '20110817 01:18:39.323', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Cap''tain.mp3' UNION ALL
SELECT N'04 Contigo Estoy', N'.mp3', N'audio', 4486, '20110817 01:18:39.323', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Contigo Estoy.mp3' UNION ALL
SELECT N'04 Cuan Bello es el Señor', N'.mp3', N'audio', 4487, '20110817 01:18:39.323', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Cuan Bello es el Señor.mp3' UNION ALL
SELECT N'04 Cuan Hermoso', N'.mp3', N'audio', 4488, '20110817 01:18:39.323', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Cuan Hermoso.mp3' UNION ALL
SELECT N'04 Dez Moines', N'.mp3', N'audio', 4489, '20110817 01:18:39.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Dez Moines.mp3' UNION ALL
SELECT N'04 El Ejercito De Dios', N'.mp3', N'audio', 4490, '20110817 01:18:39.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 El Ejercito De Dios.mp3' UNION ALL
SELECT N'04 El Gozo Del Señor', N'.mp3', N'audio', 4491, '20110817 01:18:39.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 El Gozo Del Señor.mp3' UNION ALL
SELECT N'04 Escuche La Voz', N'.mp3', N'audio', 4492, '20110817 01:18:39.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Escuche La Voz.mp3' UNION ALL
SELECT N'04 Everybody', N'.mp3', N'audio', 4493, '20110817 01:18:39.353', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Everybody.mp3' UNION ALL
SELECT N'04 Everyday Away', N'.mp3', N'audio', 4494, '20110817 01:18:39.353', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Everyday Away.mp3' UNION ALL
SELECT N'04 From Underneath', N'.mp3', N'audio', 4495, '20110817 01:18:39.353', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 From Underneath.mp3' UNION ALL
SELECT N'04 Hay Poder', N'.mp3', N'audio', 4496, '20110817 01:18:39.353', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Hay Poder.mp3' UNION ALL
SELECT N'04 Hosanna', N'.mp3', N'audio', 4497, '20110817 01:18:39.370', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Hosanna.mp3' UNION ALL
SELECT N'04 I Get On My Knees', N'.mp3', N'audio', 4498, '20110817 01:18:39.370', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 I Get On My Knees.mp3' UNION ALL
SELECT N'04 La Distancia', N'.mp3', N'audio', 4499, '20110817 01:18:39.370', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 La Distancia.mp3' UNION ALL
SELECT N'04 Levantate Y Salvame', N'.mp3', N'audio', 4500, '20110817 01:18:39.370', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Levantate Y Salvame.mp3' UNION ALL
SELECT N'04 Lluvia De Dios', N'.mp3', N'audio', 4501, '20110817 01:18:39.370', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Lluvia De Dios.mp3' UNION ALL
SELECT N'04 Más Que Palabras', N'.mp3', N'audio', 4502, '20110817 01:18:39.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Más Que Palabras.mp3' UNION ALL
SELECT N'04 Nada Mas Quien Piensas', N'.mp3', N'audio', 4503, '20110817 01:18:39.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Nada Mas Quien Piensas.mp3' UNION ALL
SELECT N'04 Never Meant To Break Your Heart', N'.mp3', N'audio', 4504, '20110817 01:18:39.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Never Meant To Break Your Heart.mp3' UNION ALL
SELECT N'04 No Hay Argumento', N'.mp3', N'audio', 4505, '20110817 01:18:39.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 No Hay Argumento.mp3' UNION ALL
SELECT N'04 No Temeré', N'.mp3', N'audio', 4506, '20110817 01:18:39.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 No Temeré.mp3' UNION ALL
SELECT N'04 Oh Jesus!', N'.mp3', N'audio', 4507, '20110817 01:18:39.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Oh Jesus!.mp3' UNION ALL
SELECT N'04 Our God Is Lord Of All', N'.mp3', N'audio', 4508, '20110817 01:18:39.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Our God Is Lord Of All.mp3' UNION ALL
SELECT N'04 Poderoso', N'.mp3', N'audio', 4509, '20110817 01:18:39.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Poderoso.mp3' UNION ALL
SELECT N'04 Quiero Cantar Una Linda Canción (', N'.mp3', N'audio', 4510, '20110817 01:18:39.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Quiero Cantar Una Linda Canción (.mp3' UNION ALL
SELECT N'04 Same Ol'' Game', N'.mp3', N'audio', 4511, '20110817 01:18:39.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Same Ol'' Game.mp3' UNION ALL
SELECT N'04 Shake It', N'.mp3', N'audio', 4512, '20110817 01:18:39.417', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Shake It.mp3' UNION ALL
SELECT N'04 She Will Be Loved', N'.mp3', N'audio', 4513, '20110817 01:18:39.417', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 She Will Be Loved.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 4.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'04 Shred, White, and Blue', N'.mp3', N'audio', 4514, '20110817 01:18:39.417', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Shred, White, and Blue.mp3' UNION ALL
SELECT N'04 Track 04', N'.mp3', N'audio', 4515, '20110817 01:18:39.417', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Track 04.mp3' UNION ALL
SELECT N'04 Vencere', N'.mp3', N'audio', 4516, '20110817 01:18:39.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Vencere.mp3' UNION ALL
SELECT N'04 Vision Pastoral', N'.mp3', N'audio', 4517, '20110817 01:18:39.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Vision Pastoral.mp3' UNION ALL
SELECT N'04 Wake Up Call', N'.mp3', N'audio', 4518, '20110817 01:18:39.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Wake Up Call.mp3' UNION ALL
SELECT N'04 Yo no podría vivir', N'.mp3', N'audio', 4519, '20110817 01:18:39.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Yo no podría vivir.mp3' UNION ALL
SELECT N'04 Your Love Lifted Me', N'.mp3', N'audio', 4520, '20110817 01:18:39.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 Your Love Lifted Me.mp3' UNION ALL
SELECT N'04 ¿Qué Eres Para Mí_', N'.mp3', N'audio', 4521, '20110817 01:18:39.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'04 ¿Qué Eres Para Mí_.mp3' UNION ALL
SELECT N'05 A Ti', N'.mp3', N'audio', 4522, '20110817 01:18:39.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 A Ti.mp3' UNION ALL
SELECT N'05 Alzaos Puertas Eternas', N'.mp3', N'audio', 4523, '20110817 01:18:39.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Alzaos Puertas Eternas.mp3' UNION ALL
SELECT N'05 Amo a Cristo', N'.mp3', N'audio', 4524, '20110817 01:18:39.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Amo a Cristo.mp3' UNION ALL
SELECT N'05 Big Wiggly Style', N'.mp3', N'audio', 4525, '20110817 01:18:39.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Big Wiggly Style.mp3' UNION ALL
SELECT N'05 Bigger Than My Imagination', N'.mp3', N'audio', 4526, '20110817 01:18:39.463', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Bigger Than My Imagination.mp3' UNION ALL
SELECT N'05 Black Cat', N'.mp3', N'audio', 4527, '20110817 01:18:39.463', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Black Cat.mp3' UNION ALL
SELECT N'05 Cambiaré Mi Tristeza', N'.mp3', N'audio', 4528, '20110817 01:18:39.463', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Cambiaré Mi Tristeza.mp3' UNION ALL
SELECT N'05 Canto Espontaneo', N'.mp3', N'audio', 4529, '20110817 01:18:39.463', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Canto Espontaneo.mp3' UNION ALL
SELECT N'05 Cuando El Primer Amor Se Va', N'.mp3', N'audio', 4530, '20110817 01:18:39.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Cuando El Primer Amor Se Va.mp3' UNION ALL
SELECT N'05 Daggers Speak Louder Than Word', N'.mp3', N'audio', 4531, '20110817 01:18:39.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Daggers Speak Louder Than Word.mp3' UNION ALL
SELECT N'05 Dame Mas Sabiduria (Trio con Jerr', N'.mp3', N'audio', 4532, '20110817 01:18:39.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Dame Mas Sabiduria (Trio con Jerr.mp3' UNION ALL
SELECT N'05 Dame Tus Ojos', N'.mp3', N'audio', 4533, '20110817 01:18:39.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Dame Tus Ojos.mp3' UNION ALL
SELECT N'05 Don''t Dink And Drance', N'.mp3', N'audio', 4534, '20110817 01:18:39.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Don''t Dink And Drance.mp3' UNION ALL
SELECT N'05 En los Montes, en los Valles', N'.mp3', N'audio', 4535, '20110817 01:18:39.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 En los Montes, en los Valles.mp3' UNION ALL
SELECT N'05 Enamorado', N'.mp3', N'audio', 4536, '20110817 01:18:39.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Enamorado.mp3' UNION ALL
SELECT N'05 Escucharte Hablar', N'.mp3', N'audio', 4537, '20110817 01:18:39.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Escucharte Hablar.mp3' UNION ALL
SELECT N'05 Exaltad', N'.mp3', N'audio', 4538, '20110817 01:18:39.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Exaltad.mp3' UNION ALL
SELECT N'05 Falling in Love', N'.mp3', N'audio', 4539, '20110817 01:18:39.510', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Falling in Love.mp3' UNION ALL
SELECT N'05 From The Inside Out', N'.mp3', N'audio', 4540, '20110817 01:18:39.510', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 From The Inside Out.mp3' UNION ALL
SELECT N'05 Give''em Featuring JBlaze', N'.mp3', N'audio', 4541, '20110817 01:18:39.510', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Give''em Featuring JBlaze.mp3' UNION ALL
SELECT N'05 Gloria, Reino y Po', N'.mp3', N'audio', 4542, '20110817 01:18:39.510', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Gloria, Reino y Po.mp3' UNION ALL
SELECT N'05 Good To Be Alive', N'.mp3', N'audio', 4543, '20110817 01:18:39.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Good To Be Alive.mp3' UNION ALL
SELECT N'05 Haven''t Met You Yet', N'.mp3', N'audio', 4544, '20110817 01:18:39.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Haven''t Met You Yet.mp3' UNION ALL
SELECT N'05 Hot Water On Wool', N'.mp3', N'audio', 4545, '20110817 01:18:39.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Hot Water On Wool.mp3' UNION ALL
SELECT N'05 Indie Rokkers', N'.mp3', N'audio', 4546, '20110817 01:18:39.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Indie Rokkers.mp3' UNION ALL
SELECT N'05 Las Naciones Proclamen', N'.mp3', N'audio', 4547, '20110817 01:18:39.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Las Naciones Proclamen.mp3' UNION ALL
SELECT N'05 Letters To The President', N'.mp3', N'audio', 4548, '20110817 01:18:39.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Letters To The President.mp3' UNION ALL
SELECT N'05 Mi Corazón Está De Fiesta', N'.mp3', N'audio', 4549, '20110817 01:18:39.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Mi Corazón Está De Fiesta.mp3' UNION ALL
SELECT N'05 Mi Jardin', N'.mp3', N'audio', 4550, '20110817 01:18:39.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Mi Jardin.mp3' UNION ALL
SELECT N'05 Mi primer amor', N'.mp3', N'audio', 4551, '20110817 01:18:39.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Mi primer amor.mp3' UNION ALL
SELECT N'05 Narración_ Salmos 100_4', N'.mp3', N'audio', 4552, '20110817 01:18:39.557', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Narración_ Salmos 100_4.mp3' UNION ALL
SELECT N'05 No Es Como Yo', N'.mp3', N'audio', 4553, '20110817 01:18:39.557', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 No Es Como Yo.mp3' UNION ALL
SELECT N'05 Peña De Horeb (Versión Acústica)', N'.mp3', N'audio', 4554, '20110817 01:18:39.557', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Peña De Horeb (Versión Acústica).mp3' UNION ALL
SELECT N'05 Real Love', N'.mp3', N'audio', 4555, '20110817 01:18:39.557', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Real Love.mp3' UNION ALL
SELECT N'05 Senor, Hazme Un Radical', N'.mp3', N'audio', 4556, '20110817 01:18:39.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Senor, Hazme Un Radical.mp3' UNION ALL
SELECT N'05 Survivor', N'.mp3', N'audio', 4557, '20110817 01:18:39.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Survivor.mp3' UNION ALL
SELECT N'05 Take You Back', N'.mp3', N'audio', 4558, '20110817 01:18:39.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Take You Back.mp3' UNION ALL
SELECT N'05 Tan Lejos, Tan Cerca', N'.mp3', N'audio', 4559, '20110817 01:18:39.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Tan Lejos, Tan Cerca.mp3' UNION ALL
SELECT N'05 Te Anhelo', N'.mp3', N'audio', 4560, '20110817 01:18:39.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Te Anhelo.mp3' UNION ALL
SELECT N'05 Tears of the Saints', N'.mp3', N'audio', 4561, '20110817 01:18:39.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Tears of the Saints.mp3' UNION ALL
SELECT N'05 Tengo Libertad', N'.mp3', N'audio', 4562, '20110817 01:18:39.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Tengo Libertad.mp3' UNION ALL
SELECT N'05 The Sun Will Shine Again', N'.mp3', N'audio', 4563, '20110817 01:18:39.603', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 The Sun Will Shine Again.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 5.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'05 Track 05', N'.mp3', N'audio', 4564, '20110817 01:18:39.603', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Track 05.mp3' UNION ALL
SELECT N'05 Tu Eres Mi Respirar', N'.mp3', N'audio', 4565, '20110817 01:18:39.603', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Tu Eres Mi Respirar.mp3' UNION ALL
SELECT N'05 Tu Mirada', N'.mp3', N'audio', 4566, '20110817 01:18:39.603', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Tu Mirada.mp3' UNION ALL
SELECT N'05 Tuya La Gloria Es', N'.mp3', N'audio', 4567, '20110817 01:18:39.603', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Tuya La Gloria Es.mp3' UNION ALL
SELECT N'05 Vejea Speaks On Racism', N'.mp3', N'audio', 4568, '20110817 01:18:39.620', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Vejea Speaks On Racism.mp3' UNION ALL
SELECT N'05 Vuelve Pronto', N'.mp3', N'audio', 4569, '20110817 01:18:39.620', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'05 Vuelve Pronto.mp3' UNION ALL
SELECT N'06 A Ti Sea La Gloria', N'.mp3', N'audio', 4570, '20110817 01:18:39.620', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 A Ti Sea La Gloria.mp3' UNION ALL
SELECT N'06 Acuerdate Oh Senor', N'.mp3', N'audio', 4571, '20110817 01:18:39.620', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Acuerdate Oh Senor.mp3' UNION ALL
SELECT N'06 Acuerdate oh Señor', N'.mp3', N'audio', 4572, '20110817 01:18:39.633', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Acuerdate oh Señor.mp3' UNION ALL
SELECT N'06 Aleluya (Repeticion)', N'.mp3', N'audio', 4573, '20110817 01:18:39.633', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Aleluya (Repeticion).mp3' UNION ALL
SELECT N'06 Always For You', N'.mp3', N'audio', 4574, '20110817 01:18:39.633', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Always For You.mp3' UNION ALL
SELECT N'06 Amateur Lovers', N'.mp3', N'audio', 4575, '20110817 01:18:39.650', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Amateur Lovers.mp3' UNION ALL
SELECT N'06 Baptize Me', N'.mp3', N'audio', 4576, '20110817 01:18:39.650', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Baptize Me.mp3' UNION ALL
SELECT N'06 Best Friend', N'.mp3', N'audio', 4577, '20110817 01:18:39.650', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Best Friend.mp3' UNION ALL
SELECT N'06 Burning Down The House', N'.mp3', N'audio', 4578, '20110817 01:18:39.650', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Burning Down The House.mp3' UNION ALL
SELECT N'06 Crazy', N'.mp3', N'audio', 4579, '20110817 01:18:39.650', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Crazy.mp3' UNION ALL
SELECT N'06 Cristo Es Mi Senor', N'.mp3', N'audio', 4580, '20110817 01:18:39.667', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Cristo Es Mi Senor.mp3' UNION ALL
SELECT N'06 Dios No Te Olvida', N'.mp3', N'audio', 4581, '20110817 01:18:39.667', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Dios No Te Olvida.mp3' UNION ALL
SELECT N'06 Dispuesto Estoy', N'.mp3', N'audio', 4582, '20110817 01:18:39.667', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Dispuesto Estoy.mp3' UNION ALL
SELECT N'06 El Hombre Necesita De Dios', N'.mp3', N'audio', 4583, '20110817 01:18:39.667', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 El Hombre Necesita De Dios.mp3' UNION ALL
SELECT N'06 Enamorado Parte 2', N'.mp3', N'audio', 4584, '20110817 01:18:39.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Enamorado Parte 2.mp3' UNION ALL
SELECT N'06 Enamorame (Dueto con Abel Zav', N'.mp3', N'audio', 4585, '20110817 01:18:39.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Enamorame (Dueto con Abel Zav.mp3' UNION ALL
SELECT N'06 Es Tu Amor', N'.mp3', N'audio', 4586, '20110817 01:18:39.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Es Tu Amor.mp3' UNION ALL
SELECT N'06 Espera', N'.mp3', N'audio', 4587, '20110817 01:18:39.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Espera.mp3' UNION ALL
SELECT N'06 Este Dia Especial', N'.mp3', N'audio', 4588, '20110817 01:18:39.697', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Este Dia Especial.mp3' UNION ALL
SELECT N'06 Falling Asleep On A Stranger', N'.mp3', N'audio', 4589, '20110817 01:18:39.697', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Falling Asleep On A Stranger.mp3' UNION ALL
SELECT N'06 Gathering, The', N'.mp3', N'audio', 4590, '20110817 01:18:39.697', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Gathering, The.mp3' UNION ALL
SELECT N'06 Gracias Señor', N'.mp3', N'audio', 4591, '20110817 01:18:39.713', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Gracias Señor.mp3' UNION ALL
SELECT N'06 Have Faith In Me', N'.mp3', N'audio', 4592, '20110817 01:18:39.713', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Have Faith In Me.mp3' UNION ALL
SELECT N'06 Heme Aqui', N'.mp3', N'audio', 4593, '20110817 01:18:39.727', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Heme Aqui.mp3' UNION ALL
SELECT N'06 Lord I Seek You', N'.mp3', N'audio', 4594, '20110817 01:18:39.727', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Lord I Seek You.mp3' UNION ALL
SELECT N'06 Lost', N'.mp3', N'audio', 4595, '20110817 01:18:39.727', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Lost.mp3' UNION ALL
SELECT N'06 Me Robaste El Corazon', N'.mp3', N'audio', 4596, '20110817 01:18:39.727', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Me Robaste El Corazon.mp3' UNION ALL
SELECT N'06 Mi Corazon Te Canta', N'.mp3', N'audio', 4597, '20110817 01:18:39.743', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Mi Corazon Te Canta.mp3' UNION ALL
SELECT N'06 Miserable At Best', N'.mp3', N'audio', 4598, '20110817 01:18:39.743', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Miserable At Best.mp3' UNION ALL
SELECT N'06 Oh Gracias, Encontre La Vida', N'.mp3', N'audio', 4599, '20110817 01:18:39.743', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Oh Gracias, Encontre La Vida.mp3' UNION ALL
SELECT N'06 Popurri De Coros (Alabaré_ Alabad', N'.mp3', N'audio', 4600, '20110817 01:18:39.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Popurri De Coros (Alabaré_ Alabad.mp3' UNION ALL
SELECT N'06 Quién como tu_', N'.mp3', N'audio', 4601, '20110817 01:18:39.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Quién como tu_.mp3' UNION ALL
SELECT N'06 Restauraras El Santo Lugar', N'.mp3', N'audio', 4602, '20110817 01:18:39.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Restauraras El Santo Lugar.mp3' UNION ALL
SELECT N'06 Right Here', N'.mp3', N'audio', 4603, '20110817 01:18:39.760', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Right Here.mp3' UNION ALL
SELECT N'06 Song For The Broken', N'.mp3', N'audio', 4604, '20110817 01:18:39.773', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Song For The Broken.mp3' UNION ALL
SELECT N'06 Te Dare Alabanza Y Honor', N'.mp3', N'audio', 4605, '20110817 01:18:39.773', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Te Dare Alabanza Y Honor.mp3' UNION ALL
SELECT N'06 Temprano Yo Te Buscare', N'.mp3', N'audio', 4606, '20110817 01:18:39.773', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Temprano Yo Te Buscare.mp3' UNION ALL
SELECT N'06 Testimony', N'.mp3', N'audio', 4607, '20110817 01:18:39.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Testimony.mp3' UNION ALL
SELECT N'06 The Color Hate', N'.mp3', N'audio', 4608, '20110817 01:18:39.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 The Color Hate.mp3' UNION ALL
SELECT N'06 The New National Anthem', N'.mp3', N'audio', 4609, '20110817 01:18:39.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 The New National Anthem.mp3' UNION ALL
SELECT N'06 Theme from Schindlers List', N'.mp3', N'audio', 4610, '20110817 01:18:39.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Theme from Schindlers List.mp3' UNION ALL
SELECT N'06 This Time', N'.mp3', N'audio', 4611, '20110817 01:18:39.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 This Time.mp3' UNION ALL
SELECT N'06 Track 06', N'.mp3', N'audio', 4612, '20110817 01:18:39.807', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Track 06.mp3' UNION ALL
SELECT N'06 Tu cielo perdido', N'.mp3', N'audio', 4613, '20110817 01:18:39.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Tu cielo perdido.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 6.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'06 Tú Conoces', N'.mp3', N'audio', 4614, '20110817 01:18:39.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Tú Conoces.mp3' UNION ALL
SELECT N'06 Vencio', N'.mp3', N'audio', 4615, '20110817 01:18:39.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'06 Vencio.mp3' UNION ALL
SELECT N'07 Alfa Y Omega', N'.mp3', N'audio', 4616, '20110817 01:18:39.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Alfa Y Omega.mp3' UNION ALL
SELECT N'07 Ben Has a Kid', N'.mp3', N'audio', 4617, '20110817 01:18:39.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Ben Has a Kid.mp3' UNION ALL
SELECT N'07 Best Of Me', N'.mp3', N'audio', 4618, '20110817 01:18:39.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Best Of Me.mp3' UNION ALL
SELECT N'07 Bienaventurado', N'.mp3', N'audio', 4619, '20110817 01:18:39.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Bienaventurado.mp3' UNION ALL
SELECT N'07 Canto Espontaneo', N'.mp3', N'audio', 4620, '20110817 01:18:39.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Canto Espontaneo.mp3' UNION ALL
SELECT N'07 Closer To The Edge', N'.mp3', N'audio', 4621, '20110817 01:18:39.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Closer To The Edge.mp3' UNION ALL
SELECT N'07 Come On Over', N'.mp3', N'audio', 4622, '20110817 01:18:39.853', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Come On Over.mp3' UNION ALL
SELECT N'07 Ella Y El', N'.mp3', N'audio', 4623, '20110817 01:18:39.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Ella Y El.mp3' UNION ALL
SELECT N'07 Enamorado', N'.mp3', N'audio', 4624, '20110817 01:18:39.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Enamorado.mp3' UNION ALL
SELECT N'07 Enamórame', N'.mp3', N'audio', 4625, '20110817 01:18:39.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Enamórame.mp3' UNION ALL
SELECT N'07 Esperamos en ti', N'.mp3', N'audio', 4626, '20110817 01:18:39.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Esperamos en ti.mp3' UNION ALL
SELECT N'07 Gravity', N'.mp3', N'audio', 4627, '20110817 01:18:39.883', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Gravity.mp3' UNION ALL
SELECT N'07 I Will Sing Of Your Love', N'.mp3', N'audio', 4628, '20110817 01:18:39.883', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 I Will Sing Of Your Love.mp3' UNION ALL
SELECT N'07 I Won''t Complain', N'.mp3', N'audio', 4629, '20110817 01:18:39.883', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 I Won''t Complain.mp3' UNION ALL
SELECT N'07 Jerusalem', N'.mp3', N'audio', 4630, '20110817 01:18:39.900', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Jerusalem.mp3' UNION ALL
SELECT N'07 Jesús Es Mi Rey Soberano', N'.mp3', N'audio', 4631, '20110817 01:18:39.900', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Jesús Es Mi Rey Soberano.mp3' UNION ALL
SELECT N'07 La Anunciacion', N'.mp3', N'audio', 4632, '20110817 01:18:39.900', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 La Anunciacion.mp3' UNION ALL
SELECT N'07 Le He Prestado La Mano A Jesús', N'.mp3', N'audio', 4633, '20110817 01:18:39.900', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Le He Prestado La Mano A Jesús.mp3' UNION ALL
SELECT N'07 Mas El Dios De Toda Gracia', N'.mp3', N'audio', 4634, '20110817 01:18:39.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Mas El Dios De Toda Gracia.mp3' UNION ALL
SELECT N'07 Meteor Shower', N'.mp3', N'audio', 4635, '20110817 01:18:39.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Meteor Shower.mp3' UNION ALL
SELECT N'07 Move', N'.mp3', N'audio', 4636, '20110817 01:18:39.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Move.mp3' UNION ALL
SELECT N'07 Narración_ Altar De Bronze', N'.mp3', N'audio', 4637, '20110817 01:18:39.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Narración_ Altar De Bronze.mp3' UNION ALL
SELECT N'07 Paz, Cuan Dulce Paz', N'.mp3', N'audio', 4638, '20110817 01:18:39.930', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Paz, Cuan Dulce Paz.mp3' UNION ALL
SELECT N'07 Play That Funky Music', N'.mp3', N'audio', 4639, '20110817 01:18:39.930', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Play That Funky Music.mp3' UNION ALL
SELECT N'07 Reflection', N'.mp3', N'audio', 4640, '20110817 01:18:39.930', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Reflection.mp3' UNION ALL
SELECT N'07 She Sings in the Morning', N'.mp3', N'audio', 4641, '20110817 01:18:39.930', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 She Sings in the Morning.mp3' UNION ALL
SELECT N'07 Te Veo', N'.mp3', N'audio', 4642, '20110817 01:18:39.947', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Te Veo.mp3' UNION ALL
SELECT N'07 Tengo la palabra', N'.mp3', N'audio', 4643, '20110817 01:18:39.947', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Tengo la palabra.mp3' UNION ALL
SELECT N'07 Tentación', N'.mp3', N'audio', 4644, '20110817 01:18:39.947', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Tentación.mp3' UNION ALL
SELECT N'07 Tiempo De Cruz', N'.mp3', N'audio', 4645, '20110817 01:18:39.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Tiempo De Cruz.mp3' UNION ALL
SELECT N'07 Track 07', N'.mp3', N'audio', 4646, '20110817 01:18:39.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Track 07.mp3' UNION ALL
SELECT N'07 Tu Fidelidad', N'.mp3', N'audio', 4647, '20110817 01:18:39.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Tu Fidelidad.mp3' UNION ALL
SELECT N'07 Un Mundo Diferente', N'.mp3', N'audio', 4648, '20110817 01:18:39.977', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Un Mundo Diferente.mp3' UNION ALL
SELECT N'07 Use Me', N'.mp3', N'audio', 4649, '20110817 01:18:39.977', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Use Me.mp3' UNION ALL
SELECT N'07 Yeshua', N'.mp3', N'audio', 4650, '20110817 01:18:39.977', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 Yeshua.mp3' UNION ALL
SELECT N'07 ¡Gloria!', N'.mp3', N'audio', 4651, '20110817 01:18:39.993', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 ¡Gloria!.mp3' UNION ALL
SELECT N'07 ¿A quién iré-', N'.mp3', N'audio', 4652, '20110817 01:18:39.993', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'07 ¿A quién iré-.mp3' UNION ALL
SELECT N'08 Alcarda', N'.mp3', N'audio', 4653, '20110817 01:18:39.993', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Alcarda.mp3' UNION ALL
SELECT N'08 Alegra Mi Vida', N'.mp3', N'audio', 4654, '20110817 01:18:40.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Alegra Mi Vida.mp3' UNION ALL
SELECT N'08 Aleluya', N'.mp3', N'audio', 4655, '20110817 01:18:40.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Aleluya.mp3' UNION ALL
SELECT N'08 Believer', N'.mp3', N'audio', 4656, '20110817 01:18:40.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Believer.mp3' UNION ALL
SELECT N'08 Beneath The Surface', N'.mp3', N'audio', 4657, '20110817 01:18:40.010', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Beneath The Surface.mp3' UNION ALL
SELECT N'08 Cada Mañana', N'.mp3', N'audio', 4658, '20110817 01:18:40.023', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Cada Mañana.mp3' UNION ALL
SELECT N'08 Divino Companero Del Camino (Con', N'.mp3', N'audio', 4659, '20110817 01:18:40.023', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Divino Companero Del Camino (Con.mp3' UNION ALL
SELECT N'08 En El Aire', N'.mp3', N'audio', 4660, '20110817 01:18:40.023', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 En El Aire.mp3' UNION ALL
SELECT N'08 Eres Tu', N'.mp3', N'audio', 4661, '20110817 01:18:40.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Eres Tu.mp3' UNION ALL
SELECT N'08 Es Por Tu Amor', N'.mp3', N'audio', 4662, '20110817 01:18:40.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Es Por Tu Amor.mp3' UNION ALL
SELECT N'08 Exaltate', N'.mp3', N'audio', 4663, '20110817 01:18:40.040', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Exaltate.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 7.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'08 Fumbles O''Brian', N'.mp3', N'audio', 4664, '20110817 01:18:40.057', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Fumbles O''Brian.mp3' UNION ALL
SELECT N'08 Get On Up', N'.mp3', N'audio', 4665, '20110817 01:18:40.057', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Get On Up.mp3' UNION ALL
SELECT N'08 Grandes cosas ha hecho el Señor', N'.mp3', N'audio', 4666, '20110817 01:18:40.057', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Grandes cosas ha hecho el Señor.mp3' UNION ALL
SELECT N'08 Heaven', N'.mp3', N'audio', 4667, '20110817 01:18:40.070', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Heaven.mp3' UNION ALL
SELECT N'08 Homesick', N'.mp3', N'audio', 4668, '20110817 01:18:40.070', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Homesick.mp3' UNION ALL
SELECT N'08 Jesus', N'.mp3', N'audio', 4669, '20110817 01:18:40.070', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Jesus.mp3' UNION ALL
SELECT N'08 Jesús Mi Fiel Amigo', N'.mp3', N'audio', 4670, '20110817 01:18:40.070', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Jesús Mi Fiel Amigo.mp3' UNION ALL
SELECT N'08 Just For a Day', N'.mp3', N'audio', 4671, '20110817 01:18:40.087', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Just For a Day.mp3' UNION ALL
SELECT N'08 Me Amas', N'.mp3', N'audio', 4672, '20110817 01:18:40.087', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Me Amas.mp3' UNION ALL
SELECT N'08 Mi Herencia', N'.mp3', N'audio', 4673, '20110817 01:18:40.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Mi Herencia.mp3' UNION ALL
SELECT N'08 New Hope Generation', N'.mp3', N'audio', 4674, '20110817 01:18:40.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 New Hope Generation.mp3' UNION ALL
SELECT N'08 No Sleep Tonight', N'.mp3', N'audio', 4675, '20110817 01:18:40.103', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 No Sleep Tonight.mp3' UNION ALL
SELECT N'08 Padre Nuestro', N'.mp3', N'audio', 4676, '20110817 01:18:40.117', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Padre Nuestro.mp3' UNION ALL
SELECT N'08 Por Tu Llaga', N'.mp3', N'audio', 4677, '20110817 01:18:40.117', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Por Tu Llaga.mp3' UNION ALL
SELECT N'08 Quiero Gritarlo', N'.mp3', N'audio', 4678, '20110817 01:18:40.117', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Quiero Gritarlo.mp3' UNION ALL
SELECT N'08 Reptar, King Of The Ozone', N'.mp3', N'audio', 4679, '20110817 01:18:40.133', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Reptar, King Of The Ozone.mp3' UNION ALL
SELECT N'08 Right Here Waiting', N'.mp3', N'audio', 4680, '20110817 01:18:40.133', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Right Here Waiting.mp3' UNION ALL
SELECT N'08 Santo, Santo, Santo', N'.mp3', N'audio', 4681, '20110817 01:18:40.133', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Santo, Santo, Santo.mp3' UNION ALL
SELECT N'08 Sin Reservas', N'.mp3', N'audio', 4682, '20110817 01:18:40.133', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Sin Reservas.mp3' UNION ALL
SELECT N'08 Stay Away From My Friends', N'.mp3', N'audio', 4683, '20110817 01:18:40.150', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Stay Away From My Friends.mp3' UNION ALL
SELECT N'08 Te Necesito Mas Que Ayer', N'.mp3', N'audio', 4684, '20110817 01:18:40.150', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Te Necesito Mas Que Ayer.mp3' UNION ALL
SELECT N'08 Te Necesito Más Que Ayer', N'.mp3', N'audio', 4685, '20110817 01:18:40.150', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Te Necesito Más Que Ayer.mp3' UNION ALL
SELECT N'08 Temprano Yo Te Buscare', N'.mp3', N'audio', 4686, '20110817 01:18:40.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Temprano Yo Te Buscare.mp3' UNION ALL
SELECT N'08 Thank You', N'.mp3', N'audio', 4687, '20110817 01:18:40.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Thank You.mp3' UNION ALL
SELECT N'08 Track 08', N'.mp3', N'audio', 4688, '20110817 01:18:40.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Track 08.mp3' UNION ALL
SELECT N'08 Tu Mirada', N'.mp3', N'audio', 4689, '20110817 01:18:40.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Tu Mirada.mp3' UNION ALL
SELECT N'08 Vivifícame', N'.mp3', N'audio', 4690, '20110817 01:18:40.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Vivifícame.mp3' UNION ALL
SELECT N'08 Wapakalypse', N'.mp3', N'audio', 4691, '20110817 01:18:40.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Wapakalypse.mp3' UNION ALL
SELECT N'08 Wonderful Tonight', N'.mp3', N'audio', 4692, '20110817 01:18:40.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Wonderful Tonight.mp3' UNION ALL
SELECT N'08 Yo Probé Tu Amor', N'.mp3', N'audio', 4693, '20110817 01:18:40.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'08 Yo Probé Tu Amor.mp3' UNION ALL
SELECT N'09 A Friend In Me 1', N'.mp3', N'audio', 4694, '20110817 01:18:40.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 A Friend In Me 1.mp3' UNION ALL
SELECT N'09 A Friend In Me', N'.mp3', N'audio', 4695, '20110817 01:18:40.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 A Friend In Me.mp3' UNION ALL
SELECT N'09 Aleluya a nuestro Dios', N'.mp3', N'audio', 4696, '20110817 01:18:40.197', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Aleluya a nuestro Dios.mp3' UNION ALL
SELECT N'09 Aleluya To Our God', N'.mp3', N'audio', 4697, '20110817 01:18:40.210', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Aleluya To Our God.mp3' UNION ALL
SELECT N'09 Alli Estas Tu', N'.mp3', N'audio', 4698, '20110817 01:18:40.210', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Alli Estas Tu.mp3' UNION ALL
SELECT N'09 Alone In December', N'.mp3', N'audio', 4699, '20110817 01:18:40.210', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Alone In December.mp3' UNION ALL
SELECT N'09 Amante De Ti, Señor', N'.mp3', N'audio', 4700, '20110817 01:18:40.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Amante De Ti, Señor.mp3' UNION ALL
SELECT N'09 Amigos', N'.mp3', N'audio', 4701, '20110817 01:18:40.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Amigos.mp3' UNION ALL
SELECT N'09 Canto Espontaneo', N'.mp3', N'audio', 4702, '20110817 01:18:40.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Canto Espontaneo.mp3' UNION ALL
SELECT N'09 Dios ha sido fiel', N'.mp3', N'audio', 4703, '20110817 01:18:40.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Dios ha sido fiel.mp3' UNION ALL
SELECT N'09 El Amor De Dios Nunca Se Acaba', N'.mp3', N'audio', 4704, '20110817 01:18:40.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 El Amor De Dios Nunca Se Acaba.mp3' UNION ALL
SELECT N'09 El Amor', N'.mp3', N'audio', 4705, '20110817 01:18:40.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 El Amor.mp3' UNION ALL
SELECT N'09 Gimme Half', N'.mp3', N'audio', 4706, '20110817 01:18:40.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Gimme Half.mp3' UNION ALL
SELECT N'09 Hazla Volver', N'.mp3', N'audio', 4707, '20110817 01:18:40.243', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Hazla Volver.mp3' UNION ALL
SELECT N'09 Hermoso Eres', N'.mp3', N'audio', 4708, '20110817 01:18:40.257', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Hermoso Eres.mp3' UNION ALL
SELECT N'09 Levantare Mi Voz', N'.mp3', N'audio', 4709, '20110817 01:18:40.257', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Levantare Mi Voz.mp3' UNION ALL
SELECT N'09 Luz de Mi Vida', N'.mp3', N'audio', 4710, '20110817 01:18:40.257', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Luz de Mi Vida.mp3' UNION ALL
SELECT N'09 Me Dice Que Me Ama', N'.mp3', N'audio', 4711, '20110817 01:18:40.273', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Me Dice Que Me Ama.mp3' UNION ALL
SELECT N'09 Narración_ El Lavacro', N'.mp3', N'audio', 4712, '20110817 01:18:40.273', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Narración_ El Lavacro.mp3' UNION ALL
SELECT N'09 Now That It''s Over', N'.mp3', N'audio', 4713, '20110817 01:18:40.273', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Now That It''s Over.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 8.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'09 Palabras De Verdad', N'.mp3', N'audio', 4714, '20110817 01:18:40.273', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Palabras De Verdad.mp3' UNION ALL
SELECT N'09 Sendas Antiguas', N'.mp3', N'audio', 4715, '20110817 01:18:40.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Sendas Antiguas.mp3' UNION ALL
SELECT N'09 Sin Palabras', N'.mp3', N'audio', 4716, '20110817 01:18:40.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Sin Palabras.mp3' UNION ALL
SELECT N'09 Sometimes', N'.mp3', N'audio', 4717, '20110817 01:18:40.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Sometimes.mp3' UNION ALL
SELECT N'09 Tal Como Soy', N'.mp3', N'audio', 4718, '20110817 01:18:40.290', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Tal Como Soy.mp3' UNION ALL
SELECT N'09 Tell Me', N'.mp3', N'audio', 4719, '20110817 01:18:40.303', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Tell Me.mp3' UNION ALL
SELECT N'09 Too Much Heaven (Phase 2)', N'.mp3', N'audio', 4720, '20110817 01:18:40.303', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Too Much Heaven (Phase 2).mp3' UNION ALL
SELECT N'09 Track 09', N'.mp3', N'audio', 4721, '20110817 01:18:40.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Track 09.mp3' UNION ALL
SELECT N'09 True Love Waits', N'.mp3', N'audio', 4722, '20110817 01:18:40.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 True Love Waits.mp3' UNION ALL
SELECT N'09 Tu Cordero De Dios', N'.mp3', N'audio', 4723, '20110817 01:18:40.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Tu Cordero De Dios.mp3' UNION ALL
SELECT N'09 Tu Mirada', N'.mp3', N'audio', 4724, '20110817 01:18:40.337', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Tu Mirada.mp3' UNION ALL
SELECT N'09 Tu Palabra', N'.mp3', N'audio', 4725, '20110817 01:18:40.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Tu Palabra.mp3' UNION ALL
SELECT N'09 Tú Eres Fiel', N'.mp3', N'audio', 4726, '20110817 01:18:40.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Tú Eres Fiel.mp3' UNION ALL
SELECT N'09 Vendra', N'.mp3', N'audio', 4727, '20110817 01:18:40.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'09 Vendra.mp3' UNION ALL
SELECT N'1-01 Con Mi Dios', N'.mp3', N'audio', 4728, '20110817 01:18:40.367', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-01 Con Mi Dios.mp3' UNION ALL
SELECT N'1-02 De Hombro a Hombro', N'.mp3', N'audio', 4729, '20110817 01:18:40.367', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-02 De Hombro a Hombro.mp3' UNION ALL
SELECT N'1-03 Has Aumentado', N'.mp3', N'audio', 4730, '20110817 01:18:40.367', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-03 Has Aumentado.mp3' UNION ALL
SELECT N'1-04 Al Que Me Cine', N'.mp3', N'audio', 4731, '20110817 01:18:40.367', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-04 Al Que Me Cine.mp3' UNION ALL
SELECT N'1-05 El Es El Rey', N'.mp3', N'audio', 4732, '20110817 01:18:40.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-05 El Es El Rey.mp3' UNION ALL
SELECT N'1-06 Blessed Be Your Name', N'.mp3', N'audio', 4733, '20110817 01:18:40.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-06 Blessed Be Your Name.mp3' UNION ALL
SELECT N'1-06 Hombre de Compromiso', N'.mp3', N'audio', 4734, '20110817 01:18:40.383', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-06 Hombre de Compromiso.mp3' UNION ALL
SELECT N'1-07 Yo Me Rindo a El', N'.mp3', N'audio', 4735, '20110817 01:18:40.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-07 Yo Me Rindo a El.mp3' UNION ALL
SELECT N'1-08 Sumergeme', N'.mp3', N'audio', 4736, '20110817 01:18:40.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-08 Sumergeme.mp3' UNION ALL
SELECT N'1-09 Hacemos', N'.mp3', N'audio', 4737, '20110817 01:18:40.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-09 Hacemos.mp3' UNION ALL
SELECT N'1-10 Sentado En El Trono', N'.mp3', N'audio', 4738, '20110817 01:18:40.400', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1-10 Sentado En El Trono.mp3' UNION ALL
SELECT N'10 A New Thing', N'.mp3', N'audio', 4739, '20110817 01:18:40.413', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 A New Thing.mp3' UNION ALL
SELECT N'10 A Quién Tengo Yo Sino a ti', N'.mp3', N'audio', 4740, '20110817 01:18:40.413', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 A Quién Tengo Yo Sino a ti.mp3' UNION ALL
SELECT N'10 Allí Quiero Estar', N'.mp3', N'audio', 4741, '20110817 01:18:40.413', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Allí Quiero Estar.mp3' UNION ALL
SELECT N'10 Big', N'.mp3', N'audio', 4742, '20110817 01:18:40.413', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Big.mp3' UNION ALL
SELECT N'10 Captivate', N'.mp3', N'audio', 4743, '20110817 01:18:40.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Captivate.mp3' UNION ALL
SELECT N'10 Danzare, Cantare', N'.mp3', N'audio', 4744, '20110817 01:18:40.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Danzare, Cantare.mp3' UNION ALL
SELECT N'10 Disasterology', N'.mp3', N'audio', 4745, '20110817 01:18:40.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Disasterology.mp3' UNION ALL
SELECT N'10 En Tí Voy a Confiar', N'.mp3', N'audio', 4746, '20110817 01:18:40.430', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 En Tí Voy a Confiar.mp3' UNION ALL
SELECT N'10 Es Por Tu Gracia', N'.mp3', N'audio', 4747, '20110817 01:18:40.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Es Por Tu Gracia.mp3' UNION ALL
SELECT N'10 Fresh Prince In Bel Air', N'.mp3', N'audio', 4748, '20110817 01:18:40.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Fresh Prince In Bel Air.mp3' UNION ALL
SELECT N'10 Gracias', N'.mp3', N'audio', 4749, '20110817 01:18:40.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Gracias.mp3' UNION ALL
SELECT N'10 Heels Over Head', N'.mp3', N'audio', 4750, '20110817 01:18:40.447', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Heels Over Head.mp3' UNION ALL
SELECT N'10 Héroe', N'.mp3', N'audio', 4751, '20110817 01:18:40.460', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Héroe.mp3' UNION ALL
SELECT N'10 I Believe In Love', N'.mp3', N'audio', 4752, '20110817 01:18:40.460', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 I Believe In Love.mp3' UNION ALL
SELECT N'10 If We Are the Body', N'.mp3', N'audio', 4753, '20110817 01:18:40.460', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 If We Are the Body.mp3' UNION ALL
SELECT N'10 Jesús eres mi buen pastor', N'.mp3', N'audio', 4754, '20110817 01:18:40.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Jesús eres mi buen pastor.mp3' UNION ALL
SELECT N'10 Llename', N'.mp3', N'audio', 4755, '20110817 01:18:40.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Llename.mp3' UNION ALL
SELECT N'10 Lávame', N'.mp3', N'audio', 4756, '20110817 01:18:40.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Lávame.mp3' UNION ALL
SELECT N'10 Me Voy A La Montaña', N'.mp3', N'audio', 4757, '20110817 01:18:40.477', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Me Voy A La Montaña.mp3' UNION ALL
SELECT N'10 Mesias Mi Salvador', N'.mp3', N'audio', 4758, '20110817 01:18:40.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Mesias Mi Salvador.mp3' UNION ALL
SELECT N'10 Nickels Is Money Too', N'.mp3', N'audio', 4759, '20110817 01:18:40.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Nickels Is Money Too.mp3' UNION ALL
SELECT N'10 Oh Child', N'.mp3', N'audio', 4760, '20110817 01:18:40.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Oh Child.mp3' UNION ALL
SELECT N'10 Our God is Lord of All (Bonus Tra', N'.mp3', N'audio', 4761, '20110817 01:18:40.493', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Our God is Lord of All (Bonus Tra.mp3' UNION ALL
SELECT N'10 Por Siempre', N'.mp3', N'audio', 4762, '20110817 01:18:40.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Por Siempre.mp3' UNION ALL
SELECT N'10 Rey De Gloria', N'.mp3', N'audio', 4763, '20110817 01:18:40.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Rey De Gloria.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 9.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'10 Symmetry', N'.mp3', N'audio', 4764, '20110817 01:18:40.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Symmetry.mp3' UNION ALL
SELECT N'10 Take This To Heart', N'.mp3', N'audio', 4765, '20110817 01:18:40.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Take This To Heart.mp3' UNION ALL
SELECT N'10 Te Exaltamos', N'.mp3', N'audio', 4766, '20110817 01:18:40.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Te Exaltamos.mp3' UNION ALL
SELECT N'10 The Undertaker''s Thirst For Reven', N'.mp3', N'audio', 4767, '20110817 01:18:40.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 The Undertaker''s Thirst For Reven.mp3' UNION ALL
SELECT N'10 Track 10', N'.mp3', N'audio', 4768, '20110817 01:18:40.523', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Track 10.mp3' UNION ALL
SELECT N'10 Vejea Speaks On Poverty', N'.mp3', N'audio', 4769, '20110817 01:18:40.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Vejea Speaks On Poverty.mp3' UNION ALL
SELECT N'10 What A Wonderful World', N'.mp3', N'audio', 4770, '20110817 01:18:40.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 What A Wonderful World.mp3' UNION ALL
SELECT N'10 Who Do You Love_', N'.mp3', N'audio', 4771, '20110817 01:18:40.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Who Do You Love_.mp3' UNION ALL
SELECT N'10 Yo Creo', N'.mp3', N'audio', 4772, '20110817 01:18:40.540', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Yo Creo.mp3' UNION ALL
SELECT N'10 Yo Soy Jesús (Nuevo Remix)', N'.mp3', N'audio', 4773, '20110817 01:18:40.553', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'10 Yo Soy Jesús (Nuevo Remix).mp3' UNION ALL
SELECT N'11 Amante De Ti', N'.mp3', N'audio', 4774, '20110817 01:18:40.553', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Amante De Ti.mp3' UNION ALL
SELECT N'11 Danzaré, cantaré', N'.mp3', N'audio', 4775, '20110817 01:18:40.553', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Danzaré, cantaré.mp3' UNION ALL
SELECT N'11 De Ti Dependo', N'.mp3', N'audio', 4776, '20110817 01:18:40.553', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 De Ti Dependo.mp3' UNION ALL
SELECT N'11 En Los Montes, En Los Valles', N'.mp3', N'audio', 4777, '20110817 01:18:40.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 En Los Montes, En Los Valles.mp3' UNION ALL
SELECT N'11 How Can I Desert You', N'.mp3', N'audio', 4778, '20110817 01:18:40.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 How Can I Desert You.mp3' UNION ALL
SELECT N'11 In a Lose, Lose Situation', N'.mp3', N'audio', 4779, '20110817 01:18:40.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 In a Lose, Lose Situation.mp3' UNION ALL
SELECT N'11 Interlude', N'.mp3', N'audio', 4780, '20110817 01:18:40.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Interlude.mp3' UNION ALL
SELECT N'11 Lor I Seek You (Bonus Track)', N'.mp3', N'audio', 4781, '20110817 01:18:40.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Lor I Seek You (Bonus Track).mp3' UNION ALL
SELECT N'11 Mas De Lo Que Pedí', N'.mp3', N'audio', 4782, '20110817 01:18:40.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Mas De Lo Que Pedí.mp3' UNION ALL
SELECT N'11 Million Dollar Houses (The Painte', N'.mp3', N'audio', 4783, '20110817 01:18:40.587', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Million Dollar Houses (The Painte.mp3' UNION ALL
SELECT N'11 Poor Man', N'.mp3', N'audio', 4784, '20110817 01:18:40.600', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Poor Man.mp3' UNION ALL
SELECT N'11 Sólo Por Tu Sangre', N'.mp3', N'audio', 4785, '20110817 01:18:40.600', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Sólo Por Tu Sangre.mp3' UNION ALL
SELECT N'11 Thank You Lord', N'.mp3', N'audio', 4786, '20110817 01:18:40.600', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Thank You Lord.mp3' UNION ALL
SELECT N'11 The Alamo', N'.mp3', N'audio', 4787, '20110817 01:18:40.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 The Alamo.mp3' UNION ALL
SELECT N'11 Track 11', N'.mp3', N'audio', 4788, '20110817 01:18:40.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Track 11.mp3' UNION ALL
SELECT N'11 Tu amor por mi', N'.mp3', N'audio', 4789, '20110817 01:18:40.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Tu amor por mi.mp3' UNION ALL
SELECT N'11 Tú Harás', N'.mp3', N'audio', 4790, '20110817 01:18:40.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Tú Harás.mp3' UNION ALL
SELECT N'11 Una Cancion', N'.mp3', N'audio', 4791, '20110817 01:18:40.633', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Una Cancion.mp3' UNION ALL
SELECT N'11 Untitled', N'.mp3', N'audio', 4792, '20110817 01:18:40.633', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Untitled.mp3' UNION ALL
SELECT N'11 Vivir Con Él', N'.mp3', N'audio', 4793, '20110817 01:18:40.633', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Vivir Con Él.mp3' UNION ALL
SELECT N'11 Y Todo Ojo Le Vera', N'.mp3', N'audio', 4794, '20110817 01:18:40.633', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Y Todo Ojo Le Vera.mp3' UNION ALL
SELECT N'11 Yo quiero ser como Tu', N'.mp3', N'audio', 4795, '20110817 01:18:40.647', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 Yo quiero ser como Tu.mp3' UNION ALL
SELECT N'11 You''re My God', N'.mp3', N'audio', 4796, '20110817 01:18:40.647', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'11 You''re My God.mp3' UNION ALL
SELECT N'12 Aleluya', N'.mp3', N'audio', 4797, '20110817 01:18:40.647', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Aleluya.mp3' UNION ALL
SELECT N'12 Clap Your Hands', N'.mp3', N'audio', 4798, '20110817 01:18:40.647', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Clap Your Hands.mp3' UNION ALL
SELECT N'12 Como Tú No Hay Nadie', N'.mp3', N'audio', 4799, '20110817 01:18:40.663', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Como Tú No Hay Nadie.mp3' UNION ALL
SELECT N'12 Dios al mundo amó', N'.mp3', N'audio', 4800, '20110817 01:18:40.663', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Dios al mundo amó.mp3' UNION ALL
SELECT N'12 Dios Ha Sido Bueno', N'.mp3', N'audio', 4801, '20110817 01:18:40.663', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Dios Ha Sido Bueno.mp3' UNION ALL
SELECT N'12 Enciende Una Luz', N'.mp3', N'audio', 4802, '20110817 01:18:40.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Enciende Una Luz.mp3' UNION ALL
SELECT N'12 Hay Momentos', N'.mp3', N'audio', 4803, '20110817 01:18:40.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Hay Momentos.mp3' UNION ALL
SELECT N'12 Hermoso Eres', N'.mp3', N'audio', 4804, '20110817 01:18:40.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Hermoso Eres.mp3' UNION ALL
SELECT N'12 I Will Sing, I Will Dance (Bonus', N'.mp3', N'audio', 4805, '20110817 01:18:40.680', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 I Will Sing, I Will Dance (Bonus.mp3' UNION ALL
SELECT N'12 Keep On Keepin'' On', N'.mp3', N'audio', 4806, '20110817 01:18:40.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Keep On Keepin'' On.mp3' UNION ALL
SELECT N'12 Moment of Truth', N'.mp3', N'audio', 4807, '20110817 01:18:40.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Moment of Truth.mp3' UNION ALL
SELECT N'12 Narración_ El Lugar Santo', N'.mp3', N'audio', 4808, '20110817 01:18:40.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Narración_ El Lugar Santo.mp3' UNION ALL
SELECT N'12 Pegao A Ti', N'.mp3', N'audio', 4809, '20110817 01:18:40.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Pegao A Ti.mp3' UNION ALL
SELECT N'12 Souljahz Don''t Stop', N'.mp3', N'audio', 4810, '20110817 01:18:40.710', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Souljahz Don''t Stop.mp3' UNION ALL
SELECT N'12 Track 12', N'.mp3', N'audio', 4811, '20110817 01:18:40.710', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'12 Track 12.mp3' UNION ALL
SELECT N'13 36 Days', N'.mp3', N'audio', 4812, '20110817 01:18:40.710', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 36 Days.mp3' UNION ALL
SELECT N'13 Aleluya Reprise', N'.mp3', N'audio', 4813, '20110817 01:18:40.710', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Aleluya Reprise.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 10.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'13 Amor Eterno', N'.mp3', N'audio', 4814, '20110817 01:18:40.727', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Amor Eterno.mp3' UNION ALL
SELECT N'13 Digno es el Señor Ft Vino Nuevo', N'.mp3', N'audio', 4815, '20110817 01:18:40.727', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Digno es el Señor Ft Vino Nuevo.mp3' UNION ALL
SELECT N'13 Dime', N'.mp3', N'audio', 4816, '20110817 01:18:40.727', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Dime.mp3' UNION ALL
SELECT N'13 Do, Do, Do, Do, Do', N'.mp3', N'audio', 4817, '20110817 01:18:40.740', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Do, Do, Do, Do, Do.mp3' UNION ALL
SELECT N'13 Jesus Es El Señor (Bonus Track)', N'.mp3', N'audio', 4818, '20110817 01:18:40.740', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Jesus Es El Señor (Bonus Track).mp3' UNION ALL
SELECT N'13 Mi Pan, Mi Luz', N'.mp3', N'audio', 4819, '20110817 01:18:40.740', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Mi Pan, Mi Luz.mp3' UNION ALL
SELECT N'13 Track 13', N'.mp3', N'audio', 4820, '20110817 01:18:40.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Track 13.mp3' UNION ALL
SELECT N'13 Tu Has Sido Fiel', N'.mp3', N'audio', 4821, '20110817 01:18:40.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Tu Has Sido Fiel.mp3' UNION ALL
SELECT N'13 Worship', N'.mp3', N'audio', 4822, '20110817 01:18:40.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Worship.mp3' UNION ALL
SELECT N'13 Yes- Lord (interlude)', N'.mp3', N'audio', 4823, '20110817 01:18:40.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'13 Yes- Lord (interlude).mp3' UNION ALL
SELECT N'14 Amarte Más', N'.mp3', N'audio', 4824, '20110817 01:18:40.773', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'14 Amarte Más.mp3' UNION ALL
SELECT N'14 Muévete (Versión Radio)', N'.mp3', N'audio', 4825, '20110817 01:18:40.773', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'14 Muévete (Versión Radio).mp3' UNION ALL
SELECT N'14 Te Vengo A Decir', N'.mp3', N'audio', 4826, '20110817 01:18:40.773', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'14 Te Vengo A Decir.mp3' UNION ALL
SELECT N'14 The Anthem', N'.mp3', N'audio', 4827, '20110817 01:18:40.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'14 The Anthem.mp3' UNION ALL
SELECT N'14 Track 14', N'.mp3', N'audio', 4828, '20110817 01:18:40.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'14 Track 14.mp3' UNION ALL
SELECT N'14 Working For Your Good', N'.mp3', N'audio', 4829, '20110817 01:18:40.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'14 Working For Your Good.mp3' UNION ALL
SELECT N'15 Go Tell It On The Mountain', N'.mp3', N'audio', 4830, '20110817 01:18:40.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'15 Go Tell It On The Mountain.mp3' UNION ALL
SELECT N'15 Keep Risin''', N'.mp3', N'audio', 4831, '20110817 01:18:40.790', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'15 Keep Risin''.mp3' UNION ALL
SELECT N'15 Lifesong', N'.mp3', N'audio', 4832, '20110817 01:18:40.803', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'15 Lifesong.mp3' UNION ALL
SELECT N'15 Narracion_ El Lugar Santísimo', N'.mp3', N'audio', 4833, '20110817 01:18:40.803', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'15 Narracion_ El Lugar Santísimo.mp3' UNION ALL
SELECT N'15 Si Puedes Creer (Versión Radio)', N'.mp3', N'audio', 4834, '20110817 01:18:40.803', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'15 Si Puedes Creer (Versión Radio).mp3' UNION ALL
SELECT N'15 Track 15', N'.mp3', N'audio', 4835, '20110817 01:18:40.803', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'15 Track 15.mp3' UNION ALL
SELECT N'16 21 Guns', N'.mp3', N'audio', 4836, '20110817 01:18:40.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'16 21 Guns.mp3' UNION ALL
SELECT N'16 Dios De Pactos', N'.mp3', N'audio', 4837, '20110817 01:18:40.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'16 Dios De Pactos.mp3' UNION ALL
SELECT N'16 Keep Risin'' (Instrumental)', N'.mp3', N'audio', 4838, '20110817 01:18:40.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'16 Keep Risin'' (Instrumental).mp3' UNION ALL
SELECT N'16 Track 16', N'.mp3', N'audio', 4839, '20110817 01:18:40.820', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'16 Track 16.mp3' UNION ALL
SELECT N'17 Narración_ La Celebración', N'.mp3', N'audio', 4840, '20110817 01:18:40.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'17 Narración_ La Celebración.mp3' UNION ALL
SELECT N'17 Track 17', N'.mp3', N'audio', 4841, '20110817 01:18:40.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'17 Track 17.mp3' UNION ALL
SELECT N'18 Celebraré, Me Alegraré', N'.mp3', N'audio', 4842, '20110817 01:18:40.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'18 Celebraré, Me Alegraré.mp3' UNION ALL
SELECT N'19 Al Rey', N'.mp3', N'audio', 4843, '20110817 01:18:40.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'19 Al Rey.mp3' UNION ALL
SELECT N'1901', N'.mp3', N'audio', 4844, '20110817 01:18:40.837', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1901.mp3' UNION ALL
SELECT N'1aura[1]', N'.mp3', N'audio', 4845, '20110817 01:18:40.850', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'1aura[1].mp3' UNION ALL
SELECT N'2-01 Aleluya', N'.mp3', N'audio', 4846, '20110817 01:18:40.850', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-01 Aleluya.mp3' UNION ALL
SELECT N'2-02 Gloria Reino Y Poder', N'.mp3', N'audio', 4847, '20110817 01:18:40.850', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-02 Gloria Reino Y Poder.mp3' UNION ALL
SELECT N'2-03 Como Búfalo', N'.mp3', N'audio', 4848, '20110817 01:18:40.850', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-03 Como Búfalo.mp3' UNION ALL
SELECT N'2-04 Soy Nueva Criatura', N'.mp3', N'audio', 4849, '20110817 01:18:40.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-04 Soy Nueva Criatura.mp3' UNION ALL
SELECT N'2-05 Bajo Sus Pies', N'.mp3', N'audio', 4850, '20110817 01:18:40.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-05 Bajo Sus Pies.mp3' UNION ALL
SELECT N'2-06 Con Voz De Mando', N'.mp3', N'audio', 4851, '20110817 01:18:40.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-06 Con Voz De Mando.mp3' UNION ALL
SELECT N'2-07 Que Sería De Mí', N'.mp3', N'audio', 4852, '20110817 01:18:40.867', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-07 Que Sería De Mí.mp3' UNION ALL
SELECT N'2-08 Esperar En Ti', N'.mp3', N'audio', 4853, '20110817 01:18:40.883', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-08 Esperar En Ti.mp3' UNION ALL
SELECT N'2-09 Cerca De Ti', N'.mp3', N'audio', 4854, '20110817 01:18:40.883', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-09 Cerca De Ti.mp3' UNION ALL
SELECT N'2-10 Tal Como Soy', N'.mp3', N'audio', 4855, '20110817 01:18:40.883', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-10 Tal Como Soy.mp3' UNION ALL
SELECT N'2-11 Jesús El Señor', N'.mp3', N'audio', 4856, '20110817 01:18:40.883', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'2-11 Jesús El Señor.mp3' UNION ALL
SELECT N'20 La Batucada, Reprise_ Al Rey', N'.mp3', N'audio', 4857, '20110817 01:18:40.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'20 La Batucada, Reprise_ Al Rey.mp3' UNION ALL
SELECT N'21 Tricky Tricky', N'.mp3', N'audio', 4858, '20110817 01:18:40.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'21 Tricky Tricky.mp3' UNION ALL
SELECT N'21 Yo Te Busco (Bonus Track)', N'.mp3', N'audio', 4859, '20110817 01:18:40.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'21 Yo Te Busco (Bonus Track).mp3' UNION ALL
SELECT N'255 Quando Quando Quando', N'.mp3', N'audio', 4860, '20110817 01:18:40.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'255 Quando Quando Quando.mp3' UNION ALL
SELECT N'3-01 Soy libre de afliccion', N'.mp3', N'audio', 4861, '20110817 01:18:40.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-01 Soy libre de afliccion.mp3' UNION ALL
SELECT N'3-02 Libertad', N'.mp3', N'audio', 4862, '20110817 01:18:40.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-02 Libertad.mp3' UNION ALL
SELECT N'3-03 Soy Una Saeta', N'.mp3', N'audio', 4863, '20110817 01:18:40.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-03 Soy Una Saeta.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 11.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'3-04 ABBA Padre', N'.mp3', N'audio', 4864, '20110817 01:18:40.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-04 ABBA Padre.mp3' UNION ALL
SELECT N'3-05 En Él Estoy Seguro', N'.mp3', N'audio', 4865, '20110817 01:18:40.913', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-05 En Él Estoy Seguro.mp3' UNION ALL
SELECT N'3-06 No Hay Argumento', N'.mp3', N'audio', 4866, '20110817 01:18:40.930', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-06 No Hay Argumento.mp3' UNION ALL
SELECT N'3-07 Me Has Atraido Jesús', N'.mp3', N'audio', 4867, '20110817 01:18:40.930', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-07 Me Has Atraido Jesús.mp3' UNION ALL
SELECT N'3-08 Con Manos Vacías', N'.mp3', N'audio', 4868, '20110817 01:18:40.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-08 Con Manos Vacías.mp3' UNION ALL
SELECT N'3-09 Envíame A Mí', N'.mp3', N'audio', 4869, '20110817 01:18:40.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-09 Envíame A Mí.mp3' UNION ALL
SELECT N'3-10 Rebosa Mi Corazón', N'.mp3', N'audio', 4870, '20110817 01:18:40.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-10 Rebosa Mi Corazón.mp3' UNION ALL
SELECT N'3-11 Mi Jesús Mi Amado', N'.mp3', N'audio', 4871, '20110817 01:18:40.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-11 Mi Jesús Mi Amado.mp3' UNION ALL
SELECT N'3-12 Toda Gloria Y Majestad', N'.mp3', N'audio', 4872, '20110817 01:18:40.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'3-12 Toda Gloria Y Majestad.mp3' UNION ALL
SELECT N'32 Hungarian Dance No 7 in', N'.mp3', N'audio', 4873, '20110817 01:18:40.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'32 Hungarian Dance No 7 in.mp3' UNION ALL
SELECT N'32 Hungarian Dance No 9 in E mino', N'.mp3', N'audio', 4874, '20110817 01:18:40.977', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'32 Hungarian Dance No 9 in E mino.mp3' UNION ALL
SELECT N'4-01 Este Es el Día', N'.mp3', N'audio', 4875, '20110817 01:18:40.977', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-01 Este Es el Día.mp3' UNION ALL
SELECT N'4-02 Cantad Alegres', N'.mp3', N'audio', 4876, '20110817 01:18:40.977', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-02 Cantad Alegres.mp3' UNION ALL
SELECT N'4-03 Mi Vida Te Daré', N'.mp3', N'audio', 4877, '20110817 01:18:40.977', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-03 Mi Vida Te Daré.mp3' UNION ALL
SELECT N'4-04 El Monte del Señor', N'.mp3', N'audio', 4878, '20110817 01:18:40.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-04 El Monte del Señor.mp3' UNION ALL
SELECT N'4-05 Manda Señor', N'.mp3', N'audio', 4879, '20110817 01:18:40.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-05 Manda Señor.mp3' UNION ALL
SELECT N'4-06 Pan de Vida', N'.mp3', N'audio', 4880, '20110817 01:18:40.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-06 Pan de Vida.mp3' UNION ALL
SELECT N'4-07 A Sus Pies', N'.mp3', N'audio', 4881, '20110817 01:18:40.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-07 A Sus Pies.mp3' UNION ALL
SELECT N'4-08 Prefiero a Cristo', N'.mp3', N'audio', 4882, '20110817 01:18:40.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-08 Prefiero a Cristo.mp3' UNION ALL
SELECT N'4-09 Este Día Especial', N'.mp3', N'audio', 4883, '20110817 01:18:41.007', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-09 Este Día Especial.mp3' UNION ALL
SELECT N'4-10 El Jardín', N'.mp3', N'audio', 4884, '20110817 01:18:41.007', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-10 El Jardín.mp3' UNION ALL
SELECT N'4-11 No Merecía Tanto Amor', N'.mp3', N'audio', 4885, '20110817 01:18:41.023', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-11 No Merecía Tanto Amor.mp3' UNION ALL
SELECT N'4-12 Buscando Refugio', N'.mp3', N'audio', 4886, '20110817 01:18:41.023', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'4-12 Buscando Refugio.mp3' UNION ALL
SELECT N'5-01 Alzad Oh Puertas', N'.mp3', N'audio', 4887, '20110817 01:18:41.023', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-01 Alzad Oh Puertas.mp3' UNION ALL
SELECT N'5-02 Te Daré Lo Mejor', N'.mp3', N'audio', 4888, '20110817 01:18:41.023', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-02 Te Daré Lo Mejor.mp3' UNION ALL
SELECT N'5-03 Tú Nos Creaste', N'.mp3', N'audio', 4889, '20110817 01:18:41.037', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-03 Tú Nos Creaste.mp3' UNION ALL
SELECT N'5-04 No A Nosotros', N'.mp3', N'audio', 4890, '20110817 01:18:41.037', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-04 No A Nosotros.mp3' UNION ALL
SELECT N'5-05 Quiero Entender', N'.mp3', N'audio', 4891, '20110817 01:18:41.037', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-05 Quiero Entender.mp3' UNION ALL
SELECT N'5-06 Con Brazo Fuerte', N'.mp3', N'audio', 4892, '20110817 01:18:41.037', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-06 Con Brazo Fuerte.mp3' UNION ALL
SELECT N'5-08 Te Vengo A Bendecir', N'.mp3', N'audio', 4893, '20110817 01:18:41.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-08 Te Vengo A Bendecir.mp3' UNION ALL
SELECT N'5-09 De Tal Manera', N'.mp3', N'audio', 4894, '20110817 01:18:41.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-09 De Tal Manera.mp3' UNION ALL
SELECT N'5-10 Abre Los Cielos', N'.mp3', N'audio', 4895, '20110817 01:18:41.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-10 Abre Los Cielos.mp3' UNION ALL
SELECT N'5-11 Un Destello De Tu Gloria', N'.mp3', N'audio', 4896, '20110817 01:18:41.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-11 Un Destello De Tu Gloria.mp3' UNION ALL
SELECT N'5-12 Tú Estás Aquí', N'.mp3', N'audio', 4897, '20110817 01:18:41.070', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-12 Tú Estás Aquí.mp3' UNION ALL
SELECT N'5-13 Tu Has Sido Fiel', N'.mp3', N'audio', 4898, '20110817 01:18:41.070', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-13 Tu Has Sido Fiel.mp3' UNION ALL
SELECT N'5-14 Al Estar Ante Ti', N'.mp3', N'audio', 4899, '20110817 01:18:41.070', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'5-14 Al Estar Ante Ti.mp3' UNION ALL
SELECT N'A Dios El Padre', N'.mp3', N'audio', 4900, '20110817 01:18:41.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'A Dios El Padre.mp3' UNION ALL
SELECT N'AAPA', N'.mp3', N'audio', 4901, '20110817 01:18:41.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'AAPA.mp3' UNION ALL
SELECT N'AAZP', N'.mp3', N'audio', 4902, '20110817 01:18:41.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'AAZP.mp3' UNION ALL
SELECT N'AFDO', N'.mp3', N'audio', 4903, '20110817 01:18:41.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'AFDO.mp3' UNION ALL
SELECT N'ALCL', N'.mp3', N'audio', 4904, '20110817 01:18:41.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ALCL.mp3' UNION ALL
SELECT N'All I Need Is You', N'.mp3', N'audio', 4905, '20110817 01:18:41.100', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'All I Need Is You.mp3' UNION ALL
SELECT N'All Star', N'.mp3', N'audio', 4906, '20110817 01:18:41.100', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'All Star.mp3' UNION ALL
SELECT N'All You Need Is Love', N'.mp3', N'audio', 4907, '20110817 01:18:41.100', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'All You Need Is Love.mp3' UNION ALL
SELECT N'Any Way You Want It', N'.mp3', N'audio', 4908, '20110817 01:18:41.100', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Any Way You Want It.mp3' UNION ALL
SELECT N'Anyway You Want it', N'.mp3', N'audio', 4909, '20110817 01:18:41.117', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Anyway You Want it.mp3' UNION ALL
SELECT N'ASAP', N'.mp3', N'audio', 4910, '20110817 01:18:41.117', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ASAP.mp3' UNION ALL
SELECT N'ASPM', N'.mp3', N'audio', 4911, '20110817 01:18:41.117', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ASPM.mp3' UNION ALL
SELECT N'ATLA', N'.mp3', N'audio', 4912, '20110817 01:18:41.117', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ATLA.mp3' UNION ALL
SELECT N'ATRR', N'.mp3', N'audio', 4913, '20110817 01:18:41.130', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ATRR.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 12.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'AUPR', N'.mp3', N'audio', 4914, '20110817 01:18:41.130', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'AUPR.mp3' UNION ALL
SELECT N'AVMI', N'.mp3', N'audio', 4915, '20110817 01:18:41.130', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'AVMI.mp3' UNION ALL
SELECT N'AYVO', N'.mp3', N'audio', 4916, '20110817 01:18:41.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'AYVO.mp3' UNION ALL
SELECT N'BBCT', N'.mp3', N'audio', 4917, '20110817 01:18:41.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BBCT.mp3' UNION ALL
SELECT N'BCBP', N'.mp3', N'audio', 4918, '20110817 01:18:41.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BCBP.mp3' UNION ALL
SELECT N'BCOC', N'.mp3', N'audio', 4919, '20110817 01:18:41.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BCOC.mp3' UNION ALL
SELECT N'Beverly Hills', N'.mp3', N'audio', 4920, '20110817 01:18:41.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Beverly Hills.mp3' UNION ALL
SELECT N'BGFK', N'.mp3', N'audio', 4921, '20110817 01:18:41.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BGFK.mp3' UNION ALL
SELECT N'Billie Jean', N'.mp3', N'audio', 4922, '20110817 01:18:41.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Billie Jean.mp3' UNION ALL
SELECT N'BMHY', N'.mp3', N'audio', 4923, '20110817 01:18:41.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BMHY.mp3' UNION ALL
SELECT N'BQPW', N'.mp3', N'audio', 4924, '20110817 01:18:41.163', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BQPW.mp3' UNION ALL
SELECT N'Bring Me Back To Life', N'.mp3', N'audio', 4925, '20110817 01:18:41.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Bring Me Back To Life.mp3' UNION ALL
SELECT N'BRLX', N'.mp3', N'audio', 4926, '20110817 01:18:41.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BRLX.mp3' UNION ALL
SELECT N'BSFT', N'.mp3', N'audio', 4927, '20110817 01:18:41.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BSFT.mp3' UNION ALL
SELECT N'BTDL', N'.mp3', N'audio', 4928, '20110817 01:18:41.180', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BTDL.mp3' UNION ALL
SELECT N'BUKA', N'.mp3', N'audio', 4929, '20110817 01:18:41.193', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BUKA.mp3' UNION ALL
SELECT N'BXZY', N'.mp3', N'audio', 4930, '20110817 01:18:41.193', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BXZY.mp3' UNION ALL
SELECT N'BYLD', N'.mp3', N'audio', 4931, '20110817 01:18:41.193', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BYLD.mp3' UNION ALL
SELECT N'BZXP', N'.mp3', N'audio', 4932, '20110817 01:18:41.210', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'BZXP.mp3' UNION ALL
SELECT N'Calabria', N'.mp3', N'audio', 4933, '20110817 01:18:41.210', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Calabria.mp3' UNION ALL
SELECT N'Cantare Al Señor Por Siempre', N'.mp3', N'audio', 4934, '20110817 01:18:41.210', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Cantare Al Señor Por Siempre.mp3' UNION ALL
SELECT N'CBUZ', N'.mp3', N'audio', 4935, '20110817 01:18:41.210', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CBUZ.mp3' UNION ALL
SELECT N'Celebrate', N'.mp3', N'audio', 4936, '20110817 01:18:41.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Celebrate.mp3' UNION ALL
SELECT N'CGTU', N'.mp3', N'audio', 4937, '20110817 01:18:41.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CGTU.mp3' UNION ALL
SELECT N'CGXE', N'.mp3', N'audio', 4938, '20110817 01:18:41.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CGXE.mp3' UNION ALL
SELECT N'CJRU', N'.mp3', N'audio', 4939, '20110817 01:18:41.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CJRU.mp3' UNION ALL
SELECT N'CJZL', N'.mp3', N'audio', 4940, '20110817 01:18:41.227', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CJZL.mp3' UNION ALL
SELECT N'CKGO', N'.mp3', N'audio', 4941, '20110817 01:18:41.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CKGO.mp3' UNION ALL
SELECT N'Claire de Lune', N'.mp3', N'audio', 4942, '20110817 01:18:41.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Claire de Lune.mp3' UNION ALL
SELECT N'CLXI', N'.mp3', N'audio', 4943, '20110817 01:18:41.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CLXI.mp3' UNION ALL
SELECT N'Congratulations, I Heart You', N'.mp3', N'audio', 4944, '20110817 01:18:41.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Congratulations, I Heart You.mp3' UNION ALL
SELECT N'CSAX', N'.mp3', N'audio', 4945, '20110817 01:18:41.257', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CSAX.mp3' UNION ALL
SELECT N'CYIN', N'.mp3', N'audio', 4946, '20110817 01:18:41.257', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CYIN.mp3' UNION ALL
SELECT N'CYRJ', N'.mp3', N'audio', 4947, '20110817 01:18:41.257', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'CYRJ.mp3' UNION ALL
SELECT N'Dame Este Monte', N'.mp3', N'audio', 4948, '20110817 01:18:41.273', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Dame Este Monte.mp3' UNION ALL
SELECT N'DBBS', N'.mp3', N'audio', 4949, '20110817 01:18:41.287', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DBBS.mp3' UNION ALL
SELECT N'DBWS', N'.mp3', N'audio', 4950, '20110817 01:18:41.287', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DBWS.mp3' UNION ALL
SELECT N'DDXU', N'.mp3', N'audio', 4951, '20110817 01:18:41.303', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DDXU.mp3' UNION ALL
SELECT N'Dear Hannah', N'.mp3', N'audio', 4952, '20110817 01:18:41.303', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Dear Hannah.mp3' UNION ALL
SELECT N'DHTR', N'.mp3', N'audio', 4953, '20110817 01:18:41.303', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DHTR.mp3' UNION ALL
SELECT N'Digimon The Movie - Digi Rap', N'.mp3', N'audio', 4954, '20110817 01:18:41.320', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Digimon The Movie - Digi Rap.mp3' UNION ALL
SELECT N'Dios Manda Lluvia', N'.mp3', N'audio', 4955, '20110817 01:18:41.320', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Dios Manda Lluvia.mp3' UNION ALL
SELECT N'DLHU', N'.mp3', N'audio', 4956, '20110817 01:18:41.320', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DLHU.mp3' UNION ALL
SELECT N'DNPT', N'.mp3', N'audio', 4957, '20110817 01:18:41.320', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DNPT.mp3' UNION ALL
SELECT N'Don''t You Forget About Me', N'.mp3', N'audio', 4958, '20110817 01:18:41.333', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Don''t You Forget About Me.mp3' UNION ALL
SELECT N'Dont Stop Til You Get Enough', N'.mp3', N'audio', 4959, '20110817 01:18:41.333', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Dont Stop Til You Get Enough.mp3' UNION ALL
SELECT N'DOTA (Remix)', N'.mp3', N'audio', 4960, '20110817 01:18:41.333', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DOTA (Remix).mp3' UNION ALL
SELECT N'DUHI', N'.mp3', N'audio', 4961, '20110817 01:18:41.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DUHI.mp3' UNION ALL
SELECT N'DWKR', N'.mp3', N'audio', 4962, '20110817 01:18:41.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DWKR.mp3' UNION ALL
SELECT N'DWVU', N'.mp3', N'audio', 4963, '20110817 01:18:41.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DWVU.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 13.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'DYSI', N'.mp3', N'audio', 4964, '20110817 01:18:41.367', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DYSI.mp3' UNION ALL
SELECT N'DZQC', N'.mp3', N'audio', 4965, '20110817 01:18:41.367', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'DZQC.mp3' UNION ALL
SELECT N'ECSW', N'.mp3', N'audio', 4966, '20110817 01:18:41.367', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ECSW.mp3' UNION ALL
SELECT N'EFOV', N'.mp3', N'audio', 4967, '20110817 01:18:41.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EFOV.mp3' UNION ALL
SELECT N'EGAV', N'.mp3', N'audio', 4968, '20110817 01:18:41.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EGAV.mp3' UNION ALL
SELECT N'EGLL', N'.mp3', N'audio', 4969, '20110817 01:18:41.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EGLL.mp3' UNION ALL
SELECT N'EGSZ', N'.mp3', N'audio', 4970, '20110817 01:18:41.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EGSZ.mp3' UNION ALL
SELECT N'EJAJ', N'.mp3', N'audio', 4971, '20110817 01:18:41.397', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EJAJ.mp3' UNION ALL
SELECT N'ElectroJack', N'.mp3', N'audio', 4972, '20110817 01:18:41.397', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ElectroJack.mp3' UNION ALL
SELECT N'EMII', N'.mp3', N'audio', 4973, '20110817 01:18:41.397', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EMII.mp3' UNION ALL
SELECT N'ENBM', N'.mp3', N'audio', 4974, '20110817 01:18:41.397', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ENBM.mp3' UNION ALL
SELECT N'ERGW', N'.mp3', N'audio', 4975, '20110817 01:18:41.413', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ERGW.mp3' UNION ALL
SELECT N'ETMV', N'.mp3', N'audio', 4976, '20110817 01:18:41.413', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ETMV.mp3' UNION ALL
SELECT N'Every Morning', N'.mp3', N'audio', 4977, '20110817 01:18:41.413', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Every Morning.mp3' UNION ALL
SELECT N'Everything', N'.mp3', N'audio', 4978, '20110817 01:18:41.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Everything.mp3' UNION ALL
SELECT N'EYAW', N'.mp3', N'audio', 4979, '20110817 01:18:41.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EYAW.mp3' UNION ALL
SELECT N'Eye To Eye', N'.mp3', N'audio', 4980, '20110817 01:18:41.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Eye To Eye.mp3' UNION ALL
SELECT N'EYSP', N'.mp3', N'audio', 4981, '20110817 01:18:41.443', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'EYSP.mp3' UNION ALL
SELECT N'Face Down', N'.mp3', N'audio', 4982, '20110817 01:18:41.443', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Face Down.mp3' UNION ALL
SELECT N'FECE', N'.mp3', N'audio', 4983, '20110817 01:18:41.443', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'FECE.mp3' UNION ALL
SELECT N'FHPP', N'.mp3', N'audio', 4984, '20110817 01:18:41.460', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'FHPP.mp3' UNION ALL
SELECT N'FJFL', N'.mp3', N'audio', 4985, '20110817 01:18:41.460', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'FJFL.mp3' UNION ALL
SELECT N'FQPU', N'.mp3', N'audio', 4986, '20110817 01:18:41.460', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'FQPU.mp3' UNION ALL
SELECT N'FULW', N'.mp3', N'audio', 4987, '20110817 01:18:41.460', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'FULW.mp3' UNION ALL
SELECT N'Fur Elise', N'.mp3', N'audio', 4988, '20110817 01:18:41.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Fur Elise.mp3' UNION ALL
SELECT N'GAVA', N'.mp3', N'audio', 4989, '20110817 01:18:41.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GAVA.mp3' UNION ALL
SELECT N'George answering machine Sound Clip', N'.mp3', N'audio', 4990, '20110817 01:18:41.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'George answering machine Sound Clip.mp3' UNION ALL
SELECT N'George Costanza Voicemail blank', N'.mp3', N'audio', 4991, '20110817 01:18:41.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'George Costanza Voicemail blank.mp3' UNION ALL
SELECT N'Get Your Back Off The Wall', N'.mp3', N'audio', 4992, '20110817 01:18:41.490', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Get Your Back Off The Wall.mp3' UNION ALL
SELECT N'GIWE', N'.mp3', N'audio', 4993, '20110817 01:18:41.490', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GIWE.mp3' UNION ALL
SELECT N'GJCA', N'.mp3', N'audio', 4994, '20110817 01:18:41.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GJCA.mp3' UNION ALL
SELECT N'GJQC', N'.mp3', N'audio', 4995, '20110817 01:18:41.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GJQC.mp3' UNION ALL
SELECT N'GKBB', N'.mp3', N'audio', 4996, '20110817 01:18:41.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GKBB.mp3' UNION ALL
SELECT N'GNAX', N'.mp3', N'audio', 4997, '20110817 01:18:41.507', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GNAX.mp3' UNION ALL
SELECT N'GNNF', N'.mp3', N'audio', 4998, '20110817 01:18:41.520', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GNNF.mp3' UNION ALL
SELECT N'God Blessed The Broken Road', N'.mp3', N'audio', 4999, '20110817 01:18:41.520', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'God Blessed The Broken Road.mp3' UNION ALL
SELECT N'God Of This City', N'.mp3', N'audio', 5000, '20110817 01:18:41.520', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'God Of This City.mp3' UNION ALL
SELECT N'GOZG', N'.mp3', N'audio', 5001, '20110817 01:18:41.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GOZG.mp3' UNION ALL
SELECT N'GQLK', N'.mp3', N'audio', 5002, '20110817 01:18:41.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GQLK.mp3' UNION ALL
SELECT N'GRXQ', N'.mp3', N'audio', 5003, '20110817 01:18:41.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GRXQ.mp3' UNION ALL
SELECT N'GWFX', N'.mp3', N'audio', 5004, '20110817 01:18:41.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GWFX.mp3' UNION ALL
SELECT N'GWHP', N'.mp3', N'audio', 5005, '20110817 01:18:41.553', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GWHP.mp3' UNION ALL
SELECT N'GXRP', N'.mp3', N'audio', 5006, '20110817 01:18:41.553', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GXRP.mp3' UNION ALL
SELECT N'GZDY', N'.mp3', N'audio', 5007, '20110817 01:18:41.553', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'GZDY.mp3' UNION ALL
SELECT N'Haven''t Met You Yet', N'.mp3', N'audio', 5008, '20110817 01:18:41.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Haven''t Met You Yet.mp3' UNION ALL
SELECT N'HAWF', N'.mp3', N'audio', 5009, '20110817 01:18:41.570', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HAWF.mp3' UNION ALL
SELECT N'Heart of Stone', N'.mp3', N'audio', 5010, '20110817 01:18:41.583', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Heart of Stone.mp3' UNION ALL
SELECT N'HEHA', N'.mp3', N'audio', 5011, '20110817 01:18:41.583', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HEHA.mp3' UNION ALL
SELECT N'Hey soul Sister', N'.mp3', N'audio', 5012, '20110817 01:18:41.583', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Hey soul Sister.mp3' UNION ALL
SELECT N'HJML', N'.mp3', N'audio', 5013, '20110817 01:18:41.583', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HJML.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 14.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'HMRI', N'.mp3', N'audio', 5014, '20110817 01:18:41.600', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HMRI.mp3' UNION ALL
SELECT N'Holiday Road (From National Lampoon''', N'.mp3', N'audio', 5015, '20110817 01:18:41.600', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Holiday Road (From National Lampoon''.mp3' UNION ALL
SELECT N'Home', N'.mp3', N'audio', 5016, '20110817 01:18:41.600', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Home.mp3' UNION ALL
SELECT N'Hostages', N'.mp3', N'audio', 5017, '20110817 01:18:41.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Hostages.mp3' UNION ALL
SELECT N'How Can You Mend A Broken Heart', N'.mp3', N'audio', 5018, '20110817 01:18:41.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'How Can You Mend A Broken Heart.mp3' UNION ALL
SELECT N'Hoy', N'.mp3', N'audio', 5019, '20110817 01:18:41.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Hoy.mp3' UNION ALL
SELECT N'HPRT', N'.mp3', N'audio', 5020, '20110817 01:18:41.617', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HPRT.mp3' UNION ALL
SELECT N'HWGR', N'.mp3', N'audio', 5021, '20110817 01:18:41.630', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HWGR.mp3' UNION ALL
SELECT N'HWYH', N'.mp3', N'audio', 5022, '20110817 01:18:41.630', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HWYH.mp3' UNION ALL
SELECT N'HYIS', N'.mp3', N'audio', 5023, '20110817 01:18:41.630', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'HYIS.mp3' UNION ALL
SELECT N'I Get Knocked Down', N'.mp3', N'audio', 5024, '20110817 01:18:41.647', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'I Get Knocked Down.mp3' UNION ALL
SELECT N'I Get On My Knees', N'.mp3', N'audio', 5025, '20110817 01:18:41.647', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'I Get On My Knees.mp3' UNION ALL
SELECT N'I Remember (ft. Kaskade)', N'.mp3', N'audio', 5026, '20110817 01:18:41.647', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'I Remember (ft. Kaskade).mp3' UNION ALL
SELECT N'I''m Afraid Of Losing You', N'.mp3', N'audio', 5027, '20110817 01:18:41.663', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'I''m Afraid Of Losing You.mp3' UNION ALL
SELECT N'ICYR', N'.mp3', N'audio', 5028, '20110817 01:18:41.663', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ICYR.mp3' UNION ALL
SELECT N'In My Dreams (Alon.M Electro Remix)', N'.mp3', N'audio', 5029, '20110817 01:18:41.663', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'In My Dreams (Alon.M Electro Remix).mp3' UNION ALL
SELECT N'In your face', N'.mp3', N'audio', 5030, '20110817 01:18:41.663', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'In your face.mp3' UNION ALL
SELECT N'IOKY', N'.mp3', N'audio', 5031, '20110817 01:18:41.677', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'IOKY.mp3' UNION ALL
SELECT N'Is It Progression If A Cannibal Uses', N'.mp3', N'audio', 5032, '20110817 01:18:41.677', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Is It Progression If A Cannibal Uses.mp3' UNION ALL
SELECT N'ITRT', N'.mp3', N'audio', 5033, '20110817 01:18:41.677', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ITRT.mp3' UNION ALL
SELECT N'IVYP', N'.mp3', N'audio', 5034, '20110817 01:18:41.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'IVYP.mp3' UNION ALL
SELECT N'Jamie All Over', N'.mp3', N'audio', 5035, '20110817 01:18:41.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Jamie All Over.mp3' UNION ALL
SELECT N'JCLE', N'.mp3', N'audio', 5036, '20110817 01:18:41.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JCLE.mp3' UNION ALL
SELECT N'JGOE', N'.mp3', N'audio', 5037, '20110817 01:18:41.693', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JGOE.mp3' UNION ALL
SELECT N'JJTZ', N'.mp3', N'audio', 5038, '20110817 01:18:41.710', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JJTZ.mp3' UNION ALL
SELECT N'John orr the arsonist', N'.mp3', N'audio', 5039, '20110817 01:18:41.710', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'John orr the arsonist.mp3' UNION ALL
SELECT N'JOPH', N'.mp3', N'audio', 5040, '20110817 01:18:41.710', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JOPH.mp3' UNION ALL
SELECT N'JOTK', N'.mp3', N'audio', 5041, '20110817 01:18:41.723', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JOTK.mp3' UNION ALL
SELECT N'JQHC', N'.mp3', N'audio', 5042, '20110817 01:18:41.723', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JQHC.mp3' UNION ALL
SELECT N'JRXD', N'.mp3', N'audio', 5043, '20110817 01:18:41.723', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JRXD.mp3' UNION ALL
SELECT N'JSOI', N'.mp3', N'audio', 5044, '20110817 01:18:41.723', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JSOI.mp3' UNION ALL
SELECT N'JUEG', N'.mp3', N'audio', 5045, '20110817 01:18:41.740', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JUEG.mp3' UNION ALL
SELECT N'JUEX', N'.mp3', N'audio', 5046, '20110817 01:18:41.740', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'JUEX.mp3' UNION ALL
SELECT N'KGTQ', N'.mp3', N'audio', 5047, '20110817 01:18:41.740', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KGTQ.mp3' UNION ALL
SELECT N'KHAO', N'.mp3', N'audio', 5048, '20110817 01:18:41.740', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KHAO.mp3' UNION ALL
SELECT N'kick push(1)', N'.mp3', N'audio', 5049, '20110817 01:18:41.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'kick push(1).mp3' UNION ALL
SELECT N'Killer (Afrojack Remix)', N'.mp3', N'audio', 5050, '20110817 01:18:41.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Killer (Afrojack Remix).mp3' UNION ALL
SELECT N'KIMX', N'.mp3', N'audio', 5051, '20110817 01:18:41.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KIMX.mp3' UNION ALL
SELECT N'King of Rock', N'.mp3', N'audio', 5052, '20110817 01:18:41.757', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'King of Rock.mp3' UNION ALL
SELECT N'KMHC', N'.mp3', N'audio', 5053, '20110817 01:18:41.770', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KMHC.mp3' UNION ALL
SELECT N'KMVJ', N'.mp3', N'audio', 5054, '20110817 01:18:41.770', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KMVJ.mp3' UNION ALL
SELECT N'KPAF', N'.mp3', N'audio', 5055, '20110817 01:18:41.770', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KPAF.mp3' UNION ALL
SELECT N'KRDW', N'.mp3', N'audio', 5056, '20110817 01:18:41.770', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KRDW.mp3' UNION ALL
SELECT N'KUAR', N'.mp3', N'audio', 5057, '20110817 01:18:41.787', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KUAR.mp3' UNION ALL
SELECT N'KVPT', N'.mp3', N'audio', 5058, '20110817 01:18:41.787', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KVPT.mp3' UNION ALL
SELECT N'KWVJ', N'.mp3', N'audio', 5059, '20110817 01:18:41.787', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KWVJ.mp3' UNION ALL
SELECT N'KYPW', N'.mp3', N'audio', 5060, '20110817 01:18:41.787', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KYPW.mp3' UNION ALL
SELECT N'KZNC', N'.mp3', N'audio', 5061, '20110817 01:18:41.803', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'KZNC.mp3' UNION ALL
SELECT N'LAEA', N'.mp3', N'audio', 5062, '20110817 01:18:41.817', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LAEA.mp3' UNION ALL
SELECT N'LAKH', N'.mp3', N'audio', 5063, '20110817 01:18:41.817', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LAKH.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 15.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'LCHQ', N'.mp3', N'audio', 5064, '20110817 01:18:41.817', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LCHQ.mp3' UNION ALL
SELECT N'LFIP', N'.mp3', N'audio', 5065, '20110817 01:18:41.833', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LFIP.mp3' UNION ALL
SELECT N'LISC', N'.mp3', N'audio', 5066, '20110817 01:18:41.833', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LISC.mp3' UNION ALL
SELECT N'Llegar A Ti', N'.mp3', N'audio', 5067, '20110817 01:18:41.833', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Llegar A Ti.mp3' UNION ALL
SELECT N'Llevame Al Lugar Altisimo', N'.mp3', N'audio', 5068, '20110817 01:18:41.850', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Llevame Al Lugar Altisimo.mp3' UNION ALL
SELECT N'LMLO', N'.mp3', N'audio', 5069, '20110817 01:18:41.850', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LMLO.mp3' UNION ALL
SELECT N'Louder Than Boom', N'.mp3', N'audio', 5070, '20110817 01:18:41.850', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Louder Than Boom.mp3' UNION ALL
SELECT N'LQAO', N'.mp3', N'audio', 5071, '20110817 01:18:41.863', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LQAO.mp3' UNION ALL
SELECT N'LQVB', N'.mp3', N'audio', 5072, '20110817 01:18:41.863', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LQVB.mp3' UNION ALL
SELECT N'LTKB', N'.mp3', N'audio', 5073, '20110817 01:18:41.863', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LTKB.mp3' UNION ALL
SELECT N'LTSP', N'.mp3', N'audio', 5074, '20110817 01:18:41.880', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LTSP.mp3' UNION ALL
SELECT N'LUJH', N'.mp3', N'audio', 5075, '20110817 01:18:41.880', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LUJH.mp3' UNION ALL
SELECT N'LVOU', N'.mp3', N'audio', 5076, '20110817 01:18:41.880', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LVOU.mp3' UNION ALL
SELECT N'LXPA', N'.mp3', N'audio', 5077, '20110817 01:18:41.880', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LXPA.mp3' UNION ALL
SELECT N'LXZP', N'.mp3', N'audio', 5078, '20110817 01:18:41.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'LXZP.mp3' UNION ALL
SELECT N'Make A Change', N'.mp3', N'audio', 5079, '20110817 01:18:41.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Make A Change.mp3' UNION ALL
SELECT N'Makes Me Wonder', N'.mp3', N'audio', 5080, '20110817 01:18:41.897', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Makes Me Wonder.mp3' UNION ALL
SELECT N'Mas Que un Anhelo', N'.mp3', N'audio', 5081, '20110817 01:18:41.910', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Mas Que un Anhelo.mp3' UNION ALL
SELECT N'MAYW', N'.mp3', N'audio', 5082, '20110817 01:18:41.910', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MAYW.mp3' UNION ALL
SELECT N'MFNP', N'.mp3', N'audio', 5083, '20110817 01:18:41.910', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MFNP.mp3' UNION ALL
SELECT N'Mi Deleite Esta En Ti', N'.mp3', N'audio', 5084, '20110817 01:18:41.927', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Mi Deleite Esta En Ti.mp3' UNION ALL
SELECT N'MKBV', N'.mp3', N'audio', 5085, '20110817 01:18:41.927', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MKBV.mp3' UNION ALL
SELECT N'MMKJ', N'.mp3', N'audio', 5086, '20110817 01:18:41.927', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MMKJ.mp3' UNION ALL
SELECT N'MNHW', N'.mp3', N'audio', 5087, '20110817 01:18:41.927', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MNHW.mp3' UNION ALL
SELECT N'MNPR', N'.mp3', N'audio', 5088, '20110817 01:18:41.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MNPR.mp3' UNION ALL
SELECT N'MVXW', N'.mp3', N'audio', 5089, '20110817 01:18:41.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MVXW.mp3' UNION ALL
SELECT N'MXGO', N'.mp3', N'audio', 5090, '20110817 01:18:41.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MXGO.mp3' UNION ALL
SELECT N'MXIT', N'.mp3', N'audio', 5091, '20110817 01:18:41.943', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MXIT.mp3' UNION ALL
SELECT N'My Best Friend', N'.mp3', N'audio', 5092, '20110817 01:18:41.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'My Best Friend.mp3' UNION ALL
SELECT N'MYLI', N'.mp3', N'audio', 5093, '20110817 01:18:41.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'MYLI.mp3' UNION ALL
SELECT N'NALX', N'.mp3', N'audio', 5094, '20110817 01:18:41.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NALX.mp3' UNION ALL
SELECT N'NCQC', N'.mp3', N'audio', 5095, '20110817 01:18:41.960', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NCQC.mp3' UNION ALL
SELECT N'NCRG', N'.mp3', N'audio', 5096, '20110817 01:18:41.973', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NCRG.mp3' UNION ALL
SELECT N'NEQV', N'.mp3', N'audio', 5097, '20110817 01:18:41.973', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NEQV.mp3' UNION ALL
SELECT N'Never say Never', N'.mp3', N'audio', 5098, '20110817 01:18:41.973', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Never say Never.mp3' UNION ALL
SELECT N'New Divide', N'.mp3', N'audio', 5099, '20110817 01:18:41.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'New Divide.mp3' UNION ALL
SELECT N'NFDE', N'.mp3', N'audio', 5100, '20110817 01:18:41.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NFDE.mp3' UNION ALL
SELECT N'NKNC', N'.mp3', N'audio', 5101, '20110817 01:18:41.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NKNC.mp3' UNION ALL
SELECT N'NTSN', N'.mp3', N'audio', 5102, '20110817 01:18:41.990', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NTSN.mp3' UNION ALL
SELECT N'NVSK', N'.mp3', N'audio', 5103, '20110817 01:18:42.007', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NVSK.mp3' UNION ALL
SELECT N'NWLU', N'.mp3', N'audio', 5104, '20110817 01:18:42.007', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NWLU.mp3' UNION ALL
SELECT N'NWYM', N'.mp3', N'audio', 5105, '20110817 01:18:42.007', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'NWYM.mp3' UNION ALL
SELECT N'OBNL', N'.mp3', N'audio', 5106, '20110817 01:18:42.007', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'OBNL.mp3' UNION ALL
SELECT N'OFED', N'.mp3', N'audio', 5107, '20110817 01:18:42.020', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'OFED.mp3' UNION ALL
SELECT N'OLAS', N'.mp3', N'audio', 5108, '20110817 01:18:42.020', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'OLAS.mp3' UNION ALL
SELECT N'One More Time', N'.mp3', N'audio', 5109, '20110817 01:18:42.020', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'One More Time.mp3' UNION ALL
SELECT N'OTHI', N'.mp3', N'audio', 5110, '20110817 01:18:42.020', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'OTHI.mp3' UNION ALL
SELECT N'OWBA', N'.mp3', N'audio', 5111, '20110817 01:18:42.037', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'OWBA.mp3' UNION ALL
SELECT N'OYQJ', N'.mp3', N'audio', 5112, '20110817 01:18:42.037', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'OYQJ.mp3' UNION ALL
SELECT N'Party People', N'.mp3', N'audio', 5113, '20110817 01:18:42.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Party People.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 16.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'PBJV', N'.mp3', N'audio', 5114, '20110817 01:18:42.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'PBJV.mp3' UNION ALL
SELECT N'PDCU', N'.mp3', N'audio', 5115, '20110817 01:18:42.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'PDCU.mp3' UNION ALL
SELECT N'Pista Quiero Agradecerte', N'.mp3', N'audio', 5116, '20110817 01:18:42.053', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Pista Quiero Agradecerte.mp3' UNION ALL
SELECT N'Pocket Full Of Sunshine', N'.mp3', N'audio', 5117, '20110817 01:18:42.067', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Pocket Full Of Sunshine.mp3' UNION ALL
SELECT N'Polkadots (Original Mix)', N'.mp3', N'audio', 5118, '20110817 01:18:42.067', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Polkadots (Original Mix).mp3' UNION ALL
SELECT N'PSGT', N'.mp3', N'audio', 5119, '20110817 01:18:42.067', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'PSGT.mp3' UNION ALL
SELECT N'PUBO', N'.mp3', N'audio', 5120, '20110817 01:18:42.067', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'PUBO.mp3' UNION ALL
SELECT N'Purifícame', N'.mp3', N'audio', 5121, '20110817 01:18:42.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Purifícame.mp3' UNION ALL
SELECT N'PYUM', N'.mp3', N'audio', 5122, '20110817 01:18:42.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'PYUM.mp3' UNION ALL
SELECT N'QCEC', N'.mp3', N'audio', 5123, '20110817 01:18:42.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'QCEC.mp3' UNION ALL
SELECT N'QKYI', N'.mp3', N'audio', 5124, '20110817 01:18:42.083', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'QKYI.mp3' UNION ALL
SELECT N'Quisiera Ser', N'.mp3', N'audio', 5125, '20110817 01:18:42.100', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Quisiera Ser.mp3' UNION ALL
SELECT N'QYZF', N'.mp3', N'audio', 5126, '20110817 01:18:42.100', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'QYZF.mp3' UNION ALL
SELECT N'RAAC', N'.mp3', N'audio', 5127, '20110817 01:18:42.100', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RAAC.mp3' UNION ALL
SELECT N'Rave Ecstasy', N'.mp3', N'audio', 5128, '20110817 01:18:42.113', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Rave Ecstasy.mp3' UNION ALL
SELECT N'Rawk First', N'.mp3', N'audio', 5129, '20110817 01:18:42.113', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Rawk First.mp3' UNION ALL
SELECT N'RAWL', N'.mp3', N'audio', 5130, '20110817 01:18:42.113', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RAWL.mp3' UNION ALL
SELECT N'RELZ', N'.mp3', N'audio', 5131, '20110817 01:18:42.113', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RELZ.mp3' UNION ALL
SELECT N'Resucito!', N'.mp3', N'audio', 5132, '20110817 01:18:42.130', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Resucito!.mp3' UNION ALL
SELECT N'RFEU', N'.mp3', N'audio', 5133, '20110817 01:18:42.130', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RFEU.mp3' UNION ALL
SELECT N'Right Where You Want Me To Be', N'.mp3', N'audio', 5134, '20110817 01:18:42.130', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Right Where You Want Me To Be.mp3' UNION ALL
SELECT N'RJII', N'.mp3', N'audio', 5135, '20110817 01:18:42.130', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RJII.mp3' UNION ALL
SELECT N'RJLG', N'.mp3', N'audio', 5136, '20110817 01:18:42.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RJLG.mp3' UNION ALL
SELECT N'RLZF', N'.mp3', N'audio', 5137, '20110817 01:18:42.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RLZF.mp3' UNION ALL
SELECT N'robot rock', N'.mp3', N'audio', 5138, '20110817 01:18:42.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'robot rock.mp3' UNION ALL
SELECT N'Rock With You', N'.mp3', N'audio', 5139, '20110817 01:18:42.147', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Rock With You.mp3' UNION ALL
SELECT N'RUNS', N'.mp3', N'audio', 5140, '20110817 01:18:42.160', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RUNS.mp3' UNION ALL
SELECT N'RXUF', N'.mp3', N'audio', 5141, '20110817 01:18:42.160', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RXUF.mp3' UNION ALL
SELECT N'RXVB', N'.mp3', N'audio', 5142, '20110817 01:18:42.160', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'RXVB.mp3' UNION ALL
SELECT N'Secrets', N'.mp3', N'audio', 5143, '20110817 01:18:42.177', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Secrets.mp3' UNION ALL
SELECT N'SEJH', N'.mp3', N'audio', 5144, '20110817 01:18:42.177', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'SEJH.mp3' UNION ALL
SELECT N'September', N'.mp3', N'audio', 5145, '20110817 01:18:42.177', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'September.mp3' UNION ALL
SELECT N'Seventeen Forever', N'.mp3', N'audio', 5146, '20110817 01:18:42.177', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Seventeen Forever.mp3' UNION ALL
SELECT N'Sexual Man Chocolate', N'.mp3', N'audio', 5147, '20110817 01:18:42.193', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Sexual Man Chocolate.mp3' UNION ALL
SELECT N'Since U Been Gone', N'.mp3', N'audio', 5148, '20110817 01:18:42.193', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Since U Been Gone.mp3' UNION ALL
SELECT N'STEA', N'.mp3', N'audio', 5149, '20110817 01:18:42.193', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'STEA.mp3' UNION ALL
SELECT N'Strawberry Avalanche', N'.mp3', N'audio', 5150, '20110817 01:18:42.193', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Strawberry Avalanche.mp3' UNION ALL
SELECT N'Sueño de Morir', N'.mp3', N'audio', 5151, '20110817 01:18:42.207', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Sueño de Morir.mp3' UNION ALL
SELECT N'SVHO', N'.mp3', N'audio', 5152, '20110817 01:18:42.207', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'SVHO.mp3' UNION ALL
SELECT N'Sweet Home Alabama', N'.mp3', N'audio', 5153, '20110817 01:18:42.207', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Sweet Home Alabama.mp3' UNION ALL
SELECT N'SWVC', N'.mp3', N'audio', 5154, '20110817 01:18:42.223', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'SWVC.mp3' UNION ALL
SELECT N'TBON', N'.mp3', N'audio', 5155, '20110817 01:18:42.223', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TBON.mp3' UNION ALL
SELECT N'Tears Don''t Fall', N'.mp3', N'audio', 5156, '20110817 01:18:42.223', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Tears Don''t Fall.mp3' UNION ALL
SELECT N'TEID', N'.mp3', N'audio', 5157, '20110817 01:18:42.223', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TEID.mp3' UNION ALL
SELECT N'That''s What You Get', N'.mp3', N'audio', 5158, '20110817 01:18:42.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'That''s What You Get.mp3' UNION ALL
SELECT N'The Boy Who Could Fly', N'.mp3', N'audio', 5159, '20110817 01:18:42.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'The Boy Who Could Fly.mp3' UNION ALL
SELECT N'The Lover and The Liar', N'.mp3', N'audio', 5160, '20110817 01:18:42.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'The Lover and The Liar.mp3' UNION ALL
SELECT N'The Thespian', N'.mp3', N'audio', 5161, '20110817 01:18:42.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'The Thespian.mp3' UNION ALL
SELECT N'The Way You Make Me Feel', N'.mp3', N'audio', 5162, '20110817 01:18:42.240', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'The Way You Make Me Feel.mp3' UNION ALL
SELECT N'There''s No Penguins In Alaska', N'.mp3', N'audio', 5163, '20110817 01:18:42.253', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'There''s No Penguins In Alaska.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 17.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'Thriler', N'.mp3', N'audio', 5164, '20110817 01:18:42.253', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Thriler.mp3' UNION ALL
SELECT N'TIUH', N'.mp3', N'audio', 5165, '20110817 01:18:42.253', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TIUH.mp3' UNION ALL
SELECT N'TLKD', N'.mp3', N'audio', 5166, '20110817 01:18:42.253', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TLKD.mp3' UNION ALL
SELECT N'TPYT', N'.mp3', N'audio', 5167, '20110817 01:18:42.270', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TPYT.mp3' UNION ALL
SELECT N'traffic', N'.mp3', N'audio', 5168, '20110817 01:18:42.270', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'traffic.mp3' UNION ALL
SELECT N'TRCQ', N'.mp3', N'audio', 5169, '20110817 01:18:42.270', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TRCQ.mp3' UNION ALL
SELECT N'TRPC', N'.mp3', N'audio', 5170, '20110817 01:18:42.287', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TRPC.mp3' UNION ALL
SELECT N'TTHC', N'.mp3', N'audio', 5171, '20110817 01:18:42.287', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TTHC.mp3' UNION ALL
SELECT N'Tu Misericordia', N'.mp3', N'audio', 5172, '20110817 01:18:42.287', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Tu Misericordia.mp3' UNION ALL
SELECT N'TVGB', N'.mp3', N'audio', 5173, '20110817 01:18:42.287', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TVGB.mp3' UNION ALL
SELECT N'TWNE', N'.mp3', N'audio', 5174, '20110817 01:18:42.300', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'TWNE.mp3' UNION ALL
SELECT N'UFZA', N'.mp3', N'audio', 5175, '20110817 01:18:42.300', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'UFZA.mp3' UNION ALL
SELECT N'UGMN', N'.mp3', N'audio', 5176, '20110817 01:18:42.300', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'UGMN.mp3' UNION ALL
SELECT N'UMRB', N'.mp3', N'audio', 5177, '20110817 01:18:42.300', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'UMRB.mp3' UNION ALL
SELECT N'Un Lugar Celestial', N'.mp3', N'audio', 5178, '20110817 01:18:42.317', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Un Lugar Celestial.mp3' UNION ALL
SELECT N'USDE', N'.mp3', N'audio', 5179, '20110817 01:18:42.317', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'USDE.mp3' UNION ALL
SELECT N'USMQ', N'.mp3', N'audio', 5180, '20110817 01:18:42.317', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'USMQ.mp3' UNION ALL
SELECT N'UUXM', N'.mp3', N'audio', 5181, '20110817 01:18:42.317', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'UUXM.mp3' UNION ALL
SELECT N'UWDY', N'.mp3', N'audio', 5182, '20110817 01:18:42.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'UWDY.mp3' UNION ALL
SELECT N'UWGZ', N'.mp3', N'audio', 5183, '20110817 01:18:42.350', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'UWGZ.mp3' UNION ALL
SELECT N'VACR', N'.mp3', N'audio', 5184, '20110817 01:18:42.363', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VACR.mp3' UNION ALL
SELECT N'VAFD', N'.mp3', N'audio', 5185, '20110817 01:18:42.363', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VAFD.mp3' UNION ALL
SELECT N'VGIG', N'.mp3', N'audio', 5186, '20110817 01:18:42.363', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VGIG.mp3' UNION ALL
SELECT N'VHWA', N'.mp3', N'audio', 5187, '20110817 01:18:42.363', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VHWA.mp3' UNION ALL
SELECT N'Vietnam', N'.mp3', N'audio', 5188, '20110817 01:18:42.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Vietnam.mp3' UNION ALL
SELECT N'VIUA', N'.mp3', N'audio', 5189, '20110817 01:18:42.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VIUA.mp3' UNION ALL
SELECT N'VJHN', N'.mp3', N'audio', 5190, '20110817 01:18:42.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VJHN.mp3' UNION ALL
SELECT N'VKYF', N'.mp3', N'audio', 5191, '20110817 01:18:42.380', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VKYF.mp3' UNION ALL
SELECT N'VSBU', N'.mp3', N'audio', 5192, '20110817 01:18:42.397', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VSBU.mp3' UNION ALL
SELECT N'VSIM', N'.mp3', N'audio', 5193, '20110817 01:18:42.397', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VSIM.mp3' UNION ALL
SELECT N'VUJS', N'.mp3', N'audio', 5194, '20110817 01:18:42.397', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VUJS.mp3' UNION ALL
SELECT N'VUNB', N'.mp3', N'audio', 5195, '20110817 01:18:42.410', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VUNB.mp3' UNION ALL
SELECT N'VZOM', N'.mp3', N'audio', 5196, '20110817 01:18:42.410', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'VZOM.mp3' UNION ALL
SELECT N'Waka Waka (Time For Africa)', N'.mp3', N'audio', 5197, '20110817 01:18:42.410', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Waka Waka (Time For Africa).mp3' UNION ALL
SELECT N'WEAU', N'.mp3', N'audio', 5198, '20110817 01:18:42.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WEAU.mp3' UNION ALL
SELECT N'WGVH', N'.mp3', N'audio', 5199, '20110817 01:18:42.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WGVH.mp3' UNION ALL
SELECT N'WGZM', N'.mp3', N'audio', 5200, '20110817 01:18:42.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WGZM.mp3' UNION ALL
SELECT N'Winans Phase', N'.mp3', N'audio', 5201, '20110817 01:18:42.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Winans Phase.mp3' UNION ALL
SELECT N'WIRX', N'.mp3', N'audio', 5202, '20110817 01:18:42.427', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WIRX.mp3' UNION ALL
SELECT N'WNME', N'.mp3', N'audio', 5203, '20110817 01:18:42.443', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WNME.mp3' UNION ALL
SELECT N'WNWS', N'.mp3', N'audio', 5204, '20110817 01:18:42.443', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WNWS.mp3' UNION ALL
SELECT N'WOBM', N'.mp3', N'audio', 5205, '20110817 01:18:42.443', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WOBM.mp3' UNION ALL
SELECT N'Wonderwall', N'.mp3', N'audio', 5206, '20110817 01:18:42.443', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Wonderwall.mp3' UNION ALL
SELECT N'Wordplay', N'.mp3', N'audio', 5207, '20110817 01:18:42.457', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Wordplay.mp3' UNION ALL
SELECT N'WRRS', N'.mp3', N'audio', 5208, '20110817 01:18:42.457', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WRRS.mp3' UNION ALL
SELECT N'WSJM', N'.mp3', N'audio', 5209, '20110817 01:18:42.457', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WSJM.mp3' UNION ALL
SELECT N'WXWK', N'.mp3', N'audio', 5210, '20110817 01:18:42.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'WXWK.mp3' UNION ALL
SELECT N'XIAF', N'.mp3', N'audio', 5211, '20110817 01:18:42.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XIAF.mp3' UNION ALL
SELECT N'XIOU', N'.mp3', N'audio', 5212, '20110817 01:18:42.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XIOU.mp3' UNION ALL
SELECT N'XJJU', N'.mp3', N'audio', 5213, '20110817 01:18:42.473', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XJJU.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 18.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[MobileMedia]([mobMediaTitle], [mobMediaFileExt], [mobMediaType], [mobId], [mobDateAdded], [mobIsViewable], [mobArtist], [mobDescription], [mobGenre], [mobAlbum], [mobPosterImageUrl], [mobLastPlayedDate], [mobRating], [mobFileName])
SELECT N'XMAI', N'.mp3', N'audio', 5214, '20110817 01:18:42.490', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XMAI.mp3' UNION ALL
SELECT N'XSAR', N'.mp3', N'audio', 5215, '20110817 01:18:42.490', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XSAR.mp3' UNION ALL
SELECT N'XUCZ', N'.mp3', N'audio', 5216, '20110817 01:18:42.490', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XUCZ.mp3' UNION ALL
SELECT N'XULU', N'.mp3', N'audio', 5217, '20110817 01:18:42.503', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XULU.mp3' UNION ALL
SELECT N'XWAB', N'.mp3', N'audio', 5218, '20110817 01:18:42.503', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'XWAB.mp3' UNION ALL
SELECT N'YARP', N'.mp3', N'audio', 5219, '20110817 01:18:42.503', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YARP.mp3' UNION ALL
SELECT N'YDGO', N'.mp3', N'audio', 5220, '20110817 01:18:42.503', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YDGO.mp3' UNION ALL
SELECT N'YIKQ', N'.mp3', N'audio', 5221, '20110817 01:18:42.503', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YIKQ.mp3' UNION ALL
SELECT N'YKBK', N'.mp3', N'audio', 5222, '20110817 01:18:42.520', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YKBK.mp3' UNION ALL
SELECT N'YMYQ', N'.mp3', N'audio', 5223, '20110817 01:18:42.520', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YMYQ.mp3' UNION ALL
SELECT N'Yo Tengo Un Amigo Que Me Ama', N'.mp3', N'audio', 5224, '20110817 01:18:42.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'Yo Tengo Un Amigo Que Me Ama.mp3' UNION ALL
SELECT N'You Are Not Alone', N'.mp3', N'audio', 5225, '20110817 01:18:42.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'You Are Not Alone.mp3' UNION ALL
SELECT N'You Had a Bad Day', N'.mp3', N'audio', 5226, '20110817 01:18:42.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'You Had a Bad Day.mp3' UNION ALL
SELECT N'You''re Not Alone', N'.mp3', N'audio', 5227, '20110817 01:18:42.537', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'You''re Not Alone.mp3' UNION ALL
SELECT N'YVFB', N'.mp3', N'audio', 5228, '20110817 01:18:42.550', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YVFB.mp3' UNION ALL
SELECT N'YWIK', N'.mp3', N'audio', 5229, '20110817 01:18:42.550', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YWIK.mp3' UNION ALL
SELECT N'YYHZ', N'.mp3', N'audio', 5230, '20110817 01:18:42.550', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'YYHZ.mp3' UNION ALL
SELECT N'ZBOI', N'.mp3', N'audio', 5231, '20110817 01:18:42.550', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZBOI.mp3' UNION ALL
SELECT N'ZBYZ', N'.mp3', N'audio', 5232, '20110817 01:18:42.567', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZBYZ.mp3' UNION ALL
SELECT N'ZCOG', N'.mp3', N'audio', 5233, '20110817 01:18:42.567', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZCOG.mp3' UNION ALL
SELECT N'ZCXU', N'.mp3', N'audio', 5234, '20110817 01:18:42.567', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZCXU.mp3' UNION ALL
SELECT N'ZJCI', N'.mp3', N'audio', 5235, '20110817 01:18:42.567', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZJCI.mp3' UNION ALL
SELECT N'ZRZT', N'.mp3', N'audio', 5236, '20110817 01:18:42.583', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZRZT.mp3' UNION ALL
SELECT N'ZURF', N'.mp3', N'audio', 5237, '20110817 01:18:42.583', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZURF.mp3' UNION ALL
SELECT N'ZUZD', N'.mp3', N'audio', 5238, '20110817 01:18:42.583', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZUZD.mp3' UNION ALL
SELECT N'ZVAV', N'.mp3', N'audio', 5239, '20110817 01:18:42.597', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZVAV.mp3' UNION ALL
SELECT N'ZXLE', N'.mp3', N'audio', 5240, '20110817 01:18:42.597', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZXLE.mp3' UNION ALL
SELECT N'ZYHC', N'.mp3', N'audio', 5241, '20110817 01:18:42.597', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'ZYHC.mp3' UNION ALL
SELECT N'_come fly with me', N'.mp3', N'audio', 5242, '20110817 01:18:42.597', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'_come fly with me.mp3' UNION ALL
SELECT N'_Disco Inferno', N'.mp3', N'audio', 5243, '20110817 01:18:42.613', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'_Disco Inferno.mp3' UNION ALL
SELECT N'_Heaven', N'.mp3', N'audio', 5244, '20110817 01:18:42.613', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'_Heaven.mp3' UNION ALL
SELECT N'_One Week', N'.mp3', N'audio', 5245, '20110817 01:18:42.613', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'_One Week.mp3' UNION ALL
SELECT N'_What Hurts The Most', N'.mp3', N'audio', 5246, '20110817 01:18:42.613', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'_What Hurts The Most.mp3' UNION ALL
SELECT N'_Why Should I Worry', N'.mp3', N'audio', 5247, '20110817 01:18:42.630', N'Y', N'', N'', N'', N'', N'../../images/albumcovers/music.jpg', NULL, 0, N'_Why Should I Worry.mp3'
COMMIT;
RAISERROR (N'[dbo].[MobileMedia]: Insert Batch: 19.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[MobileMedia] OFF;

