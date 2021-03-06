USE [master]
GO
/****** Object:  Database [HotelBackEnd]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[AdType]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[Advertisement]    Script Date: 5/4/2021 8:31:54 AM ******/
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
	[summary] [ntext] NULL,
 CONSTRAINT [PK__Advertis__3213E83F4D7FFA05] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/4/2021 8:31:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [varchar](50) NULL,
	[bookedRoom] [int] NULL,
	[bookingDate] [datetime] NOT NULL,
	[checkin] [datetime] NOT NULL,
	[checkout] [datetime] NOT NULL,
	[promotion_code] [varchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__Booking__3213E83FBC350237] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/4/2021 8:31:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[noidung] [ntext] NULL,
	[adId] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[CustomerType]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[Gallery]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[GalleryType]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[Promotion]    Script Date: 5/4/2021 8:31:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NULL,
	[typeID] [int] NULL,
	[State] [int] NULL,
	[use_date] [datetime] NULL,
	[expiration_date] [datetime] NULL,
 CONSTRAINT [PK__Promotio__3213E83F5A297162] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionType]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[RoomType]    Script Date: 5/4/2021 8:31:54 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 5/4/2021 8:31:54 AM ******/
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
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (4, N'Spa')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (5, N'News')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (6, N'Facilities')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (7, N'Destionations')
INSERT [dbo].[AdType] ([id], [AdType]) VALUES (8, N'Promotions')
SET IDENTITY_INSERT [dbo].[AdType] OFF
GO
SET IDENTITY_INSERT [dbo].[Advertisement] ON 

INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (1, N'Special Offers - HAPPY REOPENING - SUPPER SALES', N' Happy ReOpening - fantastic offer await! 🥰

À La Carte Da Nang Beach is so excitied to come back this 15th January! 

Thanks for all the love you all send to us! 

Special offer this season - only VND700.000++/room/night. 

 

👉 Make reservation today:
Website: https://alacartedanangbeach.com/
Phone: 0236 3959 555
Email: reservations@alacartedanangbeach.com', 12, 8, 1, NULL)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (2, N'Special Offers - NITRO ICE CREAM', N'Treat yourself to the ultimate custom ice cream experience with nitro magic!

This is our must-try dessert at À La Carte - Nitro Ice Cream. We make smoothest ice cream by liquid nitrogen, cooling down the mixture of milk and flavors.

', 13, 8, 1, NULL)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (3, N'Special Offers - BEEF STEAK FEST', N'Siêu ưu đãi cho món bít tết dịp cuối năm này! Hãy tận hưởng và đắm chìm trong bữa tiệc của hương vị với mức giá vô cùng phải chăng! 



  ', 14, 8, 1, NULL)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (6, N'Spice Spa 50% For All Body Treatments', N'Busy life may bring you DOWN but let us elevate you UP!

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

Suitable for relaxation, stress and stress relief, this method is suitable for all audiences and certainly makes you satisfied.', 15, 8, 1, NULL)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (7, N'Who we are', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:2em">
            <p>&nbsp;&ldquo;&Agrave;BC&rdquo; comes from the French phrase &ldquo;according to the menu&rdquo; where you can customize your experience from an assortment of add-ons. &Agrave; La Carte Da Nang Beach is an innovative lifestyle concept that reflects our style and beliefs:</p>

            <p><img alt="" src="/Image/icon/dot.png" />&nbsp;&nbsp;Individuality - We believe you are unique and your holiday should reflect your individuality and personality.</p>

            <p><img alt="" src="/Image/icon/dot.png" />&nbsp;&nbsp;Flexibility - We let you design your own holiday with our range of accommodation and service options.</p>

            <p><img alt="" src="/Image/icon/dot.png" />&nbsp;&nbsp;Be surprised - We offer you surprisingly fun new holiday experiences.</p>

            <p style="text-align: justify;">At ABC, the choice is YOURS!</p>

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
                            <p style="text-align: justify;"><img alt="" src="/Image/News/alacarte.jpg" style="margin-right: 20px; float: left; width: 200px; height: 134px;" /></p>

                            <p style="text-align: justify;"><strong>Wonderful Location</strong></p>

                            <p style="text-align: justify;">Just door steps to dip your feet on the white sand and feel the glistening water. This beach front hotel enables panoramic view to My Khe Beach and Son Tra peninsula...</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/Image/News/alacarte.jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>A good night sleep</strong></p>

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
                            <p style="text-align: justify;"><img alt="" src="/Image/News/alacarte.jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>Our Foodies</strong></p>

                            <p style="text-align: justify;">Our culinary team offer variety of delicious food to everyone. From nutritious breakfast, contemporary dining at FishC&aacute;, to casual meal in DELIcious or The Top, we cater to all tastes.</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p style="text-align: justify;"><img alt="" src="/Image/News/alacarte.jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>Secret of Relaxations</strong></p>

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
                            <p style="text-align: justify;"><img alt="" src="/Image/News/alacarte.jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /><strong>For your Kids</strong></p>

                            <p style="text-align: justify;">Travel with your kids? Just give them a break! We have 02 Kids Clubs with a variety of fun activities for different ages.</p>
                        </div>
                    </div>

                    <div class="col col-md-6">
                        <div class="content">
                            <p contenteditable="true"><strong><img alt="" src="/Image/News/alacarte.jpg" style="height: 133px; width: 200px; float: left; margin-right: 20px;" /></strong><strong>Events</strong></p>

                            <p>A variety of venues are available for your next meeting, special occasion, product launch or exhibitions. Let us create a special experience for your needs.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div style="text-align: center;">
                <br />
                <iframe align="middle" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/znc6S3_iTBw" width="800"></iframe>
            </div>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
            <script src="chrome-extension://lmnganadkecefnhncokdlaohlkneihio/enable.js"></script>
        </div>
      
	  ', NULL, 1, 1, NULL)
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (10, N'Light Studio', N'<div class="noidung_tin" style="margin-top:3em">
    <div class="text-center">
        <a class="btn btn-default btn-view-all" href="#" target="_blank">Book now</a>
    </div>
  &nbsp;
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p style="text-align: justify;"><em><strong>&ldquo;Perfect choice for solo travellers or couples&rdquo;.</strong></em></p>

<p style="text-align: justify;">The LIGHT Studio are modern and stylish design with either king or twin beds. Spacious and functional, it also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space. Although our most modestly sized room, the amenities remain top-notch, giving guests a sense of wellbeing and security <span new="" roman="" style="font-family:" times="">&ndash;</span> a home away from home.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png" />&nbsp; View: window with no view</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png" />&nbsp; Size: 44 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png" />&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png" />&nbsp; Bed type: King or Twin</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><span style="color:#25aae2;"><u>FACILITIES ROOM:</u></span></p>

<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/shower%20(1).png" style="width: 24px; height: 24px;" />&nbsp;Standing shower</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bathroom.png" style="width: 24px; height: 24px;" />&nbsp;&nbsp;Bathroom Amenities</p>
</div>
</div>
</div>

<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bench(1).png" style="width: 24px; height: 24px;" />&nbsp; Lounge</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cashier.png" style="width: 24px; height: 24px;" />&nbsp; Dining Counter</p>
</div>
</div>
</div>

<div class="row row-3">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/coffee-cup(1).png" style="width: 24px; height: 24px;" />&nbsp; Coffee Maker</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kettle(1).png" style="width: 24px; height: 24px;" />&nbsp; Kettle</p>
</div>
</div>
</div>

<div class="row row-4">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/safe.png" style="width: 24px; height: 24px;" />&nbsp; Safety Box</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/hairdryer(1).png" style="width: 24px; height: 24px;" />&nbsp; Hairdryer</p>
</div>
</div>
</div>

<div class="row row-5">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kitchen(2).png" style="width: 24px; height: 24px;" />&nbsp; Kitchenette</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/fridge.png" style="width: 24px; height: 24px;" />&nbsp; Refrigerator</p>
</div>
</div>
</div>

<div class="row row-6">
<div class="col col-md-6">
<div class="content">
<p><span style="font-size:14px"><span style="color:#4a4a4a"><span style="font-family:UTM-Avo, sans-serif"><span style="background-color:#ffffff"><img alt="" src="/Image/icon/microwave.png" style="width: 24px; height: 24px;" />&nbsp; </span></span></span></span>Microwave</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/wifi(13).png" style="width: 24px; height: 24px;" />&nbsp; Free Wifi</p>
</div>
</div>
</div>

<div class="row row-7">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/air-conditioner(1).png" style="width: 24px; height: 24px;" />&nbsp; Air-Conditioning</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/phone-call.png" style="width: 24px; height: 24px;" />&nbsp; DD Telephone</p>
</div>
</div>
</div>

<div class="row row-8">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cable-tv.png" style="width: 24px; height: 24px;" />&nbsp; Satellite TV</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/stove.png" style="width: 24px; height: 24px;" />&nbsp; Two-Plate Induction Stove</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12" style="width:100%;">
<h2 class="lined-heading"><span>Other rooms</span></h2>
</div>
	  ', 16, 2, 1, N'<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p style="text-align: justify;"><em><strong>“Perfect choice for solo travellers or couples”.</strong></em></p>

<p style="text-align: justify;">The LIGHT Studio are modern and stylish design with either king or twin beds. Spacious and functional, it also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space. Although our most modestly sized room, the amenities remain top-notch, giving guests a sense of wellbeing and security <span new="" roman="" style="font-family:" times="">–</span> a home away from home.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png">&nbsp; View: window with no view</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png">&nbsp; Size: 44 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png">&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/dot.png">&nbsp; Bed type: King or Twin</p>')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (11, N'Light Plus Studio', N'<div class="noidung_tin" style="margin-top:3em">
    <div class="text-center">
        <a class="btn btn-default btn-view-all" href="https://redirect.fastbooking.com/DIRECTORY/dispoprice.phtml?showPromotions=1&amp;property=vndan26664" target="_blank">Book now</a>
    </div>
  &nbsp;
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect choice for solo travellers or couples”.</strong></em></p>

<p style="text-align: justify;">The LIGHT PLUS offers unparalleled ocean front view with balcony. The studio has exquisite decorations with King sized bed, which is the perfect choice for your romantic getaway. It also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp;&nbsp; Size: 46 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Bed type: King sized bed</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><span style="color:#25aae2;"><u>FACILITIES ROOM:</u></span></p>

<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/shower%20(1).png" style="width: 24px; height: 24px;">&nbsp;Standing shower</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bathroom.png" style="width: 24px; height: 24px;">&nbsp;&nbsp;Bathroom Amenities</p>
</div>
</div>
</div>

<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bench(1).png" style="width: 24px; height: 24px;">&nbsp; Lounge</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cashier.png" style="width: 24px; height: 24px;">&nbsp; Dining Counter</p>
</div>
</div>
</div>

<div class="row row-3">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/coffee-cup(1).png" style="width: 24px; height: 24px;">&nbsp; Coffee Maker</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kettle(1).png" style="width: 24px; height: 24px;">&nbsp; Kettle</p>
</div>
</div>
</div>

<div class="row row-4">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/safe.png" style="width: 24px; height: 24px;">&nbsp; Safety Box</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/hairdryer(1).png" style="width: 24px; height: 24px;">&nbsp; Hairdryer</p>
</div>
</div>
</div>

<div class="row row-5">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kitchen(2).png" style="width: 24px; height: 24px;">&nbsp; Kitchenette</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/fridge.png" style="width: 24px; height: 24px;">&nbsp; Refrigerator</p>
</div>
</div>
</div>

<div class="row row-6">
<div class="col col-md-6">
<div class="content">
<p><span style="font-size:14px"><span style="color:#4a4a4a"><span style="font-family:UTM-Avo, sans-serif"><span style="background-color:#ffffff"><img alt="" src="/Image/icon/microwave.png" style="width: 24px; height: 24px;">&nbsp; </span></span></span></span>Microwave</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/wifi(13).png" style="width: 24px; height: 24px;">&nbsp; Free Wifi</p>
</div>
</div>
</div>

<div class="row row-7">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/air-conditioner(1).png" style="width: 24px; height: 24px;">&nbsp; Air-Conditioning</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/phone-call.png" style="width: 24px; height: 24px;">&nbsp; DD Telephone</p>
</div>
</div>
</div>

<div class="row row-8">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cable-tv.png" style="width: 24px; height: 24px;">&nbsp; Satellite TV</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/stove.png" style="width: 24px; height: 24px;">&nbsp; Two-Plate Induction Stove</p>
</div>
</div>
</div>
</div>
<img alt="" src="https://ksalacarte.goongroup.com/Image/icon/balcony.png">&nbsp; Balcony &amp; Two Chairs</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12" style="width:100%;">
<h2 class="lined-heading"><span>Other rooms</span></h2>
</div>
	  ', 17, 2, 1, N'<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect choice for solo travellers or couples”.</strong></em></p>

<p style="text-align: justify;">The LIGHT PLUS offers unparalleled ocean front view with balcony. The studio has exquisite decorations with King sized bed, which is the perfect choice for your romantic getaway. It also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp;&nbsp; Size: 46 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Bed type: King sized bed</p>')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (12, N'Delight Ocean View Apartment', N'<div class="noidung_tin" style="margin-top:3em">
    <div class="text-center">
        <a class="btn btn-default btn-view-all" href="#" target="_blank">Book now</a>
    </div>
  &nbsp;
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“</strong></em><strong>Ideal for couples on a romantic getaway</strong><em><strong>”.</strong></em></p>

<p style="text-align: justify;">Waking up with sunlight and listening to the ocean waves to start a new day with great felling.&nbsp; DELIGHT Ocean view is 1 bed-room apartment with separate living area and kitchenette. All these rooms are featured balcony and ensuite bathroom with separate bathtub and shower.</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Size: 69 m<sup>2</sup></p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp;Occupancy: 02 or 03 guests (with extra bed)</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Bed type: King sized bed</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><span style="color:#25aae2;"><u>FACILITIES ROOM:</u></span></p>

<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/shower%20(1).png" style="width: 24px; height: 24px;">&nbsp;Standing shower</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bathroom.png" style="width: 24px; height: 24px;">&nbsp;&nbsp;Bathroom Amenities</p>
</div>
</div>
</div>

<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bench(1).png" style="width: 24px; height: 24px;">&nbsp; Lounge</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cashier.png" style="width: 24px; height: 24px;">&nbsp; Dining Counter</p>
</div>
</div>
</div>

<div class="row row-3">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/coffee-cup(1).png" style="width: 24px; height: 24px;">&nbsp; Coffee Maker</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kettle(1).png" style="width: 24px; height: 24px;">&nbsp; Kettle</p>
</div>
</div>
</div>

<div class="row row-4">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/safe.png" style="width: 24px; height: 24px;">&nbsp; Safety Box</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/hairdryer(1).png" style="width: 24px; height: 24px;">&nbsp; Hairdryer</p>
</div>
</div>
</div>

<div class="row row-5">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kitchen(2).png" style="width: 24px; height: 24px;">&nbsp; Kitchenette</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/fridge.png" style="width: 24px; height: 24px;">&nbsp; Refrigerator</p>
</div>
</div>
</div>

<div class="row row-6">
<div class="col col-md-6">
<div class="content">
<p><span style="font-size:14px"><span style="color:#4a4a4a"><span style="font-family:UTM-Avo, sans-serif"><span style="background-color:#ffffff"><img alt="" src="/Image/icon/microwave.png" style="width: 24px; height: 24px;">&nbsp; </span></span></span></span>Microwave</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/wifi(13).png" style="width: 24px; height: 24px;">&nbsp; Free Wifi</p>
</div>
</div>
</div>

<div class="row row-7">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/air-conditioner(1).png" style="width: 24px; height: 24px;">&nbsp; Air-Conditioning</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/phone-call.png" style="width: 24px; height: 24px;">&nbsp; DD Telephone</p>
</div>
</div>
</div>

<div class="row row-8">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cable-tv.png" style="width: 24px; height: 24px;">&nbsp; Satellite TV</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/stove.png" style="width: 24px; height: 24px;">&nbsp; Two-Plate Induction Stove</p>
</div>
</div>
</div>
</div>
<img alt="" src="https://ksalacarte.goongroup.com/Image/icon/balcony.png">&nbsp; Balcony &amp; Two Chairs</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12" style="width:100%;">
<h2 class="lined-heading"><span>Other rooms</span></h2>
</div>
	  ', 18, 2, 1, N'<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“</strong></em><strong>Ideal for couples on a romantic getaway</strong><em><strong>”.</strong></em></p>

<p style="text-align: justify;">Waking up with sunlight and listening to the ocean waves to start a new day with great felling.&nbsp; DELIGHT Ocean view is 1 bed-room apartment with separate living area and kitchenette. All these rooms are featured balcony and ensuite bathroom with separate bathtub and shower.</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Size: 69 m<sup>2</sup></p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp;Occupancy: 02 or 03 guests (with extra bed)</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Bed type: King sized bed</p>')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (13, N'Delight City View Apartment', N'<div class="noidung_tin" style="margin-top:3em">
    <div class="text-center">
        <a class="btn btn-default btn-view-all" href="#" target="_blank">Book now</a>
    </div>
  &nbsp;
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Ideal for couples on a romantic getaway”</strong></em></p>

<p style="text-align: justify;">Featured with premium facilities and exquisite decorations, this 1 bed-room apartment is an ideal choice to enjoy the unparalleled comfort. The room offers spacious separate living area and kitchenette. These rooms are available with king or twin bed for flexible accommodation.</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; View: City view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Occupancy: 69 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Occupancy:&nbsp;02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Bed type: King or Twin Bed</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><span style="color:#25aae2;"><u>FACILITIES ROOM:</u></span></p>

<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/shower%20(1).png" style="width: 24px; height: 24px;">&nbsp;Standing shower</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bathroom.png" style="width: 24px; height: 24px;">&nbsp;&nbsp;Bathroom Amenities</p>
</div>
</div>
</div>

<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bench(1).png" style="width: 24px; height: 24px;">&nbsp; Lounge</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cashier.png" style="width: 24px; height: 24px;">&nbsp; Dining Counter</p>
</div>
</div>
</div>

<div class="row row-3">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/coffee-cup(1).png" style="width: 24px; height: 24px;">&nbsp; Coffee Maker</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kettle(1).png" style="width: 24px; height: 24px;">&nbsp; Kettle</p>
</div>
</div>
</div>

<div class="row row-4">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/safe.png" style="width: 24px; height: 24px;">&nbsp; Safety Box</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/hairdryer(1).png" style="width: 24px; height: 24px;">&nbsp; Hairdryer</p>
</div>
</div>
</div>

<div class="row row-5">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kitchen(2).png" style="width: 24px; height: 24px;">&nbsp; Kitchenette</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/fridge.png" style="width: 24px; height: 24px;">&nbsp; Refrigerator</p>
</div>
</div>
</div>

<div class="row row-6">
<div class="col col-md-6">
<div class="content">
<p><span style="font-size:14px"><span style="color:#4a4a4a"><span style="font-family:UTM-Avo, sans-serif"><span style="background-color:#ffffff"><img alt="" src="/Image/icon/microwave.png" style="width: 24px; height: 24px;">&nbsp; </span></span></span></span>Microwave</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/wifi(13).png" style="width: 24px; height: 24px;">&nbsp; Free Wifi</p>
</div>
</div>
</div>

<div class="row row-7">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/air-conditioner(1).png" style="width: 24px; height: 24px;">&nbsp; Air-Conditioning</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/phone-call.png" style="width: 24px; height: 24px;">&nbsp; DD Telephone</p>
</div>
</div>
</div>

<div class="row row-8">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cable-tv.png" style="width: 24px; height: 24px;">&nbsp; Satellite TV</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/stove.png" style="width: 24px; height: 24px;">&nbsp; Two-Plate Induction Stove</p>
</div>
</div>
</div>
</div>
<img alt="" src="https://ksalacarte.goongroup.com/Image/icon/balcony.png">&nbsp; Balcony &amp; Two Chairs</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12" style="width:100%;">
<h2 class="lined-heading"><span>Other rooms</span></h2>
</div>
	  ', 19, 2, 1, N'<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect choice for solo travellers or couples”.</strong></em></p>

<p style="text-align: justify;">The LIGHT PLUS offers unparalleled ocean front view with balcony. The studio has exquisite decorations with King sized bed, which is the perfect choice for your romantic getaway. It also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp;&nbsp; Size: 46 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Bed type: King sized bed</p>')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (14, N'Delight Plus Apartment', N'<div class="noidung_tin" style="margin-top:3em">
    <div class="text-center">
        <a class="btn btn-default btn-view-all" href="#" target="_blank">Book now</a>
    </div>
  &nbsp;
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p style="text-align: justify;"><em><strong>"Ideal for families and friends travelling together."</strong></em></p>

<p style="text-align: justify;">DELIGHT PLUS is two bed-room apartment which is the perfect fit for your family or group of friends. The master bedroom has a king size bed and an en-suite bathroom with shower. The second bedroom has a king or twin bed with a separate bathroom. The separate living area with well-equiped kitchennett and balcony are what make this apartment perfect choice.</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; View: City view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Size: 69 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Occupancy: up to 04 guests</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Bed type: 01 Queen and 01 Twin bed OR&nbsp;02 Queen Beds</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><span style="color:#25aae2;"><u>FACILITIES ROOM:</u></span></p>

<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/shower%20(1).png" style="width: 24px; height: 24px;">&nbsp;Standing shower</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bathroom.png" style="width: 24px; height: 24px;">&nbsp;&nbsp;Bathroom Amenities</p>
</div>
</div>
</div>

<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bench(1).png" style="width: 24px; height: 24px;">&nbsp; Lounge</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cashier.png" style="width: 24px; height: 24px;">&nbsp; Dining Counter</p>
</div>
</div>
</div>

<div class="row row-3">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/coffee-cup(1).png" style="width: 24px; height: 24px;">&nbsp; Coffee Maker</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kettle(1).png" style="width: 24px; height: 24px;">&nbsp; Kettle</p>
</div>
</div>
</div>

<div class="row row-4">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/safe.png" style="width: 24px; height: 24px;">&nbsp; Safety Box</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/hairdryer(1).png" style="width: 24px; height: 24px;">&nbsp; Hairdryer</p>
</div>
</div>
</div>

<div class="row row-5">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kitchen(2).png" style="width: 24px; height: 24px;">&nbsp; Kitchenette</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/fridge.png" style="width: 24px; height: 24px;">&nbsp; Refrigerator</p>
</div>
</div>
</div>

<div class="row row-6">
<div class="col col-md-6">
<div class="content">
<p><span style="font-size:14px"><span style="color:#4a4a4a"><span style="font-family:UTM-Avo, sans-serif"><span style="background-color:#ffffff"><img alt="" src="/Image/icon/microwave.png" style="width: 24px; height: 24px;">&nbsp; </span></span></span></span>Microwave</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/wifi(13).png" style="width: 24px; height: 24px;">&nbsp; Free Wifi</p>
</div>
</div>
</div>

<div class="row row-7">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/air-conditioner(1).png" style="width: 24px; height: 24px;">&nbsp; Air-Conditioning</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/phone-call.png" style="width: 24px; height: 24px;">&nbsp; DD Telephone</p>
</div>
</div>
</div>

<div class="row row-8">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cable-tv.png" style="width: 24px; height: 24px;">&nbsp; Satellite TV</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/stove.png" style="width: 24px; height: 24px;">&nbsp; Two-Plate Induction Stove</p>
</div>
</div>
</div>
</div>
<img alt="" src="https://ksalacarte.goongroup.com/Image/icon/balcony.png">&nbsp; Balcony &amp; Two Chairs</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12" style="width:100%;">
<h2 class="lined-heading"><span>Other rooms</span></h2>
</div>
	  ', 20, 2, 1, N'<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect choice for solo travellers or couples”.</strong></em></p>

<p style="text-align: justify;">The LIGHT PLUS offers unparalleled ocean front view with balcony. The studio has exquisite decorations with King sized bed, which is the perfect choice for your romantic getaway. It also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp;&nbsp; Size: 46 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Bed type: King sized bed</p>')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (15, N'Hightlight Apartment', N'<div class="noidung_tin" style="margin-top:3em">
    <div class="text-center">
        <a class="btn btn-default btn-view-all" href="#" target="_blank">Book now</a>
    </div>
  &nbsp;
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect for families and friends travelling together”.</strong></em></p>

<p style="text-align: justify;">For sumptuous ocean front view accommodations in Da Nang, look no further than our HIGHTLIGHT - two bed-room apartment which is perfect choice for your family and group of friends. With spacious living space and well-eqquiped facilities for your experience, this apartment has both separate living areas and kitchenettes. Most HIGHLIGHT apartment feature large balconies.</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Size: 74 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Occupancy: up to 04 guests</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Bed type: 01 King bed and 01 Queen Bed</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><span style="color:#25aae2;"><u>FACILITIES ROOM:</u></span></p>

<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/shower%20(1).png" style="width: 24px; height: 24px;">&nbsp;Standing shower</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bathroom.png" style="width: 24px; height: 24px;">&nbsp;&nbsp;Bathroom Amenities</p>
</div>
</div>
</div>

<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bench(1).png" style="width: 24px; height: 24px;">&nbsp; Lounge</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cashier.png" style="width: 24px; height: 24px;">&nbsp; Dining Counter</p>
</div>
</div>
</div>

<div class="row row-3">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/coffee-cup(1).png" style="width: 24px; height: 24px;">&nbsp; Coffee Maker</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kettle(1).png" style="width: 24px; height: 24px;">&nbsp; Kettle</p>
</div>
</div>
</div>

<div class="row row-4">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/safe.png" style="width: 24px; height: 24px;">&nbsp; Safety Box</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/hairdryer(1).png" style="width: 24px; height: 24px;">&nbsp; Hairdryer</p>
</div>
</div>
</div>

<div class="row row-5">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kitchen(2).png" style="width: 24px; height: 24px;">&nbsp; Kitchenette</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/fridge.png" style="width: 24px; height: 24px;">&nbsp; Refrigerator</p>
</div>
</div>
</div>

<div class="row row-6">
<div class="col col-md-6">
<div class="content">
<p><span style="font-size:14px"><span style="color:#4a4a4a"><span style="font-family:UTM-Avo, sans-serif"><span style="background-color:#ffffff"><img alt="" src="/Image/icon/microwave.png" style="width: 24px; height: 24px;">&nbsp; </span></span></span></span>Microwave</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/wifi(13).png" style="width: 24px; height: 24px;">&nbsp; Free Wifi</p>
</div>
</div>
</div>

<div class="row row-7">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/air-conditioner(1).png" style="width: 24px; height: 24px;">&nbsp; Air-Conditioning</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/phone-call.png" style="width: 24px; height: 24px;">&nbsp; DD Telephone</p>
</div>
</div>
</div>

<div class="row row-8">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cable-tv.png" style="width: 24px; height: 24px;">&nbsp; Satellite TV</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/stove.png" style="width: 24px; height: 24px;">&nbsp; Two-Plate Induction Stove</p>
</div>
</div>
</div>
</div>
<img alt="" src="https://ksalacarte.goongroup.com/Image/icon/balcony.png">&nbsp; Balcony &amp; Two Chairs</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12" style="width:100%;">
<h2 class="lined-heading"><span>Other rooms</span></h2>
</div>
	  ', 21, 2, 1, N'<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect choice for solo travellers or couples”.</strong></em></p>

<p style="text-align: justify;">The LIGHT PLUS offers unparalleled ocean front view with balcony. The studio has exquisite decorations with King sized bed, which is the perfect choice for your romantic getaway. It also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp;&nbsp; Size: 46 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Bed type: King sized bed</p>')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (16, N'Hightlight Plus Apartment', N'<div class="noidung_tin" style="margin-top:3em">
    <div class="text-center">
        <a class="btn btn-default btn-view-all" href="#" target="_blank">Book now</a>
    </div>
  &nbsp;
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect for families and friends travelling together.”</strong></em></p>

<p style="text-align: justify;">This spacious apartment would refesh your feeling with its outstanding design. This two-bedroom apartment with sea view would perfect your experience with friends and family. The master bedroom has a king size bed and an en-suite bathroom with shower. The second bedroom also has a king size bed with separate bathroom. There is a living-dining area with balcony and a kitchenette equipped with a coffee maker, microwave, two-plate induction stove and a refrigerator.</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Size: 114 m<sup>2</sup></p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Occupancy: up to 04 guests</p>

<p><img alt="" src="/uploads/image/images/00(3)(1).png">&nbsp; Bed type: 02 King sized bed</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><span style="color:#25aae2;"><u>FACILITIES ROOM:</u></span></p>

<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/shower%20(1).png" style="width: 24px; height: 24px;">&nbsp;Standing shower</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bathroom.png" style="width: 24px; height: 24px;">&nbsp;&nbsp;Bathroom Amenities</p>
</div>
</div>
</div>

<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/bench(1).png" style="width: 24px; height: 24px;">&nbsp; Lounge</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cashier.png" style="width: 24px; height: 24px;">&nbsp; Dining Counter</p>
</div>
</div>
</div>

<div class="row row-3">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/coffee-cup(1).png" style="width: 24px; height: 24px;">&nbsp; Coffee Maker</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kettle(1).png" style="width: 24px; height: 24px;">&nbsp; Kettle</p>
</div>
</div>
</div>

<div class="row row-4">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/safe.png" style="width: 24px; height: 24px;">&nbsp; Safety Box</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/hairdryer(1).png" style="width: 24px; height: 24px;">&nbsp; Hairdryer</p>
</div>
</div>
</div>

<div class="row row-5">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/kitchen(2).png" style="width: 24px; height: 24px;">&nbsp; Kitchenette</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/fridge.png" style="width: 24px; height: 24px;">&nbsp; Refrigerator</p>
</div>
</div>
</div>

<div class="row row-6">
<div class="col col-md-6">
<div class="content">
<p><span style="font-size:14px"><span style="color:#4a4a4a"><span style="font-family:UTM-Avo, sans-serif"><span style="background-color:#ffffff"><img alt="" src="/Image/icon/microwave.png" style="width: 24px; height: 24px;">&nbsp; </span></span></span></span>Microwave</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/wifi(13).png" style="width: 24px; height: 24px;">&nbsp; Free Wifi</p>
</div>
</div>
</div>

<div class="row row-7">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/air-conditioner(1).png" style="width: 24px; height: 24px;">&nbsp; Air-Conditioning</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/phone-call.png" style="width: 24px; height: 24px;">&nbsp; DD Telephone</p>
</div>
</div>
</div>

<div class="row row-8">
<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/cable-tv.png" style="width: 24px; height: 24px;">&nbsp; Satellite TV</p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p><img alt="" src="/Image/icon/stove.png" style="width: 24px; height: 24px;">&nbsp; Two-Plate Induction Stove</p>
</div>
</div>
</div>
</div>
<img alt="" src="https://ksalacarte.goongroup.com/Image/icon/balcony.png">&nbsp; Balcony &amp; Two Chairs</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12" style="width:100%;">
<h2 class="lined-heading"><span>Other rooms</span></h2>
</div>
	  ', 22, 2, 1, N'<p style="text-align: justify;"><span style="color:#25aae2;"><u>FEATURES ROOM:</u></span></p>

<p><em><strong>“Perfect choice for solo travellers or couples”.</strong></em></p>

<p style="text-align: justify;">The LIGHT PLUS offers unparalleled ocean front view with balcony. The studio has exquisite decorations with King sized bed, which is the perfect choice for your romantic getaway. It also has an open-plan living area with private bathroom, well equipped kitchenette and convenience work space.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; View: Ocean front view with balcony</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp;&nbsp; Size: 46 m<sup>2</sup></p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Occupancy: 02 or 03 guests (with extra bed)</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png">&nbsp; Bed type: King sized bed</p>')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (17, N'DELIcious Café & Bakery', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><p style="text-align: justify;">&nbsp;</p>

  <div class="btgrid">
  <div class="row row-1">
  <div class="col col-md-6">
  <div class="content">
  <p><img alt="" src="/Image/Dinning/Untitled-1(3).png" style="width: 100%; height: 100%;"></p>
  </div>
  </div>
  
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: justify;">If you don''t want a full breakfast, just have a homemade pastry and a cup of coffee at Delicious. Your energy level is set to rise! &nbsp;</p>
  
  <p style="text-align: justify;">Delicious offers variety of breakfast choices, quick lunches or take-away meal: fresh salads, sandwiches or pastries.</p>
  
  <p style="text-align: justify;">Great place to sip on a cup of coffee and chill in the relaxed atmosphere. You would definitely love to sit here in the morning or afternoon. Electric power sockets are also available at tables for your devices, great working space!</p>
  
  <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp;<strong> Location: </strong>Lobby</p>
  
  <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Open hour:</strong> 06:00 – 22:00<br>
  <br>
  <a href="https://drive.google.com/open?id=1O-qfO4WB_9NVmc04drywbn0UuL4iOb_L" target="_blank"><img alt="" src="/Image/Dinning/MENU(1).png" style="width: 100%; height: 100%;"></a></p>
  </div>
  </div>
  </div>
  </div>
  </div>
          </div>', 23, 3, 1, N'If you just want a simple breakfast, just drop by DELI to enjoy some cakes and a cup of coffee. Your new energy day will be fully charged immediately.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (18, N'Fishcá Restaurant', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><div class="btgrid">
  <div class="row row-1">
  <div class="col col-md-6">
  <div class="content">
  <p><img alt="" src="/Image/Dinning/FISHC%C3%81.png" style="width: 100%; height: 100%;"></p>
  </div>
  </div>
  
  <div class="col col-md-6">
  <div class="content">
  <p>(Temporarily close for renovation! Thank you for your understanding!)<br>
  <br>
  Set yourself full of energy with nutritious buffet breakfast at our FishCá to prepare for a day of interesting activities. It will be like having breakfast from different continents all in one place.</p>
  
  <p style="text-align: justify;">We offer you affordable, contemporary and casual dining. From Vietnamese to Asian or Western cuisine, we offer fresh and healthy food options.</p>
  
  <p style="text-align: justify;">Come to a beach city like Da Nang, it is unmissable to enjoy seafood. At FishCá we serve a must-try - “seafood steamed on hot rock” which is served at your table. We also have fish tank to keep some kind of seafood fresh.</p>
  </div>
  </div>
  </div>
  
  <div class="row row-2">
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: justify;">In addition, we have “Quiet Elephant” Kids Club onside, parents could enjoy the meals while the kids are playing and entertain in sight.</p>
  
  <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Location:</strong> 2nd Floor</p>
  
  <p style="text-align: justify;"><strong><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; Open hour:</strong></p>
  
  <ul>
    <li style="text-align: justify;">
    <p>Breakfast 6:00 – 10:00</p>
    </li>
    <li style="text-align: justify;">
    <p>Lunch: 11:00 – 14:00</p>
    </li>
    <li style="text-align: justify;">Dinner: 18:00 – 22:00</li>
  </ul>
  
  <p style="text-align: justify;"><br>
  <br>
  <a href="https://drive.google.com/open?id=152OMsvBRm7AVfPJAGQS6TX-t_DoGw3Wq" target="_blank"><img alt="" src="/Image/Dinning/MENU(1).png" style="width: 100%; height: 100%;"></a></p>
  </div>
  </div>
  
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: justify;"><img alt="" src="/Image/Dinning/cas%202.png" style="width: 100%; height: 100%;"></p>
  </div>
  </div>
  </div>
  </div>
  </div>', 26, 3, 1, N'Set yourself full of energy with nutritious buffet breakfast at our FishCá to prepare for a day of interesting activities. It will be like having breakfast from different continents all in one place.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (19, N'The Top Bar', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><div class="btgrid">
  <div class="row row-1">
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: center;"><img alt="" src="/Image/Dinning/top%20bar_1.jpg" style="width: 100%; height: 100%;"></p>
  </div>
  </div>
  
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: justify;"><em><strong>“Trendy and stylish space to chill with your friends and family”.</strong></em></p>
  
  <p style="text-align: justify;">The bar provides stunning views to the sea, Son Tra peninsula and Da Nang city. Both inside or outside terrace atmosphere are perfect to indulge. Weekly entertainment activities with live music or DJ would be the great highlight of this venue.</p>
  
  <p style="text-align: justify;">At The Top, we offer extraordinary menu with extensive cocktaiks and beverages, as well as Vietnamese and international light menu options.</p>
  
  <p style="text-align: justify;">Dessert is a wonderful part of the meal. Our signature Nitro Ice Cream which is melt on the tip of your tounge, which make you an unforgettable culinary adventure! Our ice cream is crafted from the freshest ingredients available and frozen instantly with liquid nitrogen.</p>
  </div>
  </div>
  </div>
  
  <div class="row row-2">
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: justify;">Here is our signature cocktail “A La Carte Special”, the mix of white rum, crème de menthe, blue curacao, pineapple juice and cream milk give it absolutely stunning color - just what you want a cocktail to look like. The taste of summer inside makes this wonderful drink the top-choice all the time.</p>
  
  <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Location: </strong>24th Floor</p>
  
  <div style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp;<strong>Open hour:</strong> 6:00AM – 11:00PM<br>
  &nbsp;</div>
  
  <p style="text-align: center;"><a href="https://drive.google.com/open?id=1XaZVNIMmMK6I-StHeCQyYx0mnuywie4m" target="_blank"><img alt="" src="/Image/Dinning/MENU(1).png" style="height: 100%; width: 100%;"></a></p>
  </div>
  </div>
  
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: center;"><img alt="" src="/Image/Dinning/top%20bar_2(1).jpg" style="width: 100%; height: 100%;"></p>
  </div>
  </div>
  </div>
  </div>
  </div>', 25, 3, 1, N'
The bar provides stunning views to the sea, Son Tra peninsula and Da Nang city. Both inside or outside terrace atmosphere are perfect to indulge.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (20, N'In Room Dinning', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><div class="btgrid">
  <div class="row row-1">
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: center;"><img alt="" src="/Image/Dinning/in-room.jpg" style="width: 100%; height: 100%;"></p>
  </div>
  </div>
  
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: justify;"><br>
  <em><strong>"Memories are made here!"</strong></em></p>
  
  <p style="text-align: justify;">If you can’t bear to leave your comfortable room or would like to extend your dream time a bit longer, just pick up your phone and make an order. Extensive selection of the hotel’s cuisine and beverage options are available for you to enjoy 24 hours a day.</p>
  
  <p style="text-align: justify;">Prefer to cook yourself? Pots &amp; pans are available! At A La Carte, we make you a true ‘home far away from home’.</p>
  
  <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Location:</strong> 24th Floor</p>
  
  <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Open hour:</strong> 6:00AM – 1:00AM</p>
  </div>
  </div>
  </div>
  </div>
  
  <p style="text-align: justify;"><br>
  &nbsp;</p>
  </div>', 24, 3, 1, N'
If you can’t bear to leave your comfortable room or would like to extend your dream time a bit longer, just pick up your phone and make an order.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (21, N'Wine Room', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><div class="btgrid">
  <div class="row row-1">
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: center;"><img alt="" src="/Image/Dinning/wine.jpg" style="height: 100%; width: 100%;"></p>
  </div>
  </div>
  
  <div class="col col-md-6">
  <div class="content">
  <p style="text-align: justify;"><br>
  <em><strong>"The best wines are the ones we drink with friends!".</strong></em></p>
  
  <p style="text-align: justify;">The place for friends to gather, relax and celebrate good times! It is also a great venue for events including wine tasting, luncheons, birthday parties, private events and so much more.</p>
  
  <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Location: </strong>2nd Floor</p>
  </div>
  </div>
  </div>
  </div>
  
  <p style="text-align: justify;">&nbsp;</p>
  </div>', 27, 3, 1, N'
The place for friends to gather, relax and celebrate good times! It is also a great venue for events including wine tasting, luncheons, birthday parties, private events and so much more.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (22, N'INFINITY POOL', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><div class="btgrid">
    <div class="row row-1">
    <div class="col col-md-6">
    <div class="content">
    <p><img alt="" src="/Image/Facilities/1(1).jpg" style="width: 100%; height: 100%;"></p>
    </div>
    </div>
    
    <div class="col col-md-6">
    <div class="content">
    <p style="text-align: justify;"><br>
    Our Infinity Pool offers stunning view as its name. It is all about blurring the lines between the man-made and the natural. Hanging out in an infinity pool allows guest to immerse themselves in stunning mountain and sea landscape at the same time. Add in great cocktails, some amazing snack, and have fun.</p>
    
    <p style="text-align: justify;">We also have kids pool for your children safe and a lounge area with sun beds to chill.</p>
    
    <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Location:</strong> 24th Floor</p>
    
    <p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Open hour:</strong> 6:00 – 19:00</p>
    </div>
    </div>
    </div>
    </div>
    </div>', 28, 6, 1, N'Our Infinity Pool offers stunning view as its name. From here, you will no longer see the boundary between the pool and the vast ocean.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (23, N'FITNESS CENTER', N'<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><div class="btgrid">
    <div class="row row-1">
    <div class="col col-md-6">
    <div class="content">
    <p><img alt="" src="/Image/Facilities/gyms.jpg" style="width: 100%; height: 100%;"></p>
    </div>
    </div>
    
    <div class="col col-md-6">
    <div class="content">
    <p style="text-align: justify;"><br>
<em><strong>"Don''t let your fitness routine stop while you are travelling".</strong></em></p>

<p style="text-align: justify;">Have you tried exercising from the rooftop on the 23th floor yet? Relax your body, mind and soul harmonize with the sky and the sea.</p>

<p style="text-align: justify;">Equiped with standard equipment, guest can tread, row, climb and stretch... ensure you could have a good workout experience.</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Location:</strong> 23rd Floor</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Open hour:</strong> 6:00 – 22:00</p>
    </div>
    </div>
    </div>
    </div>
    </div>', 30, 6, 1, N'Have you tried exercising from the rooftop on the 23th floor yet? Relax your body, mind and soul harmonize with the sky and the sea')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (25, N'SPA', N'<div class="text-center" style="margin-top: 2em">
    <a class="btn btn-default btn-view-all" data-toggle="modal" data-target="#bookspa">Contact us</a>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 noidung_page"><div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p style="text-align: center;"><img alt="" src="/Image/Facilities/spa(3).jpg" style="height: 100%; width: 100%;"></p>
</div>
</div>

<div class="col col-md-6">
<div class="content">
<p style="text-align: justify;"><br>
<em><strong>Spice up your life!</strong></em></p>

<p style="text-align: justify;">A long day of touring and activities may make you feel exhausted. Let us pamper you a little at our Spice Spa. We offer you our highly trained therapists, a wide range of packages combining healing and enhancing techniques with the choice of high-end products.</p>

<p style="text-align: justify;">Listening to your body and understanding it, we use herbal pouch blend to apply on your body and soothe any muscle tension. The smell from herbal pouch also help to relax your mind. Just close your eyes, sit back and relax your body</p>

<p style="text-align: justify;">At Spice Spa, many beauty care services are also offered, we know beauty has no boundary. Come to Spice Spa to get to know the true feeling of indulgence and shine your beauty!</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Location:</strong> 23rd Floor</p>

<p style="text-align: justify;"><img alt="" src="/Image/icon/00(3)(1).png" style="width: 5px; height: 5px;">&nbsp; <strong>Open hour:</strong> 09:00 – 23:00 (last order 22:00)</p>

<p style="text-align: justify;"><strong>Our Special Treats</strong></p>

<p style="text-align: justify;"><span style="color:#25aae2;">♦ </span>The more the merrier: Buy 4 pay 3 for all services and treatments.</p>

<p style="text-align: justify;">&nbsp;Bringging in your buddies to our spa and only get to pay 3 for group of 4. Is this special offer fit your family size? Come and relax!</p>

<p style="text-align: justify;"><span style="color:#25aae2;">♦ </span>Love your body: Let your stress melt away and leave all behind. Choose our unique Spice Oils and Bundles to pamper your soul. We give you 15% discount for all body treatments.</p>
</div>
</div>
</div>
</div>
</div>', 29, 6, 1, N'Let us pamper you a little at our Spice Spa. We offer you our highly trained therapists, a wide range of packages combining healing and enhancing techniques with the choice of high-end products.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (26, N'Tàu sân bay Trung Quốc lại vào Biển Đông?', N'<div class="l-content">
<div class="pswp-content">
<div class="sapo" id="chapeau">
<div>
<p><strong>Truyền th&ocirc;ng Hồng K&ocirc;ng vừa đưa tin nh&oacute;m t&aacute;c chiến t&agrave;u s&acirc;n bay Li&ecirc;u Ninh của <a href="https://thanhnien.vn/trung-quoc/" rel="">Trung Quốc</a> h&ocirc;m nay 10.4 vừa tiến v&agrave;o Biển Đ&ocirc;ng sau khi tập trận gần Đ&agrave;i Loan.</strong></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:https://localhost:44314/f640f302-4fd1-4443-91e5-414babc8b994" width="660" />
<figcaption></figcaption>
</figure>

<p>Chiều nay, truyền th&ocirc;ng Hồng K&ocirc;ng đưa tin nh&oacute;m t&aacute;c chiến t&agrave;u s&acirc;n bay Li&ecirc;u Ninh s&aacute;ng nay đ&atilde; bắt đầu tiến v&agrave;o Biển Đ&ocirc;ng. Trước khi v&agrave;o Biển Đ&ocirc;ng, nh&oacute;m chiến hạm n&agrave;y đ&atilde; c&oacute; cuộc tập trận ở v&ugrave;ng biển gần Đ&agrave;i Loan giữa bối cảnh t&igrave;nh h&igrave;nh 2 bờ eo biển đang căng thẳng.</p>

<p>Theo Bộ Quốc ph&ograve;ng Nhật Bản, t&agrave;u s&acirc;n bay Li&ecirc;u Ninh của Trung Quốc đ&atilde; đi qua eo biển Miyako từ khuya 3.4 cho đến rạng s&aacute;ng 4.4. Lực lượng hộ tống t&agrave;u n&agrave;y gồm c&oacute; 2 t&agrave;u khu trục Type 052D, 1 t&agrave;u khu trục Type 055, 1 t&agrave;u hộ tống Type 054A v&agrave; 1 t&agrave;u hỗ trợ Type 901.</p>

<p>Theo đ&oacute;, nh&oacute;m t&agrave;u chiến n&agrave;y đ&atilde; di chuyển từ biển Hoa Đ&ocirc;ng, đi qua eo biển giữa đảo ch&iacute;nh của quần đảo Okinawa với đảo Miyakojima, rồi tập trận ở v&ugrave;ng biển gần Đ&agrave;i Loan, v&agrave; nay tiến v&agrave;o Biển Đ&ocirc;ng. Hồi th&aacute;ng 4.2020, nh&oacute;m t&aacute;c chiến t&agrave;u s&acirc;n bay Li&ecirc;u Ninh vượt qua eo biển Miyako, eo Ba Sĩ v&agrave; tiến v&agrave;o Biển Đ&ocirc;ng để tổ chức tập trận.</p>

<p>Như vậy, hải tr&igrave;nh của nh&oacute;m t&aacute;c chiến t&agrave;u s&acirc;n bay Li&ecirc;u Ninh lần n&agrave;y kh&aacute; giống với hải tr&igrave;nh hồi th&aacute;ng 4.2020. Tuy nhi&ecirc;n, trong đợt ra khơi n&agrave;y, nh&oacute;m t&aacute;c chiến t&agrave;u s&acirc;n bay Li&ecirc;u Ninh c&oacute; sự hiện diện của một <a href="https://thanhnien.vn/the-gioi/chien-ham-khung-trung-quoc-trong-doi-hinh-tau-san-bay-1365003.html" rel="" target="_blank">t&agrave;u khu trục loại Type 055</a>. Đ&acirc;y l&agrave; t&agrave;u khu trục &ldquo;khủng&rdquo; nhất của hải qu&acirc;n Trung Quốc hiện nay.</p>

<p>Trả lời <em>Thanh Ni&ecirc;n</em>, một số chuy&ecirc;n gia quốc tế nhận định rằng kh&ocirc;ng loại trừ khả năng đợt n&agrave;y, nh&oacute;m t&aacute;c chiến t&agrave;u s&acirc;n bay Li&ecirc;u Ninh sẽ tổ chức tập trận ở Biển Đ&ocirc;ng. Sự hiện diện của h&agrave;ng kh&ocirc;ng mẫu hạm Li&ecirc;u Ninh diễn ra trong bối cảnh Bắc Kinh c&oacute; nhiều động th&aacute;i g&acirc;y căng thẳng ở Biển Đ&ocirc;ng.</p>

<p>Cụ thể, mới đ&acirc;y, Trung Quốc đ&atilde; điều động h&agrave;ng trăm t&agrave;u d&acirc;n binh xuất hiện gần b&atilde;i Ba Đầu ở quần đảo Trường Sa thuộc chủ quyền Việt Nam. Trung Quốc cũng điều động nhiều <a href="https://thanhnien.vn/the-gioi/dieu-dong-tau-ten-lua-den-truong-sa-trung-quoc-dang-am-muu-gi-1362997.html" rel="" target="_blank">t&agrave;u t&ecirc;n lửa tấn c&ocirc;ng nhanh</a> Type 022 đến Trường Sa g&acirc;y nhiều quan ngại.</p>

<p>Li&ecirc;n quan t&igrave;nh h&igrave;nh Biển Đ&ocirc;ng, Mỹ vừa điều động nh&oacute;m t&aacute;c chiến t&agrave;u s&acirc;n bay USS Theodore Roosevelt v&agrave; nh&oacute;m t&aacute;c chiến sẵn s&agrave;ng đổ bộ USS Makin Island <a href="https://thanhnien.vn/the-gioi/my-dieu-dong-suc-manh-phoi-hop-tan-cong-den-bien-dong-1365761.html" rel="" target="_blank">phối hợp hoạt động viễn chinh</a> ở v&ugrave;ng biển n&agrave;y.</p>
</div>
</div>
</div>
</div>
', 35, 5, 1, N'Truyền thông Hồng Kông vừa đưa tin nhóm tác chiến tàu sân bay Liêu Ninh của Trung Quốc hôm nay 10.4 vừa tiến vào Biển Đông sau khi tập trận gần Đài Loan.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (27, N'TP.HCM: Cổng Bệnh viện Nhi đồng 2 có lịch sử trăm năm bị xe 7 chỗ ''tông gục''', N'<p><strong>Cổng ch&iacute;nh, một biểu tượng của Bệnh viện Nhi đồng 2, được x&acirc;y dựng bằng gạch, c&oacute; cả trăm năm tuổi, đ&atilde; bị một chiếc xe 7 chỗ &#39;t&ocirc;ng gục&#39; v&agrave;o rạng s&aacute;ng nay 10.4.</strong></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:https://localhost:44314/8730737e-c317-4b1f-9d37-be778e76f9fc" width="660" />
<figcaption></figcaption>
</figure>

<div>Theo nguồn tin của PV <em>Thanh Ni&ecirc;n</em>, v&agrave;o l&uacute;c 2 giờ ng&agrave;y 10.4, một chiếc xe 7 chỗ mang BS 51F - 1843&hellip; đ&atilde; &quot;t&ocirc;ng gục&rdquo; cổng<a href="https://thanhnien.vn/van-hoa/benh-vien-nhi-dong-2-tro-thanh-di-tich-708432.html" rel="" target="_blank"> Bệnh viện Nhi đồng 2</a>, số 14 L&yacute; Tự Trọng, P.Bến Ngh&eacute;, Q.1, TP.HCM.</div>

<div>&nbsp;</div>

<div>C&ugrave;ng ng&agrave;y, l&atilde;nh đạo Bệnh viện Nhi đồng 2 x&aacute;c nhận về vụ việc tr&ecirc;n. L&atilde;nh đạo Bệnh viện Nhi đồng 2 cho biết th&ecirc;m, 2 trụ cổng&nbsp;<a href="https://thanhnien.vn/suc-khoe/benh-vien-nhi-dong-2-hai-tuan-cap-cuu-4-tre-duoi-nuoc-1224286.html" rel="" target="_blank">x&acirc;y bằng gạch từ thời Ph&aacute;p</a>, cả trăm năm tuổi, c&oacute; d&ograve;ng chữ GRALL. Hiện ph&iacute;a c&ocirc;ng an, bệnh viện v&agrave; chủ xe đang l&agrave;m việc để x&acirc;y lại cổng mới theo h&igrave;nh d&aacute;ng như cũ.</div>

<div>&nbsp;</div>

<div>Chiều 10.4, PV <em>Thanh Ni&ecirc;n</em> đ&atilde; c&oacute; mặt tại số 14 L&yacute; Tự Trọng. Theo th&ocirc;ng tin ban đầu, chiếc xe 7 chỗ n&oacute;i tr&ecirc;n chạy từ hướng đường Th&aacute;i Văn Lung, ra đến ng&atilde; 3 Th&aacute;i Văn Lung - L&yacute; Tự Trọng th&igrave; bất ngờ đ&acirc;m thẳng v&agrave;o cổng Bệnh viện Nhi đồng 2, khiến chiếc cổng x&acirc;y bằng gạch đổ gục.&nbsp;<a href="https://thanhnien.vn/thoi-su/tai-nan-kinh-hoang-o-to-dien-tong-7-nguoi-thuong-vong-tam-giu-tai-xe-1366313.html" rel="" target="_blank">T&agrave;i xế</a>&nbsp;an to&agrave;n sau vụ tai nạn.</div>

<div>&nbsp;</div>

<div>Chiều muộn ng&agrave;y 10.4, c&aacute;c c&ocirc;ng nh&acirc;n đ&atilde; dọn dẹp xong cổng gạch ng&atilde; đổ của Bệnh viện Nhi đồng 2.</div>

<div>&nbsp;</div>

<div>
<div class="has-background quote">
<div class="quote__content">
<div>&nbsp;Năm 1862, qu&acirc;n đội Ph&aacute;p th&agrave;nh lập Bệnh viện <a href="https://thanhnien.vn/the-gioi/quan-su/" rel="">Qu&acirc;n sự</a> (H&ocirc;pital militaire). Cơ sở n&agrave;y v&agrave;o cuối thập ni&ecirc;n 1870 chuyển về số 14 rue Lagrandi&egrave;re, tức địa điểm hiện nay (14 L&yacute; Tự Trọng, P. Bến Ngh&eacute;, Q.1, TP.HCM). Năm 1925, Bệnh viện Qu&acirc;n sự ch&iacute;nh thức đổi t&ecirc;n th&agrave;nh &quot;Bệnh viện Grall&quot; để vinh danh Gi&aacute;m đốc y tế Nam Kỳ (b&aacute;c sĩ Charles Grall)... Năm 1978, Bệnh viện Grall đổi t&ecirc;n th&agrave;nh Bệnh viện Nhi đồng 2 v&agrave; trở th&agrave;nh bệnh viện chuy&ecirc;n khoa nhi phụ tr&aacute;ch kh&aacute;m v&agrave; điều trị bệnh cho c&aacute;c b&eacute; từ 0 đến dưới 16 tuổi.</div>
</div>
</div>
</div>
', 36, 5, 1, N'Cổng chính, một biểu tượng của Bệnh viện Nhi đồng 2, được xây dựng bằng gạch, có cả trăm năm tuổi, đã bị một chiếc xe 7 chỗ ''tông gục'' vào rạng sáng nay 10.4.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (28, N'Ô tô ‘điên’ tông hàng loạt xe máy, 2 người tử vong: Tài xế có nồng độ cồn', N'<p><strong>Cổng ch&iacute;nh, một biểu tượng của Bệnh viện Nhi đồng 2, được x&acirc;y dựng bằng gạch, c&oacute; cả trăm năm tuổi, đ&atilde; bị một chiếc xe 7 chỗ &#39;t&ocirc;ng gục&#39; v&agrave;o rạng s&aacute;ng nay 10.4.</strong></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:https://localhost:44314/8730737e-c317-4b1f-9d37-be778e76f9fc" width="660" />
<figcaption></figcaption>
</figure>

<div>Theo nguồn tin của PV <em>Thanh Ni&ecirc;n</em>, v&agrave;o l&uacute;c 2 giờ ng&agrave;y 10.4, một chiếc xe 7 chỗ mang BS 51F - 1843&hellip; đ&atilde; &quot;t&ocirc;ng gục&rdquo; cổng<a href="https://thanhnien.vn/van-hoa/benh-vien-nhi-dong-2-tro-thanh-di-tich-708432.html" rel="" target="_blank"> Bệnh viện Nhi đồng 2</a>, số 14 L&yacute; Tự Trọng, P.Bến Ngh&eacute;, Q.1, TP.HCM.</div>

<div>&nbsp;</div>

<div>C&ugrave;ng ng&agrave;y, l&atilde;nh đạo Bệnh viện Nhi đồng 2 x&aacute;c nhận về vụ việc tr&ecirc;n. L&atilde;nh đạo Bệnh viện Nhi đồng 2 cho biết th&ecirc;m, 2 trụ cổng&nbsp;<a href="https://thanhnien.vn/suc-khoe/benh-vien-nhi-dong-2-hai-tuan-cap-cuu-4-tre-duoi-nuoc-1224286.html" rel="" target="_blank">x&acirc;y bằng gạch từ thời Ph&aacute;p</a>, cả trăm năm tuổi, c&oacute; d&ograve;ng chữ GRALL. Hiện ph&iacute;a c&ocirc;ng an, bệnh viện v&agrave; chủ xe đang l&agrave;m việc để x&acirc;y lại cổng mới theo h&igrave;nh d&aacute;ng như cũ.</div>

<div>&nbsp;</div>

<div>Chiều 10.4, PV <em>Thanh Ni&ecirc;n</em> đ&atilde; c&oacute; mặt tại số 14 L&yacute; Tự Trọng. Theo th&ocirc;ng tin ban đầu, chiếc xe 7 chỗ n&oacute;i tr&ecirc;n chạy từ hướng đường Th&aacute;i Văn Lung, ra đến ng&atilde; 3 Th&aacute;i Văn Lung - L&yacute; Tự Trọng th&igrave; bất ngờ đ&acirc;m thẳng v&agrave;o cổng Bệnh viện Nhi đồng 2, khiến chiếc cổng x&acirc;y bằng gạch đổ gục.&nbsp;<a href="https://thanhnien.vn/thoi-su/tai-nan-kinh-hoang-o-to-dien-tong-7-nguoi-thuong-vong-tam-giu-tai-xe-1366313.html" rel="" target="_blank">T&agrave;i xế</a>&nbsp;an to&agrave;n sau vụ tai nạn.</div>

<div>&nbsp;</div>

<div>Chiều muộn ng&agrave;y 10.4, c&aacute;c c&ocirc;ng nh&acirc;n đ&atilde; dọn dẹp xong cổng gạch ng&atilde; đổ của Bệnh viện Nhi đồng 2.</div>

<div>&nbsp;</div>

<div>
<div class="has-background quote">
<div class="quote__content">
<div>&nbsp;Năm 1862, qu&acirc;n đội Ph&aacute;p th&agrave;nh lập Bệnh viện <a href="https://thanhnien.vn/the-gioi/quan-su/" rel="">Qu&acirc;n sự</a> (H&ocirc;pital militaire). Cơ sở n&agrave;y v&agrave;o cuối thập ni&ecirc;n 1870 chuyển về số 14 rue Lagrandi&egrave;re, tức địa điểm hiện nay (14 L&yacute; Tự Trọng, P. Bến Ngh&eacute;, Q.1, TP.HCM). Năm 1925, Bệnh viện Qu&acirc;n sự ch&iacute;nh thức đổi t&ecirc;n th&agrave;nh &quot;Bệnh viện Grall&quot; để vinh danh Gi&aacute;m đốc y tế Nam Kỳ (b&aacute;c sĩ Charles Grall)... Năm 1978, Bệnh viện Grall đổi t&ecirc;n th&agrave;nh Bệnh viện Nhi đồng 2 v&agrave; trở th&agrave;nh bệnh viện chuy&ecirc;n khoa nhi phụ tr&aacute;ch kh&aacute;m v&agrave; điều trị bệnh cho c&aacute;c b&eacute; từ 0 đến dưới 16 tuổi.</div>
</div>
</div>
</div>
', 37, 5, 1, N'Cổng chính, một biểu tượng của Bệnh viện Nhi đồng 2, được xây dựng bằng gạch, có cả trăm năm tuổi, đã bị một chiếc xe 7 chỗ ''tông gục'' vào rạng sáng nay 10.4.')
INSERT [dbo].[Advertisement] ([id], [adName], [AdDescription], [img_id], [tyepId], [priority], [summary]) VALUES (29, N'Ô tô ‘điên’ tông hàng loạt xe máy, 2 người tử vong: Tài xế có nồng độ cồn', N'<p><strong>Cổng ch&iacute;nh, một biểu tượng của Bệnh viện Nhi đồng 2, được x&acirc;y dựng bằng gạch, c&oacute; cả trăm năm tuổi, đ&atilde; bị một chiếc xe 7 chỗ &#39;t&ocirc;ng gục&#39; v&agrave;o rạng s&aacute;ng nay 10.4.</strong></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:https://localhost:44314/8730737e-c317-4b1f-9d37-be778e76f9fc" width="660" />
<figcaption></figcaption>
</figure>

<div>Theo nguồn tin của PV <em>Thanh Ni&ecirc;n</em>, v&agrave;o l&uacute;c 2 giờ ng&agrave;y 10.4, một chiếc xe 7 chỗ mang BS 51F - 1843&hellip; đ&atilde; &quot;t&ocirc;ng gục&rdquo; cổng<a href="https://thanhnien.vn/van-hoa/benh-vien-nhi-dong-2-tro-thanh-di-tich-708432.html" rel="" target="_blank"> Bệnh viện Nhi đồng 2</a>, số 14 L&yacute; Tự Trọng, P.Bến Ngh&eacute;, Q.1, TP.HCM.</div>

<div>&nbsp;</div>

<div>C&ugrave;ng ng&agrave;y, l&atilde;nh đạo Bệnh viện Nhi đồng 2 x&aacute;c nhận về vụ việc tr&ecirc;n. L&atilde;nh đạo Bệnh viện Nhi đồng 2 cho biết th&ecirc;m, 2 trụ cổng&nbsp;<a href="https://thanhnien.vn/suc-khoe/benh-vien-nhi-dong-2-hai-tuan-cap-cuu-4-tre-duoi-nuoc-1224286.html" rel="" target="_blank">x&acirc;y bằng gạch từ thời Ph&aacute;p</a>, cả trăm năm tuổi, c&oacute; d&ograve;ng chữ GRALL. Hiện ph&iacute;a c&ocirc;ng an, bệnh viện v&agrave; chủ xe đang l&agrave;m việc để x&acirc;y lại cổng mới theo h&igrave;nh d&aacute;ng như cũ.</div>

<div>&nbsp;</div>

<div>Chiều 10.4, PV <em>Thanh Ni&ecirc;n</em> đ&atilde; c&oacute; mặt tại số 14 L&yacute; Tự Trọng. Theo th&ocirc;ng tin ban đầu, chiếc xe 7 chỗ n&oacute;i tr&ecirc;n chạy từ hướng đường Th&aacute;i Văn Lung, ra đến ng&atilde; 3 Th&aacute;i Văn Lung - L&yacute; Tự Trọng th&igrave; bất ngờ đ&acirc;m thẳng v&agrave;o cổng Bệnh viện Nhi đồng 2, khiến chiếc cổng x&acirc;y bằng gạch đổ gục.&nbsp;<a href="https://thanhnien.vn/thoi-su/tai-nan-kinh-hoang-o-to-dien-tong-7-nguoi-thuong-vong-tam-giu-tai-xe-1366313.html" rel="" target="_blank">T&agrave;i xế</a>&nbsp;an to&agrave;n sau vụ tai nạn.</div>

<div>&nbsp;</div>

<div>Chiều muộn ng&agrave;y 10.4, c&aacute;c c&ocirc;ng nh&acirc;n đ&atilde; dọn dẹp xong cổng gạch ng&atilde; đổ của Bệnh viện Nhi đồng 2.</div>

<div>&nbsp;</div>

<div>
<div class="has-background quote">
<div class="quote__content">
<div>&nbsp;Năm 1862, qu&acirc;n đội Ph&aacute;p th&agrave;nh lập Bệnh viện <a href="https://thanhnien.vn/the-gioi/quan-su/" rel="">Qu&acirc;n sự</a> (H&ocirc;pital militaire). Cơ sở n&agrave;y v&agrave;o cuối thập ni&ecirc;n 1870 chuyển về số 14 rue Lagrandi&egrave;re, tức địa điểm hiện nay (14 L&yacute; Tự Trọng, P. Bến Ngh&eacute;, Q.1, TP.HCM). Năm 1925, Bệnh viện Qu&acirc;n sự ch&iacute;nh thức đổi t&ecirc;n th&agrave;nh &quot;Bệnh viện Grall&quot; để vinh danh Gi&aacute;m đốc y tế Nam Kỳ (b&aacute;c sĩ Charles Grall)... Năm 1978, Bệnh viện Grall đổi t&ecirc;n th&agrave;nh Bệnh viện Nhi đồng 2 v&agrave; trở th&agrave;nh bệnh viện chuy&ecirc;n khoa nhi phụ tr&aacute;ch kh&aacute;m v&agrave; điều trị bệnh cho c&aacute;c b&eacute; từ 0 đến dưới 16 tuổi.</div>
</div>
</div>
</div>
', 38, 5, 1, N'Cổng chính, một biểu tượng của Bệnh viện Nhi đồng 2, được xây dựng bằng gạch, có cả trăm năm tuổi, đã bị một chiếc xe 7 chỗ ''tông gục'' vào rạng sáng nay 10.4.')
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [name], [email], [noidung], [adId]) VALUES (1, N'iwsagfd', N'jsdhg', N'dsjkghf', 2)
INSERT [dbo].[Comment] ([id], [name], [email], [noidung], [adId]) VALUES (2, N'Hêlio', N'asdjkhgf@gmail,com', N'skdjhgfituetyr iuik siadutyflkgasutl yuiguirewius aisiold kld ihsifskuadgio iaias fooidhfo  saodfi', 19)
INSERT [dbo].[Comment] ([id], [name], [email], [noidung], [adId]) VALUES (3, N'Hello', N'kajsghf', N'Teest', 19)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerType] ON 

INSERT [dbo].[CustomerType] ([id], [CustomerType], [description]) VALUES (1, N'Khách lẻ', N'Khách lẻ')
SET IDENTITY_INSERT [dbo].[CustomerType] OFF
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
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (16, N'sp_57.jpg', N'Light Studio', 2, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (17, N'sp_58.jpg', N'Light Plus Studio', 2, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (18, N'sp_59.jpg', N'Delight Ocean View Apartment', 2, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (19, N'sp_62.jpg', N'Delight City View Apartment', 2, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (20, N'sp_63.jpg', N'Delight Plus Apartment', 2, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (21, N'sp_76.jpg', N'Hightlight Apartment', 2, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (22, N'sp_77.jpg', N'Hightlight Plus Apartment', 2, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (23, N'sp_49.jpg', N'DELIcious Café & Bakery', 3, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (24, N'sp_58.jpg', N'In Room Dinning', 3, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (25, N'sp_60.jpg', N'The Top Bar', 3, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (26, N'sp_61.jpg', N'Fishcá Restaurant', 3, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (27, N'sp_77.jpg', N'Wine Room', 3, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (28, N'dv_78.jpg', N'Infinity Pool', 6, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (29, N'dv_82.jpg', N'Spice Spa', 6, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (30, N'dv_52.jpg', N'Fitness Center', 6, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (31, N'147302383_2880477748876071_4465967106086754511_n.jpg', N'sdfg', 5, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (32, N'151645912_275974703883403_7909489108495735276_n.jpg', N'sdfg', 5, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (33, N'151645912_275974703883403_7909489108495735276_n.jpg', N'sdfg', 5, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (34, N'151645912_275974703883403_7909489108495735276_n.jpg', N'sdfg', 5, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (35, N'liaoning_njkt.jpg', N'Tàu sân bay Trung Quốc lại vào Biển Đông?', 5, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (36, N'20210410_163238_fuyg.jpg', N'TP.HCM: Cổng Bệnh viện Nhi đồng 2 có lịch sử trăm năm bị xe 7 chỗ ''tông gục''', 5, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (37, N'starlink_spacex_54747474_cyyz.jpg', N'Ô tô ‘điên’ tông hàng loạt xe máy, 2 người tử vong: Tài xế có nồng độ cồn', 5, 0)
INSERT [dbo].[Gallery] ([id], [img], [caption], [typeId], [active]) VALUES (38, N'starlink_spacex_54747474_cyyz.jpg', N'Ô tô ‘điên’ tông hàng loạt xe máy, 2 người tử vong: Tài xế có nồng độ cồn', 5, 0)
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
SET IDENTITY_INSERT [dbo].[GalleryType] ON 

INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (1, N'Banner')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (2, N'Room')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (3, N'Dinning')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (4, N'Service')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (5, N'News')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (6, N'Facility')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (7, N'Destination')
INSERT [dbo].[GalleryType] ([id], [typeName]) VALUES (8, N'Promotion')
SET IDENTITY_INSERT [dbo].[GalleryType] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (1, N'234', 1, 1, NULL, NULL)
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (2, N'da65843', 2, 1, NULL, CAST(N'2022-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (3, N'706749e', 2, 1, NULL, CAST(N'2022-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (4, N'a229ab3', 2, 1, NULL, CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (5, N'22d3b43', 2, 1, NULL, CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (6, N'5cea1d9', 2, 1, NULL, CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (7, N'37d0747', 2, 1, NULL, CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (8, N'647813d', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (9, N'd784bf4', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (10, N'b341e53', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (11, N'b2e5dd6', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (12, N'81670d2', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (13, N'45b018f', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (14, N'1d2744c', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (15, N'e74c594', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (16, N'abaa0c7', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (17, N'3cd14fc', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (18, N'ed48a57', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (19, N'53706c6', 5, 1, NULL, CAST(N'2021-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (20, N'aa07d7c', 6, 1, NULL, CAST(N'2021-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (21, N'91ba4eb', 6, 1, NULL, CAST(N'2021-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (22, N'169e0a4', 6, 1, NULL, CAST(N'2021-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (23, N'7a57809', 6, 1, NULL, CAST(N'2021-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (24, N'0499c72', 6, 1, NULL, CAST(N'2021-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (25, N'ea410f3', 2, 1, NULL, CAST(N'2021-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (26, N'd345d7c', 2, 1, NULL, CAST(N'2021-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [code], [typeID], [State], [use_date], [expiration_date]) VALUES (27, N'40640c0', 2, 1, NULL, CAST(N'2021-02-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[PromotionType] ON 

INSERT [dbo].[PromotionType] ([id], [PromotionType], [discost]) VALUES (1, N'Discost10', 0.1)
INSERT [dbo].[PromotionType] ([id], [PromotionType], [discost]) VALUES (2, N'Hello21', 0.20000000298023224)
INSERT [dbo].[PromotionType] ([id], [PromotionType], [discost]) VALUES (5, N'GiamGia10', 0.10000000149011612)
INSERT [dbo].[PromotionType] ([id], [PromotionType], [discost]) VALUES (6, N'Dis20', 0.20000000298023224)
SET IDENTITY_INSERT [dbo].[PromotionType] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [roleName]) VALUES (0, N'admin')
INSERT [dbo].[Roles] ([id], [roleName]) VALUES (1, N'seller')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (2, N'P021', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (3, N'P031', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (4, N'P041', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (5, N'P051', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (6, N'P061', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (7, N'P071', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (8, N'P081', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (9, N'P091', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (10, N'P101', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (11, N'P111', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (12, N'P121', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (13, N'P131', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (14, N'P141', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (15, N'P151', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (16, N'P161', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (17, N'P171', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (18, N'P181', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (19, N'P191', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (20, N'P201', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (21, N'P211', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (22, N'P221', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (23, N'P231', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (24, N'P241', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (25, N'P012', 1, 1, 1300000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (26, N'P022', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (27, N'P032', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (28, N'P042', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (29, N'P052', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (30, N'P062', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (31, N'P072', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (32, N'P082', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (33, N'P092', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (34, N'P102', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (35, N'P112', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (36, N'P122', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (37, N'P132', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (38, N'P142', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (39, N'P152', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (40, N'P162', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (41, N'P172', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (42, N'P182', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (43, N'P192', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (44, N'P202', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (45, N'P212', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (46, N'P222', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (47, N'P232', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (48, N'P242', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (49, N'P013', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (50, N'P023', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (51, N'P033', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (52, N'P043', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (53, N'P053', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (54, N'P063', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (55, N'P073', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (56, N'P083', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (57, N'P093', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (58, N'P103', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (59, N'P113', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (60, N'P123', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (61, N'P133', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (62, N'P143', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (63, N'P153', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (64, N'P163', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (65, N'P173', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (66, N'P183', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (67, N'P193', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (68, N'P203', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (69, N'P213', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (70, N'P223', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (71, N'P233', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (72, N'P243', 1, 1, 1200000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (73, N'P015', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (74, N'P025', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (75, N'P035', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (76, N'P045', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (77, N'P055', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (78, N'P065', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (79, N'P075', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (80, N'P085', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (81, N'P095', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (82, N'P105', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (83, N'P115', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (84, N'P125', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (85, N'P135', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (86, N'P145', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (87, N'P155', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (88, N'P165', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (89, N'P175', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (90, N'P185', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (91, N'P195', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (92, N'P205', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (93, N'P215', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (94, N'P225', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (95, N'P235', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (97, N'P016', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (98, N'P026', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (99, N'P036', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (100, N'P046', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (101, N'P056', 1, 3, 2100000)
GO
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (102, N'P066', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (103, N'P076', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (104, N'P086', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (105, N'P096', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (106, N'P106', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (107, N'P116', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (108, N'P126', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (109, N'P136', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (110, N'P146', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (111, N'P156', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (112, N'P166', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (113, N'P176', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (114, N'P186', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (115, N'P196', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (116, N'P206', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (117, N'P216', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (118, N'P226', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (119, N'P236', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (120, N'P246', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (121, N'P017', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (122, N'P027', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (123, N'P037', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (124, N'P047', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (125, N'P057', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (126, N'P067', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (127, N'P077', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (128, N'P087', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (129, N'P097', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (130, N'P107', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (131, N'P117', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (132, N'P127', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (133, N'P137', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (134, N'P147', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (135, N'P157', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (136, N'P167', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (137, N'P177', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (138, N'P187', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (139, N'P197', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (140, N'P207', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (141, N'P217', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (142, N'P227', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (143, N'P237', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (144, N'P247', 1, 3, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (193, N'P018', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (194, N'P028', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (195, N'P038', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (196, N'P048', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (197, N'P058', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (198, N'P068', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (199, N'P078', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (200, N'P088', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (201, N'P098', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (202, N'P108', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (203, N'P118', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (204, N'P128', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (205, N'P138', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (206, N'P148', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (207, N'P158', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (208, N'P168', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (209, N'P178', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (210, N'P188', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (211, N'P198', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (212, N'P208', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (213, N'P218', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (214, N'P228', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (215, N'P238', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (216, N'P248', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (217, N'P019', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (218, N'P029', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (219, N'P039', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (220, N'P049', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (221, N'P059', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (222, N'P069', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (223, N'P079', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (224, N'P089', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (225, N'P099', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (226, N'P109', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (227, N'P119', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (228, N'P129', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (229, N'P139', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (230, N'P149', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (231, N'P159', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (232, N'P169', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (233, N'P179', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (234, N'P189', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (235, N'P199', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (236, N'P209', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (237, N'P219', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (238, N'P229', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (239, N'P239', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (240, N'P249', 1, 4, 2100000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (241, N'P251', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (242, N'P261', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (243, N'P271', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (244, N'P281', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (245, N'P291', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (246, N'P301', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (247, N'P252', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (248, N'P262', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (249, N'P272', 1, 6, 2700000)
GO
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (250, N'P282', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (251, N'P292', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (252, N'P302', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (253, N'P253', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (254, N'P263', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (255, N'P273', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (256, N'P283', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (257, N'P293', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (258, N'P303', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (259, N'P254', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (260, N'P264', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (261, N'P274', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (262, N'P284', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (263, N'P294', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (264, N'P304', 1, 6, 2700000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (265, N'P255', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (266, N'P265', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (267, N'P275', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (268, N'P285', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (269, N'P295', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (270, N'P305', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (271, N'P256', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (272, N'P266', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (273, N'P276', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (274, N'P286', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (275, N'P296', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (276, N'P306', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (277, N'P257', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (278, N'P267', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (279, N'P277', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (280, N'P287', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (281, N'P297', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (282, N'P307', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (283, N'P258', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (284, N'P268', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (285, N'P278', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (286, N'P288', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (287, N'P298', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (288, N'P308', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (289, N'P259', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (290, N'P269', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (291, N'P279', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (292, N'P289', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (293, N'P299', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (294, N'P309', 1, 7, 3000000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (1007, N'P011', 1, 2, 1400000)
INSERT [dbo].[Room] ([id], [room], [RoomState], [typeID], [price]) VALUES (1011, N'P516', 1, 1, 1200000)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (1, N'Light Studio', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (2, N'Light Plus Studio', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (3, N'Delight Ocean View Apartment', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (4, N'Delight City View Apartment', 3)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (5, N'Delight Plus Apartment', 6)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (6, N'Hightlight Apartment', 6)
INSERT [dbo].[RoomType] ([id], [Roomtype], [size]) VALUES (7, N'Hightlight Plus Apartment', 6)
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
INSERT [dbo].[Users] ([id], [userName], [pwd], [role_id]) VALUES (N'1', N'admin', N'123', 0)
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [DF_Gallery_active]  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[Promotion] ADD  CONSTRAINT [DF_Promotion_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_RoomState]  DEFAULT ((1)) FOR [RoomState]
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
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Advertisement] FOREIGN KEY([adId])
REFERENCES [dbo].[Advertisement] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Advertisement]
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
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 5/4/2021 8:31:55 AM ******/
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
