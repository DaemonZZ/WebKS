USE [master]
GO
/****** Object:  Database [HotelBackEnd]    Script Date: 1/29/2021 3:14:01 PM ******/
CREATE DATABASE [HotelBackEnd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBackEnd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.THANG\MSSQL\DATA\HotelBackEnd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelBackEnd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.THANG\MSSQL\DATA\HotelBackEnd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HotelBackEnd] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBackEnd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBackEnd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBackEnd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBackEnd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBackEnd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBackEnd] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBackEnd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelBackEnd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBackEnd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBackEnd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBackEnd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBackEnd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBackEnd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBackEnd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBackEnd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBackEnd] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelBackEnd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBackEnd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBackEnd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBackEnd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBackEnd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBackEnd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBackEnd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBackEnd] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelBackEnd] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBackEnd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBackEnd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBackEnd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBackEnd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelBackEnd] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelBackEnd', N'ON'
GO
ALTER DATABASE [HotelBackEnd] SET QUERY_STORE = OFF
GO
USE [HotelBackEnd]
GO
/****** Object:  Table [dbo].[AdType]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdType] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adName] [nvarchar](255) NULL,
	[AdDescription] [ntext] NULL,
	[img_id] [int] NULL,
	[tyepId] [int] NULL,
	[priority] [int] NULL,
 CONSTRAINT [PK__Advertis__3213E83F4D7FFA05] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [varchar](50) NULL,
	[bookedRoom] [int] NULL,
	[number_of_night] [int] NULL,
 CONSTRAINT [PK__Booking__3213E83FBC350237] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [varchar](50) NOT NULL,
	[fisrtName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[sex] [nvarchar](5) NULL,
	[email] [varchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[typeID] [int] NULL,
 CONSTRAINT [PK__Customer__3213E83F28418CF4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerType]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerType] [nvarchar](50) NULL,
	[description] [ntext] NULL,
 CONSTRAINT [PK__Customer__3213E83F7A0F396A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [ntext] NULL,
	[caption] [ntext] NULL,
	[typeId] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK__Gallery__3213E83F524DE927] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GalleryType]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GalleryType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](50) NULL,
 CONSTRAINT [PK__GalleryT__3213E83FACD72CFD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [varchar](50) NOT NULL,
	[bookingID] [int] NULL,
	[paymentMethod] [nvarchar](50) NULL,
	[cardNumber] [varchar](50) NULL,
	[expDate] [int] NULL,
	[expYear] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[promotionName] [nvarchar](50) NULL,
	[code] [varchar](50) NULL,
	[typeID] [int] NULL,
 CONSTRAINT [PK__Promotio__3213E83F5A297162] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionType]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PromotionType] [nvarchar](50) NULL,
	[discost] [float] NULL,
 CONSTRAINT [PK__Promotio__3213E83FD5634B5C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Roles__3213E83F05C71216] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room] [nvarchar](50) NULL,
	[RoomState] [int] NULL,
	[typeID] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK__Room__3213E83F5E727858] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Roomtype] [nvarchar](50) NULL,
	[size] [int] NULL,
 CONSTRAINT [PK__RoomType__3213E83F98CD584D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [varchar](10) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdType] ON 

INSERT [dbo].[AdType] ([id], [AdType]) VALUES (1, N'Introduction')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (2, N'Suite Dream')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (3, N'Dinning')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (4, N'Services')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (5, N'News')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (6, N'Facilities')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (7, N'Destionations')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (8, N'Promotions')
SET IDENTITY_INSERT [dbo].[AdType] OFF
GO
SET IDENTITY_INSERT [dbo].[Advertisement] ON 

INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority]) VALUES (1, N'Special Offers - HAPPY REOPENING - SUPPER SALES', N' Happy ReOpening - fantastic offer await! 🥰

À La Carte Da Nang Beach is so excitied to come back this 15th January! 

Thanks for all the love you all send to us! 

Special offer this season - only VND700.000++/room/night. 

 

👉 Make reservation today:
Website: https://alacartedanangbeach.com/
Phone: 0236 3959 555
Email: reservations@alacartedanangbeach.com', 12, 8, 1)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority]) VALUES (2, N'Special Offers - NITRO ICE CREAM', N'Treat yourself to the ultimate custom ice cream experience with nitro magic!

This is our must-try dessert at À La Carte - Nitro Ice Cream. We make smoothest ice cream by liquid nitrogen, cooling down the mixture of milk and flavors.

', 13, 8, 1)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority]) VALUES (3, N'Special Offers - BEEF STEAK FEST', N'Siêu ưu đãi cho món bít tết dịp cuối năm này! Hãy tận hưởng và đắm chìm trong bữa tiệc của hương vị với mức giá vô cùng phải chăng! 



  ', 14, 8, 1)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority]) VALUES (6, N'Spice Spa 50% For All Body Treatments', N'Busy life may bring you DOWN but let us elevate you UP!

Pampering yourself with our excellent service and amazing offers:

+ 60 mins facial/body massage only VND300.000
+ 50% discount for all remaining service on menu.

Contact us today for more information!

Terms & Conditions:
• This promotion is valid until 31st Jan. 2021
•  This promotion cannot be used in conjunction with any other promotion or discounts
•  Reservations required, please call us at 0236 3959 555 (ext: 110)



RECOMMENDATION

    Vietnamese Massage

Each country has its unique massage methods, and so does Vietnam. The traditional Vietnamese massage technique, or “Tam quat”, is a technique focusing on stimulating blood circulation by punching and clapping on the treatment areas. It relieves pain by putting pressure directly on the afflicted muscle to help you relaxed. It may sound rough to people who are unfamiliar, but the technique is very soothing and relaxing.

This method is suitable for those who work with high intensity: physical labor, sports activities ... Or office workers interact with computers every day.
 

    Hot Stone Massage

Hot stone massage is a method that affects the body with micro vibrations due to changes in temperature, and stimulate deep into the acupuncture points, thereby helping you to increase energy in the body. This is a relaxing treatment that is trusted by women and is also one of the most effective ways to relieve stress. In addition, it also works very well in the circulation of blood in the body, helping the body excrete toxins, reducing muscle tension, nerves, clearing the meridians and reducing fatigue.

Suitable for relaxation, stress and stress relief, this method is suitable for all audiences and certainly makes you satisfied.', 15, 8, 1)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority]) VALUES (7, N'Who we are', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:2em">
            <p>&nbsp;&ldquo;&Agrave; La Carte&rdquo; comes from the French phrase &ldquo;according to the menu&rdquo; where you can customize your experience from an assortment of add-ons. &Agrave; La Carte Da Nang Beach is an innovative lifestyle concept that reflects our style and beliefs:</p>

            <p><img alt="" src="/uploads/image/images/00(3)(1).png" />&nbsp;&nbsp;Individuality - We believe you are unique and your holiday should reflect your individuality and personality.</p>

            <p><img alt="" src="/uploads/image/images/00(3)(1).png" />&nbsp;&nbsp;Flexibility - We let you design your own holiday with our range of accommodation and service options.</p>

            <p><img alt="" src="/uploads/image/images/00(3)(1).png" />&nbsp;&nbsp;Be surprised - We offer you surprisingly fun new holiday experiences.</p>

            <p style="text-align: justify;">At &Agrave; La Carte, the choice is YOURS!</p>

            <p style="text-align: justify;">Standing tall on the My Khe Beach coast, named as one of the most fascinating beaches in the world, this beach front hotel in Da Nang would surprise you with our fresh and youthful style of living and fun casual service style which are second to none.</p>

            <p style="text-align: justify;">We know what wonderful vacations are made of, so we are more than happy to fulfill your desires. Let us take care of your experience with top quality services and exciting activities. Be ready for a journey full of joy and excitement.</p>

            <p style="text-align: justify;">Whether you&rsquo;re looking for a family getaway, a romantic vacation or friend relaxing retreat, we are here &ndash; the best beach hotel in Da Nang to help you design the most fabulous and unforgettable experience.</p>

            <p style="text-align: justify;">
                <br />
                <span style="font-size:16px;"><strong>WHY CHOOSE US?</strong></span>
            </p>

            <hr />
            <div class="btgrid">
                <div class="row row-1">
                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/12ww(1)(1).png" style="margin-right: 20px; float: left; width: 200px; height: 134px;" /></p>

                            <p style="text-align: justify;"><strong>Wonderful Location</strong></p>

                            <p style="text-align: justify;">Just door steps to dip your feet on the white sand and feel the glistening water. This beach front hotel enables panoramic view to My Khe Beach and Son Tra peninsula...</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(8).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>A good night sleep</strong></p>

                            <p style="text-align: justify;">All of our spacious suites and apartments are designed with the latest modern conveniences and number of intelligent configurations to suit your needs.</p>
                        </div>
                    </div>
                </div>
            </div>

            <p style="text-align: justify;">&nbsp;</p>

            <div class="btgrid">
                <div class="row row-1">
                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(9).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>Our Foodies</strong></p>

                            <p style="text-align: justify;">Our culinary team offer variety of delicious food to everyone. From nutritious breakfast, contemporary dining at FishC&aacute;, to casual meal in DELIcious or The Top, we cater to all tastes.</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(10).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>Secret of Relaxations</strong></p>

                            <p style="text-align: justify;">Spice up your life at Spice Spa. We offer you several exceptional treatments to refresh your body, mind and soul and many packages to shine your beauty.</p>
                        </div>
                    </div>
                </div>
            </div>

            <hr />
            <div class="btgrid">
                <div class="row row-1">
                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(12).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>For your Kids</strong></p>

                            <p style="text-align: justify;">Travel with your kids? Just give them a break! We have 02 Kids Clubs with a variety of fun activities for different ages.</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p contenteditable="true"><strong><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(11).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /></strong><strong>Events</strong></p>

                            <p>A variety of venues are available for your next meeting, special occasion, product launch or exhibitions. Let us create a special experience for your needs.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div style="text-align: center;">
                <br />
                <iframe align="middle" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/o_XbnpWWuFs" width="800"></iframe>
            </div>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
        </div>
        <iframe src="/z_modules/giai_thuong.php" height="auto" width="100%" style="border: 0; padding: 5em 0; overflow: hidden;" scrolling="no"></iframe>
    ', NULL, 1, 1)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority]) VALUES (8, N'Who we are', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:2em">
            <p>&nbsp;&ldquo;&Agrave; La Carte&rdquo; comes from the French phrase &ldquo;according to the menu&rdquo; where you can customize your experience from an assortment of add-ons. &Agrave; La Carte Da Nang Beach is an innovative lifestyle concept that reflects our style and beliefs:</p>

            <p><img alt="" src="/uploads/image/images/00(3)(1).png" />&nbsp;&nbsp;Individuality - We believe you are unique and your holiday should reflect your individuality and personality.</p>

            <p><img alt="" src="/uploads/image/images/00(3)(1).png" />&nbsp;&nbsp;Flexibility - We let you design your own holiday with our range of accommodation and service options.</p>

            <p><img alt="" src="/uploads/image/images/00(3)(1).png" />&nbsp;&nbsp;Be surprised - We offer you surprisingly fun new holiday experiences.</p>

            <p style="text-align: justify;">At &Agrave; La Carte, the choice is YOURS!</p>

            <p style="text-align: justify;">Standing tall on the My Khe Beach coast, named as one of the most fascinating beaches in the world, this beach front hotel in Da Nang would surprise you with our fresh and youthful style of living and fun casual service style which are second to none.</p>

            <p style="text-align: justify;">We know what wonderful vacations are made of, so we are more than happy to fulfill your desires. Let us take care of your experience with top quality services and exciting activities. Be ready for a journey full of joy and excitement.</p>

            <p style="text-align: justify;">Whether you&rsquo;re looking for a family getaway, a romantic vacation or friend relaxing retreat, we are here &ndash; the best beach hotel in Da Nang to help you design the most fabulous and unforgettable experience.</p>

            <p style="text-align: justify;">
                <br />
                <span style="font-size:16px;"><strong>WHY CHOOSE US?</strong></span>
            </p>

            <hr />
            <div class="btgrid">
                <div class="row row-1">
                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/12ww(1)(1).png" style="margin-right: 20px; float: left; width: 200px; height: 134px;" /></p>

                            <p style="text-align: justify;"><strong>Wonderful Location</strong></p>

                            <p style="text-align: justify;">Just door steps to dip your feet on the white sand and feel the glistening water. This beach front hotel enables panoramic view to My Khe Beach and Son Tra peninsula...</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(8).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>A good night sleep</strong></p>

                            <p style="text-align: justify;">All of our spacious suites and apartments are designed with the latest modern conveniences and number of intelligent configurations to suit your needs.</p>
                        </div>
                    </div>
                </div>
            </div>

            <p style="text-align: justify;">&nbsp;</p>

            <div class="btgrid">
                <div class="row row-1">
                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(9).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>Our Foodies</strong></p>

                            <p style="text-align: justify;">Our culinary team offer variety of delicious food to everyone. From nutritious breakfast, contemporary dining at FishC&aacute;, to casual meal in DELIcious or The Top, we cater to all tastes.</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(10).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>Secret of Relaxations</strong></p>

                            <p style="text-align: justify;">Spice up your life at Spice Spa. We offer you several exceptional treatments to refresh your body, mind and soul and many packages to shine your beauty.</p>
                        </div>
                    </div>
                </div>
            </div>

            <hr />
            <div class="btgrid">
                <div class="row row-1">
                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(12).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>For your Kids</strong></p>

                            <p style="text-align: justify;">Travel with your kids? Just give them a break! We have 02 Kids Clubs with a variety of fun activities for different ages.</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p contenteditable="true"><strong><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(11).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /></strong><strong>Events</strong></p>

                            <p>A variety of venues are available for your next meeting, special occasion, product launch or exhibitions. Let us create a special experience for your needs.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div style="text-align: center;">
                <br />
                <iframe align="middle" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/o_XbnpWWuFs" width="800"></iframe>
            </div>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
        </div>
        <iframe src="/z_modules/giai_thuong.php" height="auto" width="100%" style="border: 0; padding: 5em 0; overflow: hidden;" scrolling="no"></iframe>
    ', NULL, 1, 1)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority]) VALUES (9, N'Who we are', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:2em"><p>&nbsp;“À La Carte” comes from the French phrase “according to the menu” where you can customize your experience from an assortment of add-ons. À La Carte Da Nang Beach is an innovative lifestyle concept that reflects our style and beliefs:</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp;&nbsp;Individuality - We believe you are unique and your holiday should reflect your individuality and personality.</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp;&nbsp;Flexibility - We let you design your own holiday with our range of accommodation and service options.</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp;&nbsp;Be surprised - We offer you surprisingly fun new holiday experiences.</p>

<p style="text-align: justify;">At À La Carte, the choice is YOURS!</p>

<p style="text-align: justify;">Standing tall on the My Khe Beach coast, named as one of the most fascinating beaches in the world, this beach front hotel in Da Nang would surprise you with our fresh and youthful style of living and fun casual service style which are second to none.</p>

<p style="text-align: justify;">We know what wonderful vacations are made of, so we are more than happy to fulfill your desires. Let us take care of your experience with top quality services and exciting activities. Be ready for a journey full of joy and excitement.</p>

<p style="text-align: justify;">Whether you’re looking for a family getaway, a romantic vacation or friend relaxing retreat, we are here – the best beach hotel in Da Nang to help you design the most fabulous and unforgettable experience.</p>

<p style="text-align: justify;"><br>
<span style="font-size:16px;"><strong>WHY CHOOSE US?</strong></span></p>

<hr>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><img alt="" src="/uploads/image/images/12ww(1)(1).png" style="margin-right: 20px; float: left; width: 200px; height: 134px;"></p>

<p style="text-align: justify;"><strong>Wonderful Location</strong></p>

<p style="text-align: justify;">Just door steps to dip your feet on the white sand and feel the glistening water. This beach front hotel enables panoramic view to My Khe Beach and Son Tra peninsula...</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><img alt="" src="/uploads/image/images/imgpsh_fullsize_anim%20(8).jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;"><strong>A good night sleep</strong></p>

<p style="text-align: justify;">All of our spacious suites and apartments are designed with the latest modern conveniences and number of intelligent configurations to suit your needs.</p>
</div>
</div>
</div>
</div>

<p style="text-align: justify;">&nbsp;</p>', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (1, N'slide_227.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (2, N'slide_411.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (3, N'slide_413.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (4, N'slide_414.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (5, N'slide_415.jpg', NULL, 1, 1)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (6, N'slide_416.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (7, N'slide_417.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (8, N'slide_418.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (9, N'slide_424.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (10, N'slide_425.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (11, N'slide_426.jpg', NULL, 1, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (12, N'km_slide_1_105.jpg', N'HAPPY REOPENING - SUPPER SALES', 8, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (13, N'km_slide_1_112.jpg', N'NITRO ICE CREAM', 8, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (14, N'new_2_82.jpg', N' BEEF STEAK FEST', 8, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (15, N'km_slide_2_52.jpg', N'Spice Spa 50% For All Body Treatments', 8, 0)
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
SET IDENTITY_INSERT [dbo].[GalleryType] ON 

INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (1, N'Banner')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (2, N'Room')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (3, N'Food&Drink')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (4, N'Service')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (5, N'News')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (6, N'Facility')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (7, N'Destination')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (8, N'Promotion')
SET IDENTITY_INSERT [dbo].[GalleryType] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [roleName]) VALUES (0, N'admin')
INSERT [dbo].[Roles] ([id], [roleName]) VALUES (1, N'seller')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (1, N'Light Studio', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (2, N'Light Plus Studio', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (3, N'Delight Ocean View Apartment', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (4, N'Delight City View Apartment', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (5, N'Delight Plus Apartment', 5)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (6, N'Hightlight Apartment', 5)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (7, N'Hightlight Plus Apartment', 5)
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
INSERT [dbo].[Users] ([id], [userName], [pwd], [role_id]) VALUES (N'1', N'admin', N'123', 0)
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [DF_Gallery_active]  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [FK_Advertisement_AdType] FOREIGN KEY([tyepId])
REFERENCES [dbo].[AdType] ([id])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [FK_Advertisement_AdType]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [FK_Advertisement_Gallery] FOREIGN KEY([img_id])
REFERENCES [dbo].[Gallery] ([id])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [FK_Advertisement_Gallery]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Room] FOREIGN KEY([bookedRoom])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Room]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerType] FOREIGN KEY([typeID])
REFERENCES [dbo].[CustomerType] ([id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerType]
GO
ALTER TABLE [dbo].[Gallery]  WITH CHECK ADD  CONSTRAINT [FK_Gallery_GalleryType] FOREIGN KEY([typeId])
REFERENCES [dbo].[GalleryType] ([id])
GO
ALTER TABLE [dbo].[Gallery] CHECK CONSTRAINT [FK_Gallery_GalleryType]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Booking] FOREIGN KEY([bookingID])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Booking]
GO
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_PromotionType] FOREIGN KEY([typeID])
REFERENCES [dbo].[PromotionType] ([id])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [FK_Promotion_PromotionType]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([typeID])
REFERENCES [dbo].[RoomType] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 1/29/2021 3:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Login]
	@name nvarchar(50),
	@pass nvarchar(50)
as
begin
	declare @count int
	declare @res bit
	select @count = count(*) from Users where userName=@name and pwd=@pass
	if @count>0
		set @res =1
	else 
		set @res = 0
	select @res
end
GO
USE [master]
GO
ALTER DATABASE [HotelBackEnd] SET  READ_WRITE 
GO
